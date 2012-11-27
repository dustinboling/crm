module InvoicesHelper

  def fetch_invoice_number
    if Invoice.last.nil?
      1
    else
      Invoice.last.invoice_number + 1
    end
  end

end
