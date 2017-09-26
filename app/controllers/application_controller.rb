class ApplicationController < ActionController::Base
  before_action :authenticate_doctor!

  protect_from_forgery with: :exception
end
