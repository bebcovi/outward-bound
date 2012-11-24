# encoding: utf-8

module SeedHelpers
  def extract_title(text)
    match_data = text.match(/\A# ([^\n]+)\s+/)
    [match_data[1], match_data.post_match]
  end

  def extract_post(filename)
    title, body = extract_title(File.read(filename))
    [title, render_markdown(body)]
  end

  def extract_course(filename)
    categories = {
      "one"       => {object: "course", ordinal: 1, name_hr: "Jednodnevni programi",       name_en: "1-day courses"},
      "eight"     => {object: "course", ordinal: 2, name_hr: "Klasični 8-dnevni programi", name_en: "Classic 8-day courses"},
      "technical" => {object: "course", ordinal: 3, name_hr: "Tehnički tečajevi",          name_en: "Technical courses", uid: "technical"}
    }

    category, ordinal = filename.chomp(".md").split("/").last(2)
    name, description = extract_title(File.read(filename))
    [categories[category], name, render_markdown(description), ordinal]
  end

  def extract_content(filename)
    ordinals = {
      "about/index"         => 1,
      "about/what"          => 2,
      "about/international" => 3,
      "about/instructors"   => 4,
      "about/support"       => 5,
      "about/safety"        => 6,
      "about/contact"       => 7,
      "about/locations"     => 8,
      "about/partners"      => 9,
      "about/applying"      => 10
    }
    uid = filename.chomp(".md").split("/").last(2).join("/")
    body, ordinal = File.read(filename), ordinals[uid]
    [render_markdown(body), uid, ordinal]
  end

  private

  def render_markdown(text)
    Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(text).gsub('&quot;', '"')
  end
end

include SeedHelpers

Post.delete_all
filenames = Dir["#{Rails.root}/db/seeds/{hr,en}/posts/*.md"].group_by { |f| File.basename(f) }
filenames.values.each do |hr, en|
  title_hr, body_hr, title_en, body_en = [*extract_post(hr), *extract_post(en)]
  Post.create(title_hr: title_hr, body_hr: body_hr, title_en: title_en, body_en: body_en)
end

Course.delete_all
Category.delete_all
filenames = Dir["#{Rails.root}/db/seeds/{hr,en}/courses/**/*.md"].group_by { |f| File.basename(f) }
filenames.values.each do |hr, en|
  category_hash, name_hr, description_hr, ordinal, name_en, description_en = [*extract_course(hr), *extract_course(en).first(3).last(2)]
  category = Category.find_by_name(category_hash[:name_hr]) || Category.create(category_hash)
  Course.create(category: category, name_hr: name_hr, name_en: name_en, description_hr: description_hr, description_en: description_en, ordinal: ordinal)
end

Event.delete_all
Course.find_by_slug("sea-kayak-adventure").events.create \
  name_hr: "Morska pustolovina",
  name_en: "Sea-kayak adventure",
  start_at: DateTime.parse("13/08/2012"),
  end_at: DateTime.parse("23/08/2012"),
  color: "#3b4a59"
Course.find_by_slug("velebit-adventure").events.create \
  name_hr: "Velebitska pustolovina",
  name_en: "Velebit adventure",
  start_at: DateTime.parse("05/08/2012"),
  end_at: DateTime.parse("12/08/2012"),
  color: "#c23900"
Event.create \
  name_hr: "Bez treninga",
  name_en: "Without training",
  start_at: Date.today,
  end_at: 6.days.from_now,
  color: "#83004f"

Content.delete_all
filenames = Dir["#{Rails.root}/db/seeds/{hr,en}/contents/**/*.md"].group_by { |f| f.split("/").last(2) }
filenames.values.each do |hr, en|
  body_hr, uid, ordinal, body_en = [*extract_content(hr), *extract_content(en).first(1)]
  Content.create(body_hr: body_hr, body_en: body_en, uid: uid, ordinal: ordinal)
end

Tweet.delete_all
tweet = Twitter.mentions.first
Tweet.create(tweet_id: tweet.id, author: tweet.user.screen_name, content: tweet.text)

User.delete_all
User.create(username: ENV["OB_USERNAME"], password: ENV["OB_PASSWORD"])

Application.delete_all
Course.find_by_name_hr("Velebitska pustolovina").applications.create \
  starts_at: Date.today,
  first_name: "Janko",
  last_name: "Marohnić",
  date_of_birth: Date.parse("10th March 1991"),
  height: "176",
  weight: "80",
  gender: "Muško",
  passport_number: 23739432,
  country: :HR,
  city: "Zagreb",
  postal_code: "10000",
  address: "Školski prilaz 3",
  mobile_number: "0997899148",
  phone_number: "6602644",
  occupation: "Klavir, Matematika, Programiranje, Parkour",
  past_experience: "Bio sam dva puta na istom ovom programu, prošle dvije godine.",
  boot_size: "44",
  shirt_size: "L",
  sports: {swimming: 1, running: 3, hiking: 3, sailing: 1, canoeing: 2, camping: 2},
  contact: {
    first_name: "Jadranka",
    last_name: "Stojanovski",
    city: "Zagreb",
    adress: "Školski prilaz 3",
    email: "jadranka@smth.hr",
    relationship: "Majka"
  },
  health: {
    heart:       ["no", ""],
    lungs:       ["yes", ""],
    head:        ["yes", "Migrena"],
    mental:      ["no", ""],
    diabetes:    ["yes", ""],
    malignant:   ["no", ""],
    alergies:    ["yes", "Na travu"],
    bones:       ["no", ""],
    stomach:     ["no", ""],
    hospital:    ["no", ""],
    drugs:       ["no", ""],
    diet:        ["no", ""],
    infection:   ["no", ""],
    vaccination: ["no", ""],
    other:       ["yes", "Nešto drugo"]
  }
