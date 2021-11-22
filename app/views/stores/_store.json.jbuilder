json.extract! store, :id, :product_name, :product_type, :brand, :color, :configuration, :description, :launch_year, :mrp, :sell_price, :created_at, :updated_at
json.url store_url(store, format: :json)
