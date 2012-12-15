# encoding: utf-8

module HomeHelper
  def carousel_images
    [
      {
        url: "/images/velebit.jpg",
        title_hr: "Velebitska pustolovina za mlade",
        title_en: "Velebit adventure for youth",
        subtitle: "Velebit, 2007.",
        class: "active"
      },
      {
        url: "/images/rafting.jpg",
        title_hr: "Prezentacijski program rafting",
        title_en: "Presentational course rafting",
        subtitle: "Kupa, 2008."
      },
      {
        url: "/images/boat.jpg",
        title_hr: "Ekspedicija instruktora",
        title_en: "Expedition of instructors",
        subtitle: "Split, 2009."
      },
    ]
  end

  def important_partners
    [
      {
        image: "national-foundation-for-civil-society-development.png",
        href: "http://zaklada.civilnodrustvo.hr",
        title_hr: "Nacionalna zaklada<br>za razvoj civilnog društva",
        title_en: "National Foundation<br>for Civil Society Development",
      },
      {
        image: "vmd.png",
        href: "http://vmd.hr/en/",
        title_hr: "Putnička agencija VMD",
        title_en: "Travel agency VMD",
      },
    ]
  end
end
