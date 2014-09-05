class PatientsController < ApplicationController
  def new
  	@patient = Patient.new
  end

  def show
  	@patient = Patient.find(params[:id])
  	@user = @patient.user
  	@update = @patient.updates.build
  end

  def create
  	@user = current_user
  	@patient = @user.patients.build(patient_params)

  	if @patient.save
  		redirect_to @user
  	else
  		redirect_to root_path
  	end
  end

  private 

  def patient_params
  	params.require(:patient).permit(:name, :phone, :user_id)
  end
end
