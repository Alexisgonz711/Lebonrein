class OrgansController < ApplicationController
  def index
    @organs = Organ.all
  end

  def show
    @organ = Organ.find(params[:id])
  end

  def new
    @organ = Organ.new
  end

  def create
    @organ = Organ.new(organ_params)
    @organ.user = current_user
    @organ.save
    redirect_to organ_path(@organ)
  end

  def edit
    @organ = Organ.find(params[:id])
  end

  def update
    @organ = Organ.find(params[:id])
    @organ.update(organ_params)
    redirect_to organ_path(@organ)
  end

  def destroy
    @organ = Organ.find(params[:id])
    @organ.destroy
    redirect_to organs_path, status: :see_other
  end

  private

  def organ_params
    params.require(:organ).permit(:name, :category, :description, :pricing)
  end
end
