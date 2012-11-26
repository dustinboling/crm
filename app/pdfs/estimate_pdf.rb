class EstimatePdf < Prawn::Document

  def initialize(estimate, view)
    super(top_margin: 70)
    @estimate = estimate
    @view = view

    # routine
    estimate_number
    line_items
    total_price
  end

  def estimate_number
    text "Estimate \##{@estimate.id}", size: 26, style: :bold
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
    @estimate.items.map do |item|
      [item.name, item.description, item.quantity, price(item.price), @view.number_to_percentage(item.tax, precision: 2), @view.number_to_currency(item.line_price)]
    end
  end

  def price(num)
    @view.number_to_currency(num)
  end

  def total_price
    move_down 15
    text "Total Price: #{@view.number_to_currency(@estimate.total_price)}", size: 16, style: :bold
  end

end
