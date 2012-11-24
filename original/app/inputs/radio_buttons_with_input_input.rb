module RadioButtonsWithInputInput
  def radio_buttons_with_input(attribute, options = {})
    name = "#{object_name}[#{attribute}][]"
    input(attribute) do
      collection_radio_buttons(attribute, [[:no, I18n.t("words.n")], [:yes, I18n.t("words.y")]], :first, :last, {}, name: name) +
      input(attribute, {label: false, wrapper: false, input_html: {name: name}}.merge(options))
    end
  end
end

SimpleForm::FormBuilder.send(:include, RadioButtonsWithInputInput)
