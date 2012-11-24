class ForwardMailer < ActionMailer::Base
  default from: "Outward Bound <#{ENV["SENDGRID_USERNAME"]}>"

  def forward(params)
    mail(to: "janko.marohnic@gmail.com", subject: "Forward", body: params.inspect)
  end
end
