class Product < ApplicationRecord
  has_many :orders
  def self.search(search_term)
    Product.where("lower(name) LIKE lower(?)", "%#{search_term}%")
    #Product.where("name LIKE ?", "%#{search_term}%")
  end
end


