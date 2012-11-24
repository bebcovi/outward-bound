class ApplicationPdf < Prawn::Document
  def initialize(application)
    super()
    @application = application
    font "#{Prawn::BASEDIR}/data/fonts/DejaVuSans.ttf", size: 10
    table rows do
      self.row_colors = ["DDDDDD", "FFFFFF"]
    end
  end

  private

  def rows
    [
      [t(:course), @application.course.name],
      [t(:starts_at), l(@application.starts_at)],
      [t(:first_name), @application.first_name],
      [t(:last_name), @application.last_name],
      [t(:date_of_birth), l(@application.date_of_birth)],
      [t(:height), @application.height],
      [t(:weight), @application.weight],
      [t(:gender), @application.gender],
      [t(:passport_number), @application.passport_number],
      [t(:country), @application.country],
      [[t(:city), t(:postal_code)].to_sentence, "#{@application.postal_code} #{@application.city}"],
      [t(:address), @application.address],
      [t(:mobile_number), @application.mobile_number],
      [t(:phone_number), @application.phone_number],
      [t(:email), @application.email],
      [t(:occupation), @application.occupation],
      [t(:past_experience), @application.past_experience],
      [t(:boot_size), @application.boot_size],
      [t(:shirt_size), @application.shirt_size],
      [t(:sports_attribute), @application.sports.map { |name, value| "#{t("sports.#{name}")}: #{value}/3" }.join("\n")],
      [t(:tobacco), @application.tobacco],
      [t(:alcohol), @application.alcohol],
      [t(:contact_attribute), @application.contact.map { |name, value| "#{t("contact.#{name}")}: #{value}" }.join("\n")],
      [t(:health_attribute), @application.health.reject { |name, value| value.first == "no" }.map { |name, value| "#{t("health.#{name}")}: #{I18n.t("words.y")} (\"#{value.last}\")" }.join("\n")],
      [t(:insurance), @application.insurance]
    ].
      map { |attr, value| [attr, value.to_s] }
  end

  def t(attribute)
    I18n.t("simple_form.labels.application.#{attribute}")
  end

  def l(time)
    I18n.l(time, locale: :hr)
  end
end
