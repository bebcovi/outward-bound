require Rails.root.join("config/initializers/translation")

Course = Struct.new(:name_en, :name_hr, :description_en, :description_hr,
  :dates_en, :dates_hr, :contact_en, :contact_hr, :price_en, :price_hr,
  :min_people, :max_people, :category, :duration, :applyable, :album_id) do

  extend TranslationHelpers
  translates :name, :description, :dates, :contact, :price

  delegate :cover_photo, to: :album

  def initialize(attributes)
    attributes.each do |key, value|
      send("#{key}=", value)
    end
  end

  def album
    @album ||= Album.find(album_id) if album_id
  end

  def to_s
    name
  end

  def to_param
    slug
  end

  def slug
    name_en.parameterize
  end

  def one_day?;    category == "one";   end
  def eight_days?; category == "eight"; end
  def other?;      category == "other"; end

  alias applyable? applyable

  def to_partial_path
    "courses/course"
  end
end
