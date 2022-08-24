class UsersController < ApplicationController

  def dashboard
    @bookings = Booking.where(user: current_user)
  end
end
