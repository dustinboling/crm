class InvoicePdf < Prawn::Document

  def initialize(invoice, view)
    super(top_margin: 70)
    @invoice = invoice
    @view = view

    # routine
    invoice_number
    line_items
    total_price
  end

  def invoice_number
    text "Invoice \##{@invoice.id}", size: 26, style: :bold
  end

  def line_items
    move_down 20
    table line_item_rows do
      row(0).font_style = :bold
      columns(1..3).align = :right
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end
  end

  def line_item_rows
    [["Name", "Description", "Quantity", "Price", "Tax", "Line Total"]] +
    @invoice.items.map do |item|
      [item.name, item.description, item.quantity, price(item.price), @view.number_to_percentage(item.tax, precision: 2), @view.number_to_currency(item.line_price)]
    end
  end

  def price(num)
    @view.number_to_currency(num)
  end

  def total_price
    move_down 15
    text "Total Price: #{@view.number_to_currency(@invoice.total_price)}", size: 16, style: :bold
  end

end
