class Draper::Decorator
  def self.translates(*attributes)
    mod = Module.new
    mod.module_eval do
      attributes.each do |attribute|
        define_method(attribute) do |*args|
          object.send("#{attribute}_#{I18n.locale}", *args)
        end
      end

      def to_s
        "TranslationAttributes"
      end
    end
    include mod
  end
end
