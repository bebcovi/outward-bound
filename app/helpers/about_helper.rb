# encoding: utf-8

module AboutHelper
  def partners
    [
      TranslationHash(
        image: "national-foundation-for-civil-society-development.png",
        href: "http://zaklada.civilnodrustvo.hr",
        title_hr: "Nacionalna zaklada<br>za razvoj civilnog društva",
        title_en: "National Foundation<br>for Civil Society Development",
      ),
      TranslationHash(
        image: "vmd.png",
        href: "http://vmd.hr/en/",
        title_hr: "Putnička agencija VMD",
        title_en: "Travel agency VMD",
      ),
      TranslationHash(
        image: "outward-bound-international.png",
        href: "http://www.outwardbound.net/",
        title_hr: "Outward Bound International",
        title_en: "Outward Bound International",
      ),
      TranslationHash(
        image: "waldorf-school-of-zagreb.png",
        href: "http://www.waldorfska-skola-zg.skole.hr",
        title_hr: "Waldorfska škola u Zagrebu",
        title_en: "Waldorf school of Zagreb",
      ),
      TranslationHash(
        image: "udruga-igra.png",
        href: "http://udrugaigra.hr/",
        title_hr: "Udruga \"Igra\"",
        title_en: "Organization \"Igra\"",
      ),
      TranslationHash(
        image: "youth-in-action.png",
        href: "http://ec.europa.eu/youth/index_en.htm",
        title_hr: "Mladi na djelu",
        title_en: "Youth in Action",
      ),
      TranslationHash(
        image: "international-american-school-of-zagreb.png",
        href: "http://www.aisz.hr/",
        title_hr: "Američka škola u Zagrebu",
        title_en: "International American School of Zagreb",
      ),
    ]
  end
end
