ActiveAdmin.register Instructor do
  menu parent: "About us", priority: 4
  config.filters = false
  config.paginate = false

  index do
    selectable_column
    column :photo do |instructor|
      image_tag instructor.photo_url(:small), height: 100
    end
    column :name_en
    column :name_hr
    default_actions
  end

  form partial: "form"

  show title: ->(instructor) { instructor.to_s } do |instructor|
    attributes_table do
      row :photo do
        image_tag instructor.photo_url(:small), height: 100
      end
      row :name_en
      row :biography_en do
        markdown instructor.biography_en
      end
      row :name_hr
      row :biography_hr do
        markdown instructor.biography_hr
      end
    end
  end
end
