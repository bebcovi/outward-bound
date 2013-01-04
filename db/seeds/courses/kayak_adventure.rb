# encoding: utf-8
require "active_support/core_ext/string/strip"

Course.create!(
  name_hr: "Morska pustolovina",
  description_hr: <<-EOS.strip_heredoc,
    "Morska pustolovina" jedinstven je 8-dnevni program u kojem polaznici imaju priliku otkriti dubinu svoje osobne snage, iskustvo koje zatim mogu primjeniti u bilo kojoj situaciji koju život pred njih postavi. U veličanstvenom okružju hrvatskog otočja, suočavaju se s nepredvidljiim izazovima prirode, učeći se životu i radu u timu, savladavajući problemske zadatke i osvajajući morska prostranstva, kao i vrhunce vlastitog duha. Iz toga izlaze osnaženi kako bi se posvetili ostvarivanju svojih životnih ciljeva s novom razinom predanosti i hrabrosti.

    ## Sadržaj programa

    Program uključuje boravak u prirodi s organizacijom morske ekspedicije, učenje vještina kayakarenja na moru, razvijanje outdoor vještina, poput izrade prenoćišta, kuhanje u prirodi i sl. zatim aktivnosti bazirane na igrama te reflektivne aktivnosti poput vođenja dnevnika, razgovora o zadatku i sl.

    ## Tko može sudjelovati?

    Svatko tko želi unaprijediti svoje vještine komunikacije i rada u grupi, svoje organizacijske i voditeljske vještine, te bolje upoznati sebe kroz nova iskustva na moru.

    Polaznici ne trebaju biti u posebnoj fizičkoj formi, dovoljno je da su zdravi i znaju plivati. Nije potrebno nikakvo prethodno znanje o kajakarenju ili drugim vještinama.

    ## Tehnički detalji

    Za smještaj se koristi bivak (zaklon, poput šatora) u prirodnom okruženju mediteranskih otoka (borova šuma). Obroke osiguravamo mi, a pripremaju ih polaznici tijekom programa.

    ## Troškovi

    Uključeno u cijenu: instruktori, sea-kayaci (ekspedicijski), hrana i smještaj na privatnom posjedu, izvedba programa, grupna i tehnička oprema, osiguranje od nezgode.

    Nije uključeno u cijenu: prijevoz do lokacije.
  EOS
  dates_hr: <<-EOS.strip_heredoc,
  EOS
  price_hr: 5000,
  contact_hr: "<kontakt@outwardbound.hr>",

  name_en: "Sea-kayak Adventure",
  description_en: <<-EOS.strip_heredoc,
    **Sea-kayak adventure** is a unique 8-day course that takes place along Croatian coast and its islands. Surrounded by incredible beaches and pristine clear water, participants will be challenged both physically and mentally trying to overcome obstacles set by their instructors and the nature itself.

    In a safe but challenging environment they will have to work and triumph together, or fail as individuals. They will be offered an opportunity to find new strengths and overcome old weaknesses, to shed away their old fears and to gaze upon the new horizons.

    ## Content of the course

    The course includes outdoor camping, planning and utilizing a sea expedition, kayaking in the sea, learning of various basic outdoor skills (building a shelter, cooking, waste disposal, etc.), various games and energizers, sharing personal insights and thoughts with the group, first-hand experience of group dynamic.

    ## Who can participate?

    Anybody who is willing to exit their comfort zone and improve their communication and group skill-set, their organizational and leadership skills, and whoever is willing to get to know themselves better.

    Although Outward Bound courses are meant to be physically and mentally challenging, one does not need to be an athlete or have any prior outdoor experience to participate. Our courses are designed to be well within the capabilities of anyone who is able-bodied. What is more important is a positive attitude, a willingness to try and a commitment to work together.

    ## Technical details

    Za smještaj se koristi bivak (zaklon, poput šatora) u prirodnom okruženju mediteranskih otoka (borova šuma). Obroke osiguravamo mi, a pripremaju ih polaznici tijekom programa.

    For accommodation, a bivouac is used (shelter, like a tent), in the natural surroundings of mediterranian islands (pine forrest). The meals are provided by us, and prepared by the group during the course.

    ## Expenses

    Included in the price: instructors, sea-kayaks (expeditional), food and accommodation on private property, course delivery, group and technical gear, accident insurance.

    Not included in the price: transportation to the location.
  EOS
  dates_en: <<-EOS.strip_heredoc,
  EOS
  price_en: 670,
  contact_en: "<contact@outwardbound.hr>",

  category: "eight",
  duration: 8,
  min_people: 12, max_people: 16,
  album: @kayak_adventure_album,
)
