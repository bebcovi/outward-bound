Course.create!(
  name_en: "Velebit adventure",
  name_hr: "Velebitska pustolovina",
  description_en: <<-EOS,
"Velebit adventure" is a unique 8-day course in which participants have an opportunity to discover the range of their abilities and personal strength, which they can late apply to any situation that life presents them. In the untouched wilderness of Mt. Velebit, they face the unpredictability of nature, learning to work in a team, while conquering the challenging activities and mountain peaks, as well as the summits of their spirit. From the course, they return stronger, and with more courage and commitment to accomplish their goals in life.

## Content of the program

"Velebit adventure" has all the high adventure you may ever desire, climbing technical peaks, camping in pristine meadows and coming back-to-back with Croatia’s outback. The course takes participants from the hinterland over mountains to the sea. Over 8 days they will get the opportunity to cook over open fire, learn how to navigate difficult mountain terrain, learn survival techniques for living in the outdoors, meet great people and build friendships that may very well last a lifetime.

## Who can participate?

Anyone who wants to improve their communication skills, leadership and group-work skills, in the wild outback of Mt. Velebit.

Participants don’t need to have a prior outdoor experience or special physical shape, it is enough if they are healthy and able to walk.

## Technical details

For accommodation, a bivouac is used, in the natural surroundings of Mt. Velebit. The meals are provided by us, and prepared by the group.

## Expenses

Included in the price: instructors, food and accommodation, course delivery, group and technical gear, accident insurance.

Not included in the price: transportation to the location.
  EOS
  description_hr: <<-EOS,
Program se temelji na metodama iskustvenog učenja u prirodi, koje polaznika smješta izvan udobnosti svakodnevnog života te ga suočava s novim, nepoznatim situacijama u prirodnom okruženju. Radom i životom unutar grupe razvija se osjećaj odgovornosti i važnosti svakog člana. Kroz izazov i pustolovinu polaznik bolje upoznaje sebe i način na koji reagira u takvim situacijama te razvija samopoštovanje i samoodgovornost. Program je pažljivo osmišljen da pruži maksimalno iskustvo i stvori pozitivan stav prema rješavanju problema ili suočavanju s nepoznatim situacijama. To se postiže djelovanjem koje slijedi refleksija kroz razgovor unutar grupe. Cilj je vještine naučene na programu prenijeti u svakodnevan život, gdje su samopoštovanje, osjećaj odgovornosti i pozitivan stav sve potrebnije osobne kvalitete.

## Sadržaj programa

Nakon dolaska na lokaciju dobro upoznavanje grupe prvi je zadatak. Sljedećih dana taj se proces nastavlja kroz zanimljive i zabavne aktivnosti poput slobodnog penjanja, špiljarenja, timske aktivnosti i igre. S razvijenim timskim duhom kreće se na dvodnevnu planinarsku ekspediciju i osvajanje jednog od obližnjih vrhova. Puni novih iskustava, svi se vraćaju u kamp gdje je zadnji dan proslava uz dodjelu priznanja nakon čega se polaznici vraćaju kućama.

## Tko može sudjelovati?

Svatko tko želi unaprijediti svoje vještine komunikacije i rada u grupi, svoje organizacijske i voditeljske vještine, te bolje upoznati sebe kroz nova iskustva u netaknutoj prirodi Velebita.

Polaznici ne trebaju biti u posebnoj fizičkoj formi, dovoljno je da su zdravi i sposobni hodati. Nije potrebno nikakvo prethodno znanje o planinarenju ili drugim vještinama.

## Tehnički detalji

Za smještaj se koristi bivak (zaklon, poput šatora) u prirodnom okruženju Velebita. Obroke osiguravamo mi, a pripremaju ih polaznici tijekom programa.

Program vode 2 instruktora, oboje vrlo iskusni u tehničkim vještinama te podučavanju kroz pustolovinu kao i u poznavanju kraja u kojem se provodi program.

## Troškovi

Uključeno u cijenu: instruktori, hrana i smještaj, izvedba programa, grupna i tehnička oprema, osiguranje od nezgode.

Nije uključeno u cijenu: prijevoz do lokacije.
  EOS
  dates_en: "* 3.8--10.8.2013.",
  dates_hr: "* 3.8--10.8.2013.",
  contact_en: "<contact@outwardbound.hr>",
  contact_hr: "<kontakt@outwardbound.hr>",
  price_en: "590 €",
  price_hr: "590 €",
  capacity_en: "10--16 people",
  capacity_hr: "10--16 osoba",
  duration_en: "8 days",
  duration_hr: "8 dana",
  category: Category.find_by!(name_hr: "Klasični 8-dnevni programi"),
  album: nil,
  application_form: nil,
)
