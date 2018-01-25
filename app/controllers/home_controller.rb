class HomeController < ApplicationController
  def index; end
  def index
    @user = current_user
  end
end

