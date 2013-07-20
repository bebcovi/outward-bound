ActiveAdmin.register Instructor do
  menu parent: "About us", priority: 4
  config.filters = false
  config.paginate = false
  config.sort_order = "position_asc"

  member_action :move_higher, method: :put do
    Instructor.find(params[:id]).move_higher
    redirect_to collection_path
  end

  member_action :move_lower, method: :put do
    Instructor.find(params[:id]).move_lower
    redirect_to collection_path
  end

  index do
    selectable_column
    column :position do |instructor|
      link_to("▲", [:move_higher, :admin, instructor], method: :put) +
      link_to("▼", [:move_lower,  :admin, instructor], method: :put)
    end
    column :photo do |instructor|
      image_tag instructor.photo_url(:small), height: 100
    end
    column :name
    default_actions
  end

  form partial: "form"

  show title: ->(instructor) { instructor.to_s } do |instructor|
    attributes_table do
      row :photo do
        image_tag instructor.photo_url(:small), height: 100
      end
      row :name
      row :biography_en do
        markdown instructor.biography_en
      end
      row :biography_hr do
        markdown instructor.biography_hr
      end
    end
  end
end
