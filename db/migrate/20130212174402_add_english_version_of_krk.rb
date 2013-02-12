# encoding: utf-8
require "flickr-objects"
require "active_support/core_ext/string/strip"

class AddEnglishVersionOfKrk < ActiveRecord::Migration
  def up
    post = Post.where("title_hr ILIKE 'Zimski program na Krku%'").first
    post.album.photos.destroy_all

    Flickr.configure do |config|
      config.api_key             = ENV["FLICKR_API_KEY"]
      config.shared_secret       = ENV["FLICKR_SHARED_SECRET"]
      config.access_token_key    = ENV["FLICKR_ACCESS_TOKEN_KEY"]
      config.access_token_secret = ENV["FLICKR_ACCESS_TOKEN_SECRET"]
    end

    set = Flickr.sets.find("72157632553983386").get_info!
    photos = set.get_photos(sizes: :all)
    album = post.album
    album.photos.create(photos.map do |photo|
      {
        uid:           photo.id,
        url:           photo.url,

        large_url:     photo.large1024_or_smaller.source_url,
        large_width:   photo.large1024_or_smaller.width,
        large_height:  photo.large1024_or_smaller.height,

        medium_url:    photo.medium640_or_smaller.source_url,
        medium_width:  photo.medium640_or_smaller.width,
        medium_height: photo.medium640_or_smaller.height,

        small_url:     photo.small240_or_smaller.source_url,
        small_width:   photo.small240_or_smaller.width,
        small_height:  photo.small240_or_smaller.height,

        title:         photo.title,
        stored_on:     "flickr",
      }
    end)
    primary_photo = photos.find(set.primary_photo.id)
    album.update_attributes(cover_photo: album.photos.find_by_uid(primary_photo.id))

    post.update_attributes!(
      title_en: "Adventure on Krk island (3--9.01.2013.)",
      body_en: <<-EOS.strip_heredoc,
        This winter we decided to ignore snow and organize an Outward Bound program near the sea on Krk Island. Program was organized with the support of *Ministry of Science, Education and Sport*. They recognized our positive contribution to young people’s lives. We arrived to Krk on 3th of January 2013 and we spent one exciting week there. Our participants were from Samobor and Kaštel children’s homes and from Zagreb high schools. Different ambience of living in combination with various characters of our participants gave our program lots of dynamics and made it quite an adventure. 

        Our young participants can be very proud on their successful south Krk hiking, especially on places where it seemed that sharp stones were growing from the ground. They learned on every step of the way. So some of them learned when is the time to stop, and some of them when is the time to go all the way. They had an opportunity to learn how to divide work among themselves and how to turn some place in the wood into home in no time. Some even improved their cooking skills, and others improved their orientation on “Moon surface”. They also confronted their fears and became Spidermen on the rock. Once they agreed on the name of ladle/kitchen spoon, there seemed to be a dilemma about the way they should use it, so the pure device broke under pressure. But the guys had a solution for that in a form of metal-wooden kitchen spoon which served them well till the end. 

        The instructors were sometimes a bit frisky in the kitchen and played somewhat with pepper and red pepper. Some of us were almost driven some to tears!

        The *Ministry of Science, Education and Sport* will support one more program for high school students during the Easter holidays and also a rock climbing school in Zagreb. If you want to make part of our programs, now is your chance. Contact us! 
      EOS
    )
  end

  def down
  end
end
