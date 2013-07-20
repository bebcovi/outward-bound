ActiveAdmin.register Post do
  menu parent: "News", priority: 1
  config.per_page = 10
  config.sort_order = "created_at_desc"

  index do
    selectable_column
    column :title_hr do |post|
      smarty_pants post.title_hr
    end
    column :title_en do |post|
      smarty_pants post.title_en
    end
    column :created_at
    default_actions
  end

  filter :title_en
  filter :title_hr
  filter :body_en
  filter :body_hr
  filter :created_at
  filter :updated_at

  form partial: "form"

  show title: ->(post) { post.to_s } do |post|
    attributes_table do
      %w[hr en].each do |locale|
        if post.available_in?(locale)
          row :"title_#{locale}" do
            smarty_pants post.send(:"title_#{locale}")
          end
          row :"body_#{locale}" do
            markdown post.send(:"body_#{locale}")
          end
        end
      end

      row :cover_photo do
        image_tag post.cover_photo.file_url, height: 100
      end

      if post.photos.any?
        row :photos do
          post.photos.inject(raw("")) do |result, photo|
            result += image_tag photo.file_url, height: 100
          end
        end
      end

      if post.attachments.any?
        row :attachments do
          ul do
            post.attachments.inject(raw("")) do |result, attachment|
              result += li do
                links = [:en, :hr].inject([]) do |result, locale|
                  if attachment.available_in?(locale)
                    result << link_to(
                      attachment.send(:"name_#{locale}"),
                      attachment.send(:"file_#{locale}").url
                    )
                  else
                    result
                  end
                end
                links.join("/").html_safe
              end
            end
          end
        end
      end
    end
  end
end
