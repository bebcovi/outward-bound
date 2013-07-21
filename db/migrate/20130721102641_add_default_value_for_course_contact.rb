class AddDefaultValueForCourseContact < ActiveRecord::Migration
  def change
    change_column :courses, :contact_en, :string, default: "contact@outwardbound.hr"
    change_column :courses, :contact_hr, :string, default: "kontakt@outwardbound.hr"
  end
end
