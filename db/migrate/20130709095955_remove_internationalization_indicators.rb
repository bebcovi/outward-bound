class RemoveInternationalizationIndicators < ActiveRecord::Migration
  def change
    [:posts, :announcements, :categories, :courses].each do |table_name|
      remove_column table_name, :hr, :boolean
      remove_column table_name, :en, :boolean
    end
  end
end
