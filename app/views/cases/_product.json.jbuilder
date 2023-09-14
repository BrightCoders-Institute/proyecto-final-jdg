json.extract! product, :id, :name, :description, :product_type, :brand, :image, :size, :base_price, :discount, :total_price, :stock, :availability, :created_at, :updated_at
json.url product_url(product, format: :json)
