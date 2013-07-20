class HomeController < ApplicationController
  def index
    @announcements = Announcement
      .not_expired
      .available_in(current_locale)
      .decorate
    @carousel_photos = CarouselPhoto.all
    @important_partners = Partner.important.decorate
  end
end
