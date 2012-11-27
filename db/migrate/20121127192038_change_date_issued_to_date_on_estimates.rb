class ChangeDateIssuedToDateOnEstimates < ActiveRecord::Migration
  def change
    remove_column :estimates, :date_issued
    add_column :estimates, :date_issued, :date
  end
end
