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
    if croatian?
      value == 1 ? "1 dan" : "#{value} dana"
    else
      value == 1 ? "1 day" : "#{value} days"
    end
  end
end
