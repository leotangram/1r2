class Product < ActiveRecord::Base
  validates :name, presence: true, on: :update 
  validates :price, presence: true, on: :update
end
