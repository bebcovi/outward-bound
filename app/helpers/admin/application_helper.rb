module Admin::ApplicationHelper
  Page = Struct.new(:title, :path)
  def admin_navigation_pages
    pages = [
      {controller: "admin/email_forwards", action: "index"}
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
end
