# encoding: utf-8
require "active_support/core_ext/string/strip"

Course.create!(
  name_hr: "Custom made",
  description_hr: "",
  contact_hr: "",

  name_en: "Custom made",
  description_en: "",
  contact_en: "",

  category: "other",
  applyable: false,
  album: nil,
)
