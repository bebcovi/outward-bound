# encoding: utf-8

module CoursesHelper
  def money(value)
    if croatian?
      "#{value} Kn"
    else
      "#{value} €"
    end
  end

  def days(value)
    t("misc.days", count: value)
  end
end
