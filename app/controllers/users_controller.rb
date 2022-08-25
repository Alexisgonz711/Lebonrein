class UsersController < ApplicationController

  def dashboard
    @bookings = Booking.where(user: current_user)
    @review = Review.new
    @user = User.new
  end
end
