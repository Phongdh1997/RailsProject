class AddLevelFeildProducts < ActiveRecord::Migration[5.2]
  def change
  	add_column :products, :level, :string, limit: 7
  end
end
