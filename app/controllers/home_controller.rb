class HomeController < ApplicationController
  def index
  end
  caches_action :index
end
