module AboutHelper
  def about_pages
    pages = @contents.map { |content| [content.title, {controller: "about", action: content.action}] }
    pages.map { |title, route| Struct.new(:title, :route).new(title, route) }
  end
end
