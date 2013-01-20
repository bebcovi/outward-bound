class FixHighWires < ActiveRecord::Migration
  class Course < ActiveRecord::Base
  end

  def up
    Course.find_by_name_en("High wires").update_attributes(name_en: "High ropes", slug: "high-ropes")
  end

  def down
    Course.find_by_name_en("High ropes").update_attributes(name_en: "High wires", slug: "high-wires")
  end
end
