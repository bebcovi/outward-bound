ActiveAdmin.register Partner do
  menu parent: "About us", priority: 8
  config.filters = false
  config.paginate = false
  config.sort_order = "position_asc"

  member_action :move_higher, method: :put do
    Partner.find(params[:id]).move_higher
    redirect_to collection_path
  end

  member_action :move_lower, method: :put do
    Partner.find(params[:id]).move_lower
    redirect_to collection_path
  end

  index do
    selectable_column
    column :position do |partner|
      link_to(raw("<i class='icon-arrow-up'></i>"), [:move_higher, :admin, partner], method: :put) +
      link_to(raw("<i class='icon-arrow-down'></i>"), [:move_lower,  :admin, partner], method: :put)
    end
    column :photo do |partner|
      image_tag partner.photo_url(:small), height: 100
    end
    column :name_en
    column :name_hr
    default_actions
  end

  form partial: "form"

  show title: ->(partner) { partner.to_s } do |partner|
    attributes_table do
      row :photo do
        image_tag partner.photo_url(:small), height: 100
      end
      row :name_en
      row :url_en do
        link_to partner.url_en, partner.url_en
      end
      row :name_hr
      row :url_hr do
        link_to partner.url_hr, partner.url_hr
      end
    end
  end

  controller do
    def update
      super do |success, failure|
        success.js { head :ok }
      end
    end
  end
end

ActiveAdmin.register_page "Important Partners" do
  menu parent: "Home", priority: 4

  content do
    table_for Partner.all, class: "index_table index" do
      column "On homepage?" do |partner|
        simple_form_for [:admin, partner], defaults: {wrapper: false, label: false} do |f|
          f.input :important
        end
      end
      column :photo do |partner|
        image_tag partner.photo_url(:small), height: 100
      end
      column :name_en
      column :name_hr
    end
  end
end
