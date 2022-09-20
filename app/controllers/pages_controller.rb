class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  before_action :set_user


  def home
    @cars = Car.all
  end

  def profile
    @user = current_user
  end

private

  def set_user
    @user = current_user if user_signed_in?
  end


end
