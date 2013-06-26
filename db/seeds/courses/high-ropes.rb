Course.create!(
  name_en: "High ropes",
  name_hr: "Visinski izazov",
  description_en: <<-EOS,
This exciting one-day program is for real adventure seekers. High ropes adrenalin park is the perfect setting for exploring own self-imposed limits. It is composed from various obstacles placed 10 meters high which you can undertake alone or with assistance from other members of the group.

You have the opportunity to develop your skills:

- Taking the initiative
- Personal responsibility
- Going over self-imposed limitations
- Cooperation and care for others in the team
- Having great time
  EOS
  description_hr: <<-EOS,
Ovaj uzbudljivi jednodnevni program namijenjen je ljubiteljim pravih uzbuđenja. Adrenalinski park je idealan poligon za istraživanje, sastavljen od različitih prepreka na stupovima visine 10m.

Imate priliku unaprijediti vlastite sposobnosti:

- Preuzimanje inicijative
- Osobne odgovornosti
- Prevladavanje samonametnih osobnih ograničenja
- Suradnja i međusobna brige za druge u timu
- Dobro se zabaviti
  EOS
  dates_en: "On arrangement",
  dates_hr: "Po dogovoru",
  contact_en: "<height@outwardbound.hr>",
  contact_hr: "<visina@outwardbound.hr>",
  price_en: nil,
  price_hr: nil,
  capacity_en: nil,
  capacity_hr: nil,
  duration_en: nil,
  duration_hr: nil,
  category: Category.find_by!(name_hr: "Jednodnevni programi"),
  album: nil,
  application_form: nil,
)
