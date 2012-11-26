class ChangeTaxToFloatOnItems < ActiveRecord::Migration
  def change
    change_column :items, :tax, :decimal
  end
end
