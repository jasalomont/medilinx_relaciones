class InsurersController < ApplicationController
  def index
    @insurers = Insurer.all
  end

  def show
    @insurer = Insurer.find(params[:id])
  end
end
