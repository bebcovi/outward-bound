# encoding: utf-8
require "active_support/core_ext/string/strip"

class CreateEasterAnnouncement < ActiveRecord::Migration
  def up
    post = Post.create!(
      title_hr: "Uskršnji program na Krku (23--30.3.2013.)",
      body_hr: <<-EOS.strip_heredoc,
        Poštovani,

        želimo Vas pozvati da ponudite nekolicini Vaših učenika da sudjeluju na pustolovno-edukativnom programu **Hrvatske škole Outward Bound** koji se održava na otoku Krku tijekom uskršnjih praznika. **Program koji se održava od 23. do 30. ožujka 2013., pod potporom je Ministarstva znanosti, obrazovanja i športa RH** te predstavlja izvrsnu opciju za mlade koji su u mogućnosti provesti 8 dana u iznimno kvalitetnom okruženju te naučiti više o vlastitim sposobnostima, osobnoj odgovornosti, radu u grupi i ponijeti s programa jedno nezaboravno iskustvo.

        Ovaj projekt podržan je od strane MZOŠ-a, čime je subvencionirana kotizacija u programu, što uključuje smještaj, opremu, troškove programa i nadzor iskusnih instruktora. U mogućnosti smo uključiti Vaše učenike te Vas molim da prioritet date onima koji su najmotiviraniji. Vaši učenici trebali bi osigurati vlastiti prijevoz do lokacije programa, te sudjelovati s kotizacijom od 800 kn za troškove hrane i osiguranja tijekom 8 dana.

        U prilogu možete pronaći ostale informacije o programu i prijavnicu, koju Vas molimo da proslijedite zainteresiranim učenicima i pošaljete nam mailom skeniranu i potpisanu kopiju, najkasnije do **28.2.2013**.

        Programi Hrvatske škole Outward Bound pružaju priliku mladim ljudima da osvijeste i bolje upoznaju vlastite mogućnosti, putem iskustvene edukacije kroz pustolovne aktivnosti na otvorenom. Polaznici se suočavaju s novim izazovima te u grupnom okruženju razvijaju osjećaj zajedništva, inicijative, kreativnog rješavanja problema i timskog rada, što mogu biti izuzetno korisna iskustva za mladog čovjeka današnjice.

        Nadamo se da ćemo upoznati nekoliko Vaših učenika te moguće nastaviti suradnju i na drugim projektima u budućnosti.

        Lijep pozdrav,

        Juraj Boljat -- <juraj@outwardbound.hr>, mob: 098 933 4747, instruktor<br>
        Orsat Kratofil -- <orsat@outwardbound.hr>, mob: 098 773895, instruktor<br>
        Administracija -- <kontakt@outwardbound.hr>, mob: 091 568 5650
      EOS
    )

    album = post.create_album
    cover_photo = Photo.find_by_uid("8467817523").dup
    cover_photo.assign_attributes(album: album)
    cover_photo.save
    album.update_attributes!(cover_photo: cover_photo)

    post.attachments.create([
      {name_hr: "Infoletter", filename_hr: "Uskrs-Infoletter.pdf"},
      {name_hr: "Prijavnica", filename_hr: "Application_form_hr.doc"},
    ])

    Announcement.create(
      content_hr: "Počele su prijave za Uskršnji program na Krku. Pogledajte o čemu se radi :)",
      post: post,
      expires_on: Date.new(2013, 3, 1),
    )
  end

  def down
    post = Post.find_by_title_hr("Uskršnji program na Krku (23--30.3.2013.)")
    post.destroy unless post.nil?
  end
end
