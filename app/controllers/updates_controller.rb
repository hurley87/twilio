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
      @update.send_text_message(@update.patient, @update)
      redirect_to current_user
    else
      render :new
    end
  end

  private

  def update_params
    params.require(:update).permit(:body, :user_id, :patient_id)
  end
end
