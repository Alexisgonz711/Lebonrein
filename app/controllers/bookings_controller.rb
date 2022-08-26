class BookingsController < ApplicationController

  def update
    @organ = Organ.find(params[:organ_id])
    @booking = @organ.booking
    @booking.update(availability: 1, user: current_user)
    redirect_to dashboard_path, status: :see_other
  end

  def destroy

  end
end
