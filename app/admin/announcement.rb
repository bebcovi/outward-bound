ActiveAdmin.register Announcement do
  menu parent: "Home", priority: 2
  config.per_page = 10
  config.sort_order = "created_at_desc"

  index do
    selectable_column
    column :post
    column :expires_on
    default_actions
  end

  filter :content_en
  filter :content_hr
  filter :expires_on

  form partial: "form"

  show title: ->(announcement) { announcement.to_s } do |announcement|
    attributes_table do
      row :post
      row :content_en if announcement.content_en?
      row :content_hr if announcement.content_hr?
      row :expires_on
    end
  end
end
