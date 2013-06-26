class AddNewKrk < ActiveRecord::Migration
  def up
    album = AlbumCreator.new("72157633159509022").create
    Post.create!(
      title_hr: "Održan uskršnji program na Krku 23--30.3.2013.",
      body_hr: <<-EOS.strip_heredoc,
        Otočka pustolovina na Krku održana tijekom uskršnjih praznika pokazala je što znači imati pravi Outward Bound duh. Od 23 do 30.ožujka ove godine, 13 srednjoškolaca iz cijele Hrvatske okupilo se na 8 dana kako bi se okušali protiv elemenata i kako bi izazvali sebe i svoje ideje o tome što je moguće a što nije.

        Pored standardnih izazova koje su instruktori pripremili za grupu, priroda je odlučila dati svoj doprinos pustolovini te je baš taj tjedan na Krku puhala olujna bura, noseći ledenu kišu te čak i snijeg s planina! Unatoč tome, naši su polaznici uspješno organizirali dvije ekspedicije u općini Baške kako bi osvojili sve najviše vrhove u okolici, sa završetkom na najvišem vrhu Krka - Obzovom. Osim prirodnih elemenata, morali su se naučiti i raditi s drugima u timu, pazeći na svakog člana kao i na sve ostale praktične stvari poput vode, hrane i potrebne opreme, da bi završnu ekspediciju uspješno završili čak dan ranije!

        Sve vještine koje su usvojili na programu moći će prenijeti u svoj svakodnevni život, koji može biti barem jednako uzbudljiva pustolovina ako se dobro organiziraju i usude povesti svoju okolinu!

        Ovaj program poduprijet je od strane Ministarstva znanosti, obrazovanja i športa RH, za učenike koji su motivirani učiti koz pustolovinu na vlastitom iskustvu.
      EOS
      title_en: "Održan uskršnji program na Krku 23--30.3.2013.",
      body_en: <<-EOS.strip_heredoc,
        Island Adventure was a program delivered on the Island of Krk during Spring breaks, from March 23.-30.2013, where 13 young highschool students came together to discover the true meaning of Outward Bound spirit! During the 8 days, they challenged the natural elements as well as their own concepts about what is possible and what not.

        Apart from the classic challenges put forth by the instructors, the nature decided to give it's contribution to the course, in the form of strong wind with ice-rain and even snow blown from the mountains! Inspite of that, our group managed to organized two expeditions around the county of Baška to conquer the highests peaks in the area, concluding with the highest one - Obzova.  One of the greater challenges was to learn how to work with others in the same team, including everyone as well as the practical things, like food and water, only to finish the final expedition one day ahead of schedule!

        All the skills they aquired on the course, they can later use in their every-day life, which can turn to be just as exciting adventure, if they organize well and take lead in their close community.

        This course was supported by Croatian Ministry of Science, Education and Sport, for the students that are motivated to learn through adventure by their own experience.
      EOS
      album: album,
    )
  end

  def down
  end
end
