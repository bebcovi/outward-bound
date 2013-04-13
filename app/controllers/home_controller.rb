class HomeController < ApplicationController
  def index
    @announcements = Announcement.not_expired.available_in(current_locale)
  end
end
