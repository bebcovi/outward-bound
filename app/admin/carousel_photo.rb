ActiveAdmin.register CarouselPhoto do

  config.paginate = false
  config.filters = false
  config.sort_order = "created_at_desc"

  index do
    selectable_column
    column :file do |carousel_photo|
      image_tag carousel_photo.file_url(:display), width: 400
    end
    default_actions
  end

  form partial: "form"
  show { render "carousel_photo" }

  controller do
    def create
      super do |format|
        format.html { redirect_to edit_resource_path }
      end
    end

    def update
      super do |format|
        format.html { redirect_to collection_path }
      end
    end
  end

end
