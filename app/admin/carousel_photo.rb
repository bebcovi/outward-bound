ActiveAdmin.register CarouselPhoto do
  menu parent: "Home", priority: 1
  config.paginate = false
  config.filters = false
  config.sort_order = "created_at_desc"

  index do
    selectable_column
    column "Photo" do |carousel_photo|
      image_tag carousel_photo.file_url(:display), width: 400
    end
    default_actions
  end

  form partial: "form"
  show do |carousel_photo|
    attributes_table do
      row "Photo" do
        image_tag carousel_photo.file_url(:display)
      end
    end
  end

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
