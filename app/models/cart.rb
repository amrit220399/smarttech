class Cart < ApplicationRecord
    has_many :cart_items, :dependent => :destroy

    def add_product(store_id)
        current_item = cart_items.find_by_store_id(store_id)
        if current_item
            current_item.quantity += 1
        else
            current_item = cart_items.build(:store_id => store_id)
        end
        current_item
    end
    
    def total_price
        cart_items.to_a.sum { |item| item.total_price }
    end 
end
