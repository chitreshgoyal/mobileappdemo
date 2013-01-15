class AddDetailsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :name, :string
    add_column :products, :brand, :string
    add_column :products, :price, :float
    add_column :products, :quantity, :integer
    add_column :products, :sku, :float
  end
end
