# encoding: utf-8
require "active_support/core_ext/string/strip"

Course.create!(
  name_hr: "Velebitska pustolovina",
  description_hr: <<-EOS.strip_heredoc,
    ## Ciljevi programa

    Osobni razvoj polaznika i razvijanje novih vještina kroz iskustveno učenje u prirodi.

    ## Tko može sudjelovati?

    Svatko tko želi unaprijediti svoje vještine komunikacije i rada u grupi, svoje organizacijske i voditeljske vještine, te bolje upoznati sebe kroz nova iskustva u netaknutoj prirodi Velebita.

    ## Outward Bound metoda

    Program se temelji na metodama iskustvenog učenja u prirodi, koje polaznika smješta izvan udobnosti svakodnevnog života te ga suočava s novim, nepoznatim situacijama u prirodnom okruženju. Radom i životom unutar grupe razvija se osjećaj odgovornosti i važnosti svakog člana. Kroz izazov i pustolovinu polaznik bolje upoznaje sebe i način na koji reagira u takvim situacijama te razvija samopoštovanje i samoodgovornost. Program je pažljivo osmišljen da pruži maksimalno iskustvo i stvori pozitivan stav prema rješavanju problema ili suočavanju s nepoznatim situacijama. To se postiže djelovanjem koje slijedi refleksija kroz razgovor unutar grupe. Cilj je vještine naučene na programu prenijeti u svakodnevan život, gdje su samopoštovanje, osjećaj odgovornosti i pozitivan stav sve potrebnije osobne kvalitete.

    ## Sastavnice programa

    Nakon dolaska na lokaciju dobro upoznavanje grupe prvi je zadatak. Sljedećih dana taj se proces nastavlja kroz zanimljive i zabavne aktivnosti poput slobodnog penjanja, špiljarenja, timske aktivnosti i igre. S razvijenim timskim duhom kreće se na dvodnevnu planinarsku ekspediciju i osvajanje jednog od obližnjih vrhova. Puni novih iskustava, svi se vraćaju u kamp gdje je zadnji dan proslava uz dodjelu priznanja nakon čega se polaznici vraćaju kućama.

    ## Tehnički detalji

    Polaznici ne trebaju biti u posebnoj fizičkoj formi, dovoljno je da su zdravi i sposobni hodati. Nije potrebno nikakvo prethodno znanje o planinarenju ili drugim vještinama.

    Za smještaj se koristi bivak (zaklon, poput šatora) u prirodnom okruženju Velebita. Obroke osigurava HŠOB a pripremaju ih polaznici tijekom programa.

    Polaznici trebaju ponijeti:

    - Vreću za spavanje + karimat (podložak)
    - Priručni pribor za jelo (posuda, žlica, vilica, nož, šalica)
    - Prikladnu odjeću za planinarenje
    - Pribor za osobnu higijenu
    - Osobne lijekove (po potrebi)

    Oprema koju osigurava HŠOB:

    - Bivak
    - Karte i oprema za navigaciju
    - Prva pomoć
    - Ostala oprema potreban za izvođenje programa

    Polaznici će dobiti detaljan popis opreme i druge informacije nakon sto se prijave za program

    Program vode 2 **instruktora**, oboje vrlo iskusni u tehničkim vještinama te podučavanju kroz pustolovinu kao i u poznavanju kraja u kojem se provodi program.
  EOS
  dates_hr: <<-EOS.strip_heredoc,
    * 5-12.8.2012.
  EOS
  price_hr: 4400,
  contact_hr: "<kontakt@outwardbound.hr>",

  name_en: "Velebit adventure",
  description_en: <<-EOS.strip_heredoc,
    "Velebit adventure" has all the high adventure you may ever desire, climbing technical peaks, camping in pristine meadows and coming back-to-back with Croatia’s outback. It is our first course that was ever done by Outward Bound here in Croatia.

    The course takes participants from the hinterland over mountains to the sea. Over 8 days you will get the opportunity to cook over open fire, learn how to navigate difficult mountain terrain, learn survival techniques for living in the outdoors, meet great people and build friendships that may very well last a lifetime.

    The Classic Velebit Course is a great way to experience the forgotten wilderness of Croatia. As so many people head to the coast we will be high above, traversing the mountains with a birds eye view of what is to come.

    Outward Bound is formed around the idea that people work best when they are aligned with their inner values. It was founded in 1941. as a development program for youth, and today it has expanded to working with individuals, groups and professional teams. To be ‘’Outward Bound’’ is to be ready for a challenge, to develop leadership and responsibility for own life and to continue to contribute to community that we are all a part of.

    Velebit Adventure is a unique 8-day course in which participants have an opportunity to discover the range of their abilities and personal strength, which they can late apply to any situation that life presents them. In the untouched wilderness of Mt. Velebit, they face the unpredictability of nature, learning to work in a team, while conquering the challenging activities and mountain peaks, as well as the summits of their spirit. From the course, they return stronger, and with more courage and commitment to accomplish their goals in life.

    The **objectives** of the course are personal development through challenging activities in the outdoor.

    **Themes** used in the course include: overcoming challenges, accepting differences and individual worth, dedication to growth and learning, giving and receiving feedback, inclusion in the group work.

    **Method** is based on experiential learning activities, in which participants learn to cope with challenging and unpredictable situations, outside of their ‘’comfort zone’’. They are challenged on physical, emotional and intellectual level.

    **Activities** include camping in the nature, organizing a mountaineering expedition, developing outdoor skills, building a shelter, bush-cooking, challenge activities, reflective discussions etc.

    ## Technical details

    Participants don’t need to have a prior outdoor experience or special physical shape, it is enough if they are healthy and able to walk.

    For accommodation, a bivouac is used, in the natural surroundings of Mt. Velebit. The meals are provided by OBC, and prepared by the group.

    ## Who can participate?

    Anyone who wants to improve their communication skills, leadership and group-work skills, in the wild outback of Mt. Velebit.

    ## Expenses

    Included in the price: instructors, food and accommodation, course delivery, group and technical gear, accident insurance

    Not included: transportation to the location

    **Outward Bound course** is one of the most valuable experiences a young man could have. The skills acquired during the course can be used in many years ahead.
  EOS
  dates_en: <<-EOS.strip_heredoc,
    * 5th 'till 12th of August, 2012
  EOS
  price_en: 590,
  contact_en: "<contact@outwardbound.hr>",

  category: "eight",
  duration: 8,
  min_people: 10, max_people: 16,
  album: @velebit_adventure_album,
)
