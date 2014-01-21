require "nokogiri"

class PopulateLocations < ActiveRecord::Migration
  include MarkdownRendering

  def up
    about = {
      en: Nokogiri::HTML(markdown(Text.find("about/locations").body_en)),
      hr: Nokogiri::HTML(markdown(Text.find("about/locations").body_hr)),
    }

    (0..Float::INFINITY).each do |idx|
      break if %i[en hr].all? { |locale| about[locale].search(:h2)[idx].blank? }

      location = Location.new

      %i[en hr].each do |locale|
        location_name = about[locale].search(:h2)[idx].text

        paragraphs = Enumerator.new do |yielder|
          part = about[locale].search(:h2)[idx].next
          loop do
            break if part.nil? or part.name == "h2"
            yielder << part.text if part.name == "p"
            part = part.next
          end
        end
        location_description = paragraphs.to_a.join("\n\n")

        location.send("name_#{locale}=", location_name)
        location.send("description_#{locale}=", location_description)
      end

      location.save
    end
  end

  def down
  end
end
