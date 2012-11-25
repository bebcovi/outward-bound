class Photoset
  attr_accessor :title

  def initialize(attributes)
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def photos
    [
      "http://placekitten.com/500/300",
      "http://placekitten.com/450/350",
      "http://placekitten.com/300/350",
      "http://placekitten.com/500/400",
      "http://placekitten.com/450/400",
    ].shuffle
  end

  def to_param
    title.parameterize
  end

  def self.find(title)
    new(title: title.titleize)
  end

  def self.all
    5.times.map { |n| find("#{I18n.t("photosets.index.page_title")} #{n + 1}") }
  end
end
