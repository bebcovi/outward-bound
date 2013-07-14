ActiveAdmin.register Album do
  config.paginate = false

  index do
    selectable_column
    column :name_en
    column :name_hr
    column :photos do |album|
      album.photos.count
    end
    default_actions
  end

  filter :name_en
  filter :name_hr

  form partial: "form"

  controller do
    respond_to :js, only: :update
  end
end
