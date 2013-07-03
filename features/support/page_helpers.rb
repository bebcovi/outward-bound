module PageHelpers
  def path_to(page)
    case page
    when /home page/ then root_path
    when /news page/ then posts_path
    else
      raise "Page not registered: #{page}"
    end
  end
end

World(PageHelpers)
