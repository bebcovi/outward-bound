ActiveAdmin.register Category do
  menu parent: "Courses", priority: 1
  config.paginate = false
  config.filters = false
  config.sort_order = "position_asc"

  member_action :move_higher, method: :put do
    Category.find(params[:id]).move_higher
    redirect_to collection_path
  end

  member_action :move_lower, method: :put do
    Category.find(params[:id]).move_lower
    redirect_to collection_path
  end

  index do
    selectable_column
    column :position do |category|
      link_to(raw("<i class='icon-arrow-up'></i>"), [:move_higher, :admin, category], method: :put) +
      link_to(raw("<i class='icon-arrow-down'></i>"), [:move_lower,  :admin, category], method: :put)
    end
    column :name_en
    column :name_hr
    column "Number of courses" do |category|
      category.courses.count
    end
    default_actions
  end

  form partial: "form"

  show title: ->(category) { category.to_s } do |category|
    attributes_table do
      row :name_en
      row :name_hr
      row "Number of courses" do
        category.courses.count
      end
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
