module CountrySelectInput
  def country_select(attribute_name, options = {})
    input(attribute_name) do
      priority_countries = options.delete(:priority).map { |code| [I18n.t("countries.#{code}"), code] } rescue nil
      country_code_select(attribute_name, priority_countries, options, {})
    end
  end
end

SimpleForm::FormBuilder.send(:include, CountrySelectInput)
