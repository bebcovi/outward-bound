ActiveAdmin.register Document do
  menu false
  config.per_page = 10
  config.sort_order = "updated_at_desc"

  index do
    selectable_column
    column :name
    default_actions
  end

  filter :name

  form partial: "form"

  show do |document|
    attributes_table do
      row :name

      row :file_en do
        link_to document.file_en.extension, document.file_en_url
      end if document.file_en?

      row :file_hr do
        link_to document.file_hr.extension, document.file_hr_url
      end if document.file_hr?
    end
  end

  controller do
    def create
      super do |success, failure|
        success.html { redirect_to collection_path }
      end
    end

    def update
      super do |success, failure|
        success.html { redirect_to collection_path }
      end
    end
  end
end
