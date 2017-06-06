class Product < ApplicationRecord
  has_many :orders
  has_many :comments

  # VALIDATE PRODUCT NAME
  validates :name, presence: true
  # validates :description, presence: true
  # validates :image_url, presence: true
  # validates :colour, presence: true
  # validates :price, numericality: true


  # SEARCH BOX
  def self.search(search_term)
    if Rails.env.development?
      Product.where("name LIKE ?", "%#{search_term}%")
    else
      Product.where("name ilike ?", "%#{search_term}%")
    end
  end
  
  # GET THE FIRST HIGHT RATING 
  def highest_rating_comment
    comments.rating_desc.pluck(:body).first
  end

  # GET THE FIRST LOWEST RATING
  def lowest_rating_comment
    comments.rating_asc.pluck(:body).first
  end

  # GET THE PRODUCT AVERAGE RATING
  def average_rating
    comments.average(:rating).to_f
  end
 

end
