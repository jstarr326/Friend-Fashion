class Item < ActiveRecord::Base

	 def self.search_for(query)
    where('name LIKE :query OR description LIKE :query OR size LIKE :query', :query => "%#{query}%")
  end
end
