class Admin::EmailForwardsController < Admin::ApplicationController
  def index
    @email_forwards = to_hash(email_forwards.search(params[:query]))
    @email_forward = email_forwards.new
  end

  def create
    @email_forward = email_forwards.create(params[:email_forward])

    if @email_forward.valid?
      flash[:notice] = "\"#{@email_forward.from}@outwardbound.hr => #{@email_forward.to}\" je uspješno dodan."
      redirect_to action: :index
    else
      @email_forwards = to_hash(email_forwards.all)
      render :index
    end
  end

  def destroy
    if EmailForward.exists?(params[:id])
      email_forward = email_forwards.find(params[:id]).destroy
      flash[:notice] = "\"#{email_forward.from}@outwardbound.hr => #{email_forward.to}\" je uspješno izbrisan."
    end
    redirect_to action: :index
  end

  def update_all
    email_forwards.update_all
    redirect_to action: :index
  end

  private

  def email_forwards
    EmailForwardsManager.new(DNSimple.client)
  end

  def to_hash(email_forwards)
    email_forwards.inject({}) do |result, email_forward|
      result[email_forward.from] ||= []
      result[email_forward.from] << [email_forward.to, email_forward]
      result
    end
  end
end
