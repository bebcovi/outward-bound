ActiveAdmin.setup do |config|

  config.site_title = "Outward Bound"
  config.site_title_link = "/"
  config.root_to = "posts#index"

  config.authentication_method = :authenticate_user!
  config.current_user_method = :current_user
  config.logout_link_path = :destroy_user_session_path

  config.allow_comments = false
  config.batch_actions = true
  config.download_links = false

  config.namespace :admin do |admin|
    admin.build_menu do |menu|
      menu.add label: "Home", priority: 1 do |home|
        text = Text.find("home/index")
        home.add label: "Introduction", url: "/admin/texts/#{text.id}", priority: 3
      end

      menu.add label: "News", priority: 2

      menu.add label: "Courses", priority: 3 do |courses|
        text = Text.find("courses/index")
        courses.add label: "Introduction", url: "/admin/texts/#{text.id}", priority: 3
      end

      menu.add label: "Gallery", priority: 4

      menu.add label: "About us", priority: 5 do |about_us|
        add_item = proc do |text, priority|
          about_us.add label: text.to_s, url: "/admin/texts/#{text.id}", priority: priority
        end

        add_item.(Text.find("about/index"), 1)
        add_item.(Text.find("about/what"), 2)
        add_item.(Text.find("about/international"), 3)
        add_item.(Text.find("about/support"), 5)
        add_item.(Text.find("about/safety"), 6)
        add_item.(Text.find("about/statute"), 7)
      end
    end

    admin.build_menu :utility_navigation do |menu|
      menu.add label: "Markdown", url: "/admin/markdown"
      admin.add_logout_button_to_menu menu
    end
  end

end
