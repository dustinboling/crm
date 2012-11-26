class EstimatesController < ApplicationController

  layout 'profile'

  def index
    @estimates = Estimate.all
  end

  def show
    @estimate = Estimate.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf do
        pdf = EstimatePdf.new(@estimate, view_context)
        send_data pdf.render,
          filename: "estimate_#{@estimate.id}_#{Time.now.utc.to_i}.pdf",
          type: "application/pdf"
          # this will force the browser to render the pdf
          # (won't work w/o a pdf browser plugin)
          # disposition: "inline"
      end
    end
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

