class Item < ActiveRecord::Base
  has_many :categorizations
  has_many :categories, through: :categorizations
  mount_uploader :image, ImageUploader

  def categories_list
    Category.all
  end

end
