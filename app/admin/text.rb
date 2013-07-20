ActiveAdmin.register Text do
  menu false
  decorate_with TextDecorator

  form partial: "form"

  show title: ->(text) { text.title } do |text|
    attributes_table do
      row :body_en do
        markdown text.body_en
      end
      row :body_hr do
        markdown text.body_hr
      end
    end
  end

  controller do
    def create
      super do |success, failure|
        success.html { redirect_to resource_path }
      end
    end

    def update
      super do |success, failure|
        success.html { redirect_to resource_path }
      end
    end
  end
end
