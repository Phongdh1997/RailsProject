class ChangePriceColumnProducts < ActiveRecord::Migration[5.2]
  def up
  	change_column :products, :price, :decimal, precision: 12, scale: 2
  end
  def down
  	change_column :products, :price, :decimal, precision: 6, scale: 2
  end
end