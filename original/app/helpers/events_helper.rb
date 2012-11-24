# encoding: utf-8

module EventsHelper
  COLORS = {
    "#3b4a59" => "Plava",
    "#c23900" => "Narančasta",
    "#83004f" => "Ljubičasta",
    "#6b9b00" => "Zelena"
  }

  def colors
    COLORS.invert.to_a
  end

  def color_name(css_color)
    COLORS[css_color]
  end
end
