class PatientsController < ApplicationController
  def index
    @patients = Patient.page(params[:page]).per(10)
  end

  def show
    @patient = Patient.find(params[:id])
  end
end
