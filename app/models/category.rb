class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :items, through: :categorizations

  validates :title, presence: true
end
