class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :listings, through: :categorizations

  validates :title, presence: true, uniqueness: true
end
