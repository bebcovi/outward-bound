class DeinternationalizeNameOnInstructors < ActiveRecord::Migration
  def change
    remove_column :instructors, :name_en, :string
    remove_column :instructors, :name_hr, :string
    add_column :instructors, :name, :string
  end
end
