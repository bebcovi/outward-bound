class Draper::Decorator
  def self.translates(*attributes)
    attributes.each do |attribute|
      define_method(attribute) do |*args|
        send("#{attribute}_#{I18n.locale}", *args)
      end
    end
  end
end
