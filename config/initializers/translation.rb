module TranslationHelpers
  def translates(*columns)
    @translated_columns = columns

    columns.each do |column|
      define_method("#{column}") do
        read_attribute("#{column}_#{I18n.locale}")
      end

      define_method("#{column}=") do |value|
        write_attribute("#{column}_#{I18n.locale}", value)
      end

      define_singleton_method("find_by_#{column}") do |value|
        send("find_by_#{column}_#{I18n.locale}", value)
      end
    end
  end

  attr_reader :translated_columns
end

ActiveRecord::Base.send(:extend, TranslationHelpers)
