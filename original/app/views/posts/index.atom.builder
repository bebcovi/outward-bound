atom_feed language: I18n.locale do |feed|
  feed.title("Outward Bound · #{t(".page_title")}")
  feed.updated @posts.maximum(:updated_at)

  @posts.each do |post|
    feed.entry(post, url: root_path) do |entry|
      present post do |post_presenter|
        entry.title(post_presenter.title, type: "html")
        entry.content(post_presenter.body, type: "html")
      end
    end
  end
end
