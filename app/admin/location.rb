ActiveAdmin.register Location do
  menu parent: "About Us", priority: 7
  config.paginate = false
  config.filters = false
  config.sort_order = "position_asc"

  member_action :move_higher, method: :put do
    Location.find(params[:id]).move_higher
    redirect_to collection_path
  end

  member_action :move_lower, method: :put do
    Location.find(params[:id]).move_lower
    redirect_to collection_path
  end

  index do
    selectable_column
    column :position do |location|
      link_to(raw("<i class='icon-arrow-up'></i>"), [:move_higher, :admin, location], method: :put) +
      link_to(raw("<i class='icon-arrow-down'></i>"), [:move_lower,  :admin, location], method: :put)
    end
    column :image do |location|
      image_tag location.image_url(:small), height: 50 if location.image?
    end
    column "Name" do |location|
      location.name_en
    end
    default_actions
  end

  form partial: "form"

  show title: ->(location) { location.to_s } do |partner|
    attributes_table do
      row :image do
        image_tag location.image_url(:small), height: 50
      end

      row :name_en
      row :description_en do
        markdown location.description_en
      end

      row :name_hr
      row :description_hr do
        markdown location.description_hr
      end
    end
  end
end
