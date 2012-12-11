# encoding: utf-8
require "active_support/core_ext/string/strip"

Course.destroy_all

Course.create!(
  name_hr: "Morska pustolovina",
  name_en: "Sea-kayak Adventure",
  description_hr: <<-EOS.strip_heredoc,
    **Morska pustolovina** jedinstven je 8-dnevni program u kojem polaznici imaju priliku otkriti dubinu svoje osobne snage, iskustvo koje zatim mogu primjeniti u bilo kojoj situaciji koju život pred njih postavi. U veličanstvenom okružju hrvatskog otočja, suočavaju se s nepredvidljiim izazovima prirode, učeći se životu i radu u timu, savladavajući problemske zadatke i osvajajuči morska prostranstva, kao i vrhunce vlastitog duha. Iz toga izlaze osnaženi kako bi se posvetili ostvarivanju svojih životnih ciljeva s novom razinom predanosti i hrabrosti.

    **Ciljevi programa** su razvoj karaktera kroz pustolovne aktivnosti u prirodi.

    **Teme** koje se obrađuju su: svladavanje izazova, prihvaćanje vlastitih vrijednosti i razlika među pojedincima, predanost učenju, stalnom rastu i unaprjeđenju, davanje i primanje povratne informacije, rad u grupi s uključivanjem svih članova.

    **Metoda** se temelji na aktivnostima iskustvenog učenja, u kojima se polaznici uče snalaziti u nepredvidivim i izazovnim situacijama, tj. izlaze iz vlastite "zone komfora" i ulaze u "zonu učenja". izazov je predstavljen na svim razinama: fizičkoj, mentalnoj, emocionalnoj i duhovnoj.<br>
    aktivnosti na programu uključuju boravak u prirodi s organizacijom morske ekspedicije, učenje vještina kayakarenja na moru, razvijanje outdoor vještina, poput izrade prenoćišta, kuhanje u prirodi i sl. zatim aktivnosti bazirane na igrama te reflektivne aktivnosti poput vođenja dnevnika, razgovora o zadatku i sl.

    ## Tehnički detalji

    Polaznici ne trebaju biti u posebnoj fizičkoj formi, dovoljno je da su zdravi i znaju plivati. Nije potrebno nikakvo prethodno znanje o kajakarenju ili drugim vještinama.<br>
    Za smještaj se koristi bivak (zaklon, poput šatora) u prirodnom okruženju mediteranskih otoka (borova šuma). Obroke osigurava HŠOB a pripremaju ih polaznici tijekom programa.

    ## Tko može sudjelovati?

    Svatko tko želi unaprijediti svoje vještine komunikacije i rada u grupi, svoje organizacijske i voditeljske vještine, te bolje upoznati sebe kroz nova iskustva na moru.

    ## Troškovi

    Uključeni troškovi: instruktori, sea-kayaci (ekspedicijski), hrana i smještaj na privatnom posjedu, izvedba programa, grupna i tehnička oprema, osiguranje od nezgode.

    Nije uključeno: prijevoz do lokacije, osobna oprema.
  EOS
  dates_hr: <<-EOS.strip_heredoc,
    * 13.08.-23.08.2012.
    * 27.08.-03.09.2012.
  EOS
  price_hr: 5000,
  contact_hr: "<kontakt@outwardbound.hr>",
  duration: 8,
  min_people: 12, max_people: 16,
  album: @kayak_adventure_album,
)

Course.create!(
  name_hr: "Velebitska pustolovina",
  name_en: "Velebit adventure",
  album: @velebit_adventure_album,
)
