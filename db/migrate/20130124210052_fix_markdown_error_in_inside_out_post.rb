class FixMarkdownErrorInInsideOutPost < ActiveRecord::Migration
  def up
    post = Post.where("title_en ILIKE '%Inside Out%'").order("created_at ASC").first
    post.body_hr = post.body_hr.sub(/^6\./, "6\\.")
    post.save
  end

  def down
  end
end
