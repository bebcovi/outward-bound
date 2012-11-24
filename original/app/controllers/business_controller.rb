class BusinessController < ApplicationController
  def index
    @content = Content.find_by_uid("business/index")
  end
end
