class ApplicationsController < ApplicationController
  before_filter :store_referer!, only: :new

  def new
    @application = Application.new
    extract_course_from_referer
  end

  def create
    @application = Application.create(params[:application])

    if @application.valid?
      ApplicationMailer.overview(@application).deliver
      redirect_to root_path, notice: t("flash.sent")
    else
      flash.now[:alert] = t("flash.validation_errors")
      render :new
    end
  end

  def show
    @application = Application.find(params[:id])

    respond_to do |format|
      format.pdf do
        pdf = ApplicationPdf.new(@application)
        send_data pdf.render,
          type: "application/pdf",
          disposition: "inline"
      end
    end
  end

  private

  def extract_course_from_referer
    begin
      controller, course_slug = request.referer.split("/").last(2)
      if controller == "courses"
        @application.course = Course.find(course_slug)
      end
    rescue
    end
  end
end
