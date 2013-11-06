class PopulateSlugsForCategories < ActiveRecord::Migration
  class Category < ActiveRecord::Base
  end

  def change
    Category.find_each do |category|
      category.update(slug: category.name_en.parameterize)
    end
  end
end
