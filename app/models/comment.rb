class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  
  # INPUT VALIDATIONS
  validates :body, :user, :product, presence: true
  validates :rating, numericality: { only_integer: true }

  scope :rating_desc, -> { order(rating: :desc) }
  scope :rating_asc, -> { order(rating: :asc) }

 
end
