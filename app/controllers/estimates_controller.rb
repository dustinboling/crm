class EstimatesController < ApplicationController

  layout 'profile'

  def index
    @estimates = Estimate.all
  end

  def show
    @estimate = Estimate.find(params[:id])
  end

  def new
    @estimate = Estimate.new
    @item = @estimate.items.build
  end

  def create
    @estimate = Estimate.new(params[:estimate])

    if @estimate.save
      redirect_to profile_estimates_path(1), notice: "Estimate added!"
    end
  end

  def edit
    @estimate = Estimate.find(params[:id])
  end

  def update
    @estimate = Estimate.find(params[:id])

    if @estimate.update_attributes(params[:estimate])
      redirect_to profile_estimates_path(1), notice: "Estimate updated!"
    else
      render :new
    end
  end

  def destroy
    @estimate = Estimate.find(params[:id])

    if @estimate.destroy
      redirect_to profile_estimates_path(1), notice: "Estimate ##{@estimate.estimate_number} destroyed!"
    end
  end

end
