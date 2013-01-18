namespace :posts do
  desc "Generate 10 posts (or specify with COUNT)"
  task :generate => :environment do
    count = (ENV["COUNT"] || 10).to_i
    count.times do
      new_post = Post.first.dup
      new_post.save
      new_post.album = Post.first.album.dup
    end
  end
end
