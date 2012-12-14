Course.destroy_all

Dir["#{Rails.root}/db/seeds/courses/*.rb"].each { |f| load f }
