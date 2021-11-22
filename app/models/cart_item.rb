class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :store

  def total_price
		self.store.sell_price * quantity
	end
end
