# encoding: utf-8

module HomeHelper
  def carousel_images
    [
      TranslationHash(
        url: "/images/velebit.jpg",
        title_hr: "Velebitska pustolovina za mlade",
        title_en: "Velebit adventure for youth",
        subtitle: "Velebit, 2007.",
        class: "active"
      ),
      TranslationHash(
        url: "/images/rafting.jpg",
        title_hr: "Prezentacijski program rafting",
        title_en: "Presentational course rafting",
        subtitle: "Kupa, 2008."
      ),
      TranslationHash(
        url: "/images/boat.jpg",
        title_hr: "Ekspedicija instruktora",
        title_en: "Expedition of instructors",
        subtitle: "Split, 2009."
      ),
    ]
  end

  def important_partners
    [
      TranslationHash(
        image: "national-foundation-for-civil-society-development.png",
        href_hr: "http://zaklada.civilnodrustvo.hr",
        href_en: "http://zaklada.civilnodrustvo.hr",
        title_hr: "Nacionalna zaklada<br>za razvoj civilnog društva",
        title_en: "National Foundation<br>for Civil Society Development",
      ),
      TranslationHash(
        image: "vmd.png",
        href_hr: "http://vmd.hr/hr/",
        href_en: "http://vmd.hr/en/",
        title_hr: "Putnička agencija VMD",
        title_en: "Travel agency VMD",
      ),
    ]
  end
end
