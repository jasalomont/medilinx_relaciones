class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.page(params[:page]).per(10)
  end

  def show
    @doctor = Doctor.find(params[:id])
  end
end
