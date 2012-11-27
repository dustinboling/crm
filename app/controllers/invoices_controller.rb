class InvoicesController < ApplicationController

  layout 'profile'

  def index
    @invoices = Invoice.all
  end

  def show
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf do
        pdf = InvoicePdf.new(@invoice, view_context)
        send_data pdf.render,
          filename: "invoice_#{@invoice.invoice_number}_#{Time.now.utc.to_i}.pdf",
          type: "application/pdf"
      end
    end
  end

  def new
    if params[:estimate_id]
      @invoice = Invoice.create_from_estimate!(params[:estimate_id])
      redirect_to edit_profile_invoice_path(1, @invoice)
    else
      @invoice = Invoice.new
      @item = @invoice.items.build
    end
  end

  def create
    @invoice = Invoice.new(params[:invoice])

    if @invoice.save
      redirect_to profile_invoices_path(1), notice: "Invoice added!"
    end
  end

  def edit
    @invoice = Invoice.find(params[:id])
  end

  def update
    @invoice = Invoice.find(params[:id])

    if @invoice.update_attributes(params[:invoice])
      redirect_to profile_invoices_path(1), notice: "Invoice updated!"
    else
      render :new
    end
  end

  def destroy
    @invoice = Invoice.find(params[:id])

    if @invoice.destroy
      redirect_to profile_invoices_path(1), notice: "Invoice destroyed!"
    end
  end

end
