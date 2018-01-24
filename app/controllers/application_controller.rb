class ApplicationController < ActiveController::Base
  protect_form_forgery with: :exception, prepend: true
  before_action :authenticate_user!
end

