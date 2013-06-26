class AddLocaleIndicator < ActiveRecord::Migration
  def change
    [:categories, :courses, :posts, :announcements].each do |table_name|
      add_column table_name, :hr, :boolean
      add_column table_name, :en, :boolean
    end
    add_column :tweets, :locale, :string
  end
end
