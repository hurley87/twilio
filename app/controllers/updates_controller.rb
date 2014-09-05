class UpdatesController < ApplicationController
  def index
  	@updates = Update.all
  end

  def new
  	@update = Update.new
    @user = current_user
    @recipients = @user.patients
  end

  def create
  	@update = Update.new(update_params)

    @update.user = current_user

    if @update.save
      redirect_to updates_url
    else
      render :new
    end
  end

  private

  def update_params
    params.require(:update).permit(:body, :user_id, :patient_id)
  end
end
