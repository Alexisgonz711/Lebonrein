class BookingsController < ApplicationController

  def update
    @booking = Booking.find(params[:id])
    if params[:action_btn] == "book"
      @booking.update(availability: 1, user: current_user)
    elsif params[:action_btn] == "accept"
      @booking.update(availability: 2, user: current_user)
    end
    respond_to |format| format.js
    # redirect_to dashboard_path, status: :see_other
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path, status: :see_other
  end
end
