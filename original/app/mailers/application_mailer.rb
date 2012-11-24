class ApplicationMailer < ActionMailer::Base
  default from: "Outward Bound <#{ENV["SENDGRID_USERNAME"]}>"

  def overview(application)
    @application = application
    attachments["prijavnica.pdf"] = ApplicationPdf.new(@application).render
    mail(to: "janko.marohnic@gmail.com", subject: "Prijava za program \"#{@application.course.name}\"")
  end
end
