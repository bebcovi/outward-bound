# encoding: utf-8
require "active_support/core_ext/string/strip"

Course.create!(
  name_hr: "Tradicionalno jedrenje",
  description_hr: <<-EOS.strip_heredoc,
    *Zaplovite otocima Jadrana, uputite se na otvoreno more, radite kao tim i budite dio hrvatske pomorske kulturne baštine...*

    ## Outward Bound pomorska škola

    Pomorska škola Outward Bound promiče pomorsku tradiciju Hrvatske kao način kojim mladi ljudi mogu upoznati vrijednosti moreplovstva koje se prenose naraštajima: predvodništvo, hrabrost, osobna odgovornost, suradnja, dobronamjenost i odnos prema prirodi s poštovanjem.

    Nudimo priliku budućim i iskusnim moreplovcima da provedu nezaboravih osam dana ploveći na brodu Bente Dorte, tradicionalnom jedrenjaku, te da upoznaju hrvatsku obalu na jedan posve novi način.<br>
    Polaznici će imati priliku naučiti tradicionalne metode navigacije, rukovanje jedrima, sigurnosti na moru, posjetiti nenaseljene otoke, kampirati na otvorenom.

    OB pomorska škola nudi ovo uzbudljivo putovanje te iskustvo jedrenja na ovom prekrasnom tradicionalnom plovilu, iskustvo koje rijetki u svijetu imaju prilike doživjeti.
  EOS
  dates_hr: "",
  price_hr: nil,
  contact_hr: "<kontakt@outwardbound.hr>",

  name_en: "Sailing adventure",
  description_en: <<-EOS.strip_heredoc,
    *Sail the islands of the Adriatic, brave the open sea, work as a team and be a part of Croatian maritime heritage...*

    ## Outward Bound Sea School

    The Outward Bound Sea School promotes the Maritime traditions of Croatia as a means for young people to learn the values that seafaring has taught for generations; Leadership, Courage, Responsibility, Cooperation, Generosity, Environmental Stewardship and Respect.

    We have opportunities for sailors young and old to discover their roots and sail on the beautiful Bente Dorte, a traditionally rigged sailboat, and to discover the Croatian coast in a new way.

    Students will get the opportunity to learn traditional navigation, sail handling, safety at sea, come visit uninhabited islands, camp in the open air.

    Outward Bound Sea School offers this exciting new trip to experience sailing on this magnificent traditional vessel. You may be one of a very few people in the world to have this truly unique experience.
  EOS
  dates_en: "",
  price_en: nil,
  contact_en: "<contact@outwardbound.hr>",

  category: "eight",
  duration: 8,
  min_people: 10, max_people: 16,
  album: @sailing_adventure_album,
)
