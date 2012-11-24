class MailsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def receive_email
    ForwardMailer.forward(params).deliver
  end
end
