class Car < ApplicationRecord
  scope :search_by_all, ->(search_query) do    
    Car.where(
      "name LIKE :search OR 
       make LIKE :search OR 
       style LIKE :search OR
       year LIKE :search OR
       price_range LIKE :search OR
       color LIKE :search",
      search: sanitize_sql_like(search_query)).to_a
  end

  scope :featured_cars, -> do
    Car.where("featured = ? ", true).to_a
  end
end
