module Admin::ApplicationHelper
  Page = Struct.new(:title, :path)
  def admin_navigation_pages
    pages = [
      {controller: "admin/posts",          action: "index"},
      {controller: "admin/announcements",  action: "index"},
    ]

    pages.map { |page|
      Page.new(
        t("#{page[:controller].split("/").join(".")}.#{page[:action]}.page_title"),
        page
      )
    }
  end

  def admin?
    params[:controller] =~ /admin/
  end

  def link_to_add_fields(text, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render association.to_s.singularize + "_fields", f: builder
    end
    link_to text, "#", class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")}
  end
end
