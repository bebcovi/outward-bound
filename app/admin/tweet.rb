ActiveAdmin.register Tweet do
  menu parent: "Home", priority: 5
  config.paginate = false

  index do
    selectable_column
    column :content do |tweet|
      truncate(tweet.content, length: 50)
    end
    column :autor do |tweet|
      link_to "@#{tweet.author}", "http://twitter.com/#{tweet.author}"
    end
    column :language do |tweet|
      case tweet.locale
      when "en" then "English"
      when "hr" then "Croatian"
      else           "English, Croatian"
      end
    end
    default_actions
  end

  filter :author
  filter :content
  filter :locale, label: "Language", as: :select,
    collection: [["Croatian", "hr"], ["English", "en"]],
    include_blank: false

  form partial: "form"

  show title: ->(tweet) { "@#{tweet.author}" } do |tweet|
    attributes_table do
      row :author do
        link_to "@#{tweet.author}", "http://twitter.com/#{tweet.author}"
      end
      row :content do
        parse_tweet(tweet.content)
      end
      row "Language", :locale do
        case tweet.locale
        when "en" then "English"
        when "hr" then "Croatian"
        else           "English, Croatian"
        end
      end
    end
  end
end
