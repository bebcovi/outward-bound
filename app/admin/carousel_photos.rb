ActiveAdmin.register CarouselPhoto do

  config.paginate = false

  index do
    selectable_column
    column :photo do |carousel_photo|
      image_tag carousel_photo.photo_url(:display)
    end
    default_actions
  end

  form partial: "form"

  controller do
    def create
      super do |success, failure|
        success.html { redirect_to edit_resource_path }
      end
    end

    def update
      super do |success, failure|
        success.html { redirect_to collection_path }
      end
    end
  end

end
