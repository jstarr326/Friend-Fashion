class Item < ActiveRecord::Base
	belongs_to :user
	validates :name, :description, :category, :size, :price, presence: true




  def self.search_for(query)
    	where('name LIKE :query OR description LIKE :query OR size LIKE :query', :query => "%#{query}%")
  end

  def self.exclude(current_user)
  		where("user_id != :user", :user => "#{current_user.id}")
  end

  def self.friends_items(friends_list)
  	where("user_id in (:friends_list)", :friends_list => friends_list)
  end



end
