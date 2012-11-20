class EstimatesController < ApplicationController

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
      redirect_to estimates_path, notice: "Estimate added!"
    end
  end

  def edit
    @estimate = Estimate.find(params[:id])
  end

  def update
    @estimate = Estimate.find(params[:id])

    if @estimate.update_attributes(params[:estimate])
      redirect_to estimates_path, notice: "Estimate updated!"
    else
      render :new
    end
  end

  def destroy
    @estimate = Estimate.find(params[:id])
    @estimate.destroy
  end

end
