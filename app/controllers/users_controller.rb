class UsersController < ApplicationController

  def dashboard
    @bookings = Booking.where(user: current_user)
    @review = Review.new
  end
end
