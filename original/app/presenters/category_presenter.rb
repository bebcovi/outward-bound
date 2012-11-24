# encoding: utf-8

class CategoryPresenter < BasePresenter
  presents :category

  def name_hr
    category.name_hr
  end

  def name_en
    category.name_en
  end

  def admin_links
    content_tag :p do
      edit_button("Izmjeni", edit_category_path(category)) + " | " + delete_button("Izbriši", category_path(category))
    end
  end
end
