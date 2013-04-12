class HomeController < ApplicationController
  def index
    @announcements = Announcement.not_expired.available_in(I18n.locale)
  end
end
