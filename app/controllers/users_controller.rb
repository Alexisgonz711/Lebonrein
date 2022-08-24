class UsersController < ApplicationController


  def new
  end

  def create
  end


  def dashboard
    @bookings = Booking.where(user: current_user)
  end
end
