class Listing  < ActiveRecord::Base
  has_many :cart_listings
  has_many :carts, through: :cart_listings

  has_many :categorizations
  has_many :categories, through: :categorizations

  validates :title, presence: true
  validates :description, presence: true
  validates :employment_type, presence: true
  validates :pay_rate, presence: true
  validates :closing_date, presence: true
  validates :location_city, presence: true
  validates :location_state, presence: true

  belongs_to :creator, class_name: 'User'

  def categories_list(category_list)
    if category_list
      valid_categories = category_list.reject do |category|
       category.empty?
      end

      new_or_found_categories = valid_categories.map do |title|
        Category.find_or_create_by(title: title)
      end

      self.categories = new_or_found_categories
    end
  end


end
