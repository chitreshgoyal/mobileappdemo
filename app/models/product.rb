class Product < ActiveRecord::Base
   attr_accessible :id, :name, :brand, :price, :quantity, :sku
end
