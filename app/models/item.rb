class Item < ActiveRecord::Base
	belongs_to :user




  def self.search_for(query)
    	where('name LIKE :query OR description LIKE :query OR size LIKE :query', :query => "%#{query}%")
  end

  def self.exclude(current_user)
  		where("user_id != :user", :user => "#{current_user.id}")
  end



end
