ActiveAdmin.register Post do
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
      if post.hr?
        row :title_hr do
          smarty_pants post.title_hr
        end
        row :body_hr do
          markdown post.body_hr
        end
      end
      if post.en?
        row :title_en do
          smarty_pants post.title_en
        end
        row :body_en do
          markdown post.body_en
        end
      end
    end
  end

  controller do
    def create
      super do |success, failure|
        success.html { redirect_to edit_resource_path }
      end
    end

    def update
      super do |success, failure|
        success.html { redirect_to edit_resource_path }
      end
    end
  end
end
