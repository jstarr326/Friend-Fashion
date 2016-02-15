class Item < ActiveRecord::Base
	belongs_to :user
	validates :name, :description, :category, :size, :price, :image, presence: true
	has_attached_file :image,   styles: { thumb: ["160x160#", :jpg], original: ['500x500>', :jpg] },
                  convert_options: { thumb: "-quality 75 -strip",
                                     original: "-quality 85 -strip" }

	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates_attachment :image, presence: true,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
                     size: { in: 0..500.kilobytes }


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
