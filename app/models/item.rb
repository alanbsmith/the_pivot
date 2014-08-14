class Item < ActiveRecord::Base
  has_many :categorizations
  has_many :categories, through: :categorizations

  def categories_list
    Category.all
  end

end
