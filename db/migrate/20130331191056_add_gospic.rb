# encoding: utf-8

class AddGospic < ActiveRecord::Migration
  def up
    album = AlbumCreator.new("72157633130514839").create
    Post.create!(
      title_hr: "U nastavnom središtu Hrvatske škole Outward Bound proradila je nova kuhinja",
      body_hr: <<-EOS.strip_heredoc,
        Sa prvim danom proljeća HŠOB je otvorila vrata novouređenoj kuhinji u Nastavnom središtu udruge. Uz veliku pomoć brojnih sponzora i donatora, te uz sufinanciranje tijela državne i lokalne vlasti, započelo je preuređenje zapuštene zgrade škole u Velikom Žitniku pored Gospića.   

        Najznačajniji doprinos svakako je donacija Rotary Club-a iz Rochestera u Minessotti koji je osigurao sredstva za nabavu profesionalne kuhinje. Uz posredovanje Rotary Club-a Zagreb Gradec, njegovi su članovi cijelo vrijeme pažljivo pratili tijek radova te željno očekivali ovaj sretan trenutak aktiviranja novouređene kuhinje.<br>
        Samo otvaranje kuhinje pratio je Predsjednik Rotary Club District-a za Hrvatsku, g. Darko Šeparović. On se, nakon što je obišao kuhinju i sanitarni čvor, uvjerio da je kuhinjska oprema ispravna i stavljena u upotrebu. 

        Uspostavljanje HŠOB i stavljanje u upotrebu njezinog Nastavnog središta, značajan je pomak u razvoju ovog kraja, a i mnogo šire. To su prepoznali i predvodnici u lokalnoj političkoj vlasti, podržali projekt i pridružili se svečanom trenutku stavljanja u funkciju obnovljenog dijela statre škole. G. Milan Kolić, gradonačelnik grada Gospića bio je vrlo sretan i izrazio zahvalnost donatorima, prije svega članovima Rotary Cluba. 

        HŠOB u tom prostoru namjerava ubrzo pokrenuti izvedbe programa iskustvenog učenja u prirodi za sve uzraste, a sa svrhom osobnog i timskog razvoja.
      EOS
      album: album,
    )
  end

  def down
  end
end
