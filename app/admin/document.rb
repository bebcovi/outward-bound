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
        if document.file_en.present?
          link_to document.file_en.extension, document.file_en_url
        end
      end
      row :file_hr do
        if document.file_hr.present?
          link_to document.file_hr.extension, document.file_hr_url
        end
      end
    end
  end
end
