ActiveAdmin.register Course do
  menu parent: "Courses", priority: 2
  config.paginate = false
  config.filters = false

  index do
    selectable_column
    column :name_en do |course|
      smarty_pants course.name_en
    end
    column :name_hr do |course|
      smarty_pants course.name_hr
    end
    column :category
    default_actions
  end

  form partial: "form"

  show title: ->(course) { course.to_s } do |course|
    attributes_table do
      row :category
      row :album
      row :application_form
    end

    ["en", "hr"].each do |locale|
      attributes_table do
        row "Name" do
          smarty_pants course.send("name_#{locale}")
        end
        row "Description" do
          markdown course.send("description_#{locale}")
        end
        row "Dates" do
          markdown course.send("dates_#{locale}")
        end
        row "Contact" do
          mail_to course.send("contact_#{locale}")
        end
        row "Price" do
          smarty_pants course.send("price_#{locale}")
        end
        row "Capacity" do
          smarty_pants course.send("capacity_#{locale}")
        end
        row "Duration" do
          smarty_pants course.send("duration_#{locale}")
        end
      end if course.available_in?(locale)
    end
  end
end
