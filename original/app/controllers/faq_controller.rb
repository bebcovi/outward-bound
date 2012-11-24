class FaqController < ApplicationController
  def index
    @content = Content.find_by_uid("faq/index")
  end
end
