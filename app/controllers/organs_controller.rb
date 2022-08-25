class OrgansController < ApplicationController
  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR category ILIKE :query"
      @organs = Organ.where(sql_query, query: "%#{params[:query]}%")
    else
      @organs = Organ.all
    end
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
