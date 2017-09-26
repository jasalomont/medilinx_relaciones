class InsurersController < ApplicationController
  def index
    @insurers = Insurer.page(params[:page]).per(10)
  end

  def show
    @insurer = Insurer.find(params[:id])
  end
end
