class DeepPresenceValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.values.any? { |v| v.blank? }
      record.errors.add(attribute, t("deep_presence"))
    end
  end

  private

  def t(value)
    I18n.t("errors.messages.#{value}")
  end
end
