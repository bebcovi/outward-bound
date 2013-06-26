Course.create!(
  name_en: "Custom made",
  name_hr: "Custom made",
  description_en: <<-EOS,
Description in progress...
  EOS
  description_hr: <<-EOS,
Opis je u izradi...
  EOS
  dates_en: nil,
  dates_hr: nil,
  contact_en: nil,
  contact_hr: nil,
  price_en: nil,
  price_hr: nil,
  capacity_en: nil,
  capacity_hr: nil,
  duration_en: nil,
  duration_hr: nil,
  category: Course.find_by!(name_hr: "Ostali programi"),
  album: nil,
  application_form: nil,
)
