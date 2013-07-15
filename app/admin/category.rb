ActiveAdmin.register Category do
  config.paginate = false
  config.filters = false

  index do
    selectable_column
    column :name_en
    column :name_hr
    column :number_of_courses do |category|
      category.courses.count
    end
    default_actions
  end

  form partial: "form"

  show title: ->(category) { category.to_s } do |category|
    attributes_table do
      row :name_en
      row :name_hr
      row :number_of_courses do
        category.courses.count
      end
    end
  end
end
