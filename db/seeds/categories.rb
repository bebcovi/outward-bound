Category.destroy_all

Category.create!(
  name_hr: "Jednodnevni programi",
  name_en: "1-day courses",
  position: 1,
)

Category.create!(
  name_hr: "Klasični 8-dnevni programi",
  name_en: "Classical 8-day courses",
  position: 2,
)

Category.create!(
  name_hr: "Ostali programi",
  name_en: "Other programs",
  position: 3,
)
