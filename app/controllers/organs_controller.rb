class OrgansController < ApplicationController
  def index
  end

  def show
    @organ = Organ.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
