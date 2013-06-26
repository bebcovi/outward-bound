class AddEnglishVersionOfKitchen < ActiveRecord::Migration
  def up
    begin
      Post.find(12).update_attributes(
        title_en: "New Professional Grade Kitchen Unveiled at Outward Bound Croatia Education Centre",
        body_en: <<-EOS.strip_heredoc,
          With the first day of spring 2013, Outward Bound Croatia has been enriched by the new professional grade kitchen and its education centre. Thanks to numerous sponsors and donors, including the state and local governments, the remodelling of the abandoned one-classroom school building at Veliki Žitnik near Gospić has begun.   

          Rotary Club, Rochester, Minnesota, USA provided the seminal contribution and initiated the action that drew further support from the regional Rotary Clubs in Minnesota and matching by the Rotary Foundation. Rotary Club Zagreb Gradec has been the instrumental local organizer. The unveiling of the completed and fully functional part of the building containing the kitchen took place with the participation of Mr Darko Šeparović, President, Rotary Club District Croatia. Mr Šeparović personally inspected the facility and approved the quality of design, work and function.

          Establishment of Outward Bound Croatia and putting its education centre into its intended function are significant stimuli to the development not only of the immediate neighbourhood, but also of the broader region in Lika. At the ceremony of the unveiling, Hon. Milan Kolić, Mayor of Gospić, on behalf of the local government expressed the appreciation to all contributors and particularly to the Rotarians for their leadership role and key donation.

          Outward Bound Croatia is deeply thankful to Rotary Clubs in the United States and Croatia; the Town of Gospić represented by Mayor Kolić; HEP–the Croatian Electrical Utility; HEP Distribution Area Lika; CorteCros, Zagreb; Ministry of Tourism, Republic of Croatia; Privredna banka Zagreb (member of the Intesa Sanpaolo Group) and Planar Corp. for making it possible to initiate new educational programs at the hub at Veliki Žitnik. We are excited by the vastly expanded opportunities for Outward Bound Croatia to fulfil its mission of providing life-changing experience to students of all ages and from all venues of life.
        EOS
      )
    rescue ActiveRecord::RecordNotFound
    end
  end

  def down
  end
end
