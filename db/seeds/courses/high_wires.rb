# encoding: utf-8
require "active_support/core_ext/string/strip"

Course.create!(
  name_hr: "Visinski izazov",
  description_hr: <<-EOS.strip_heredoc,
    Ovaj uzbudljivi jednodnevni program namijenjen je ljubiteljim pravih uzbuđenja. Adrenalinski park je idealan poligon za istraživanje , sastavljen od različitih prepreka na stupovima visine 10m.

    **Imate priliku unaprijediti vlastite sposobnosti**

    - Preuzimanje inicijative
    - Osobne odgovornosti
    - Prevladavanje samonametnih osobnih ograničenja
    - Suradnja i međusobna brige za druge u timu
    - Dobro se zabaviti
  EOS
  dates_hr: "Po dogovoru",
  price_hr: nil,
  contact_hr: "<visina@outwardbound.hr>",

  name_en: "Sailing adventure",
  description_en: <<-EOS.strip_heredoc,
    This exciting one-day program is for real adventure seekers. High ropes adrenalin park is the perfect setting for exploring own self-imposed limits. It is composed from various obstacles placed 10 meters high which you can undertake alone or with assistance from other members of the group.

    **You have the opportunity to develop your skills of**

    - Taking the initiative
    - Personal responsibility
    - Going over self-imposed limitations
    - Cooperation and care for others in the team
    - Having great time
  EOS
  dates_en: "On arrangement",
  price_en: nil,
  contact_en: "<height@outwardbound.hr>",

  category: "one",
  duration: 1,
  min_people: nil, max_people: nil,
  album: @high_wires_album,
)
