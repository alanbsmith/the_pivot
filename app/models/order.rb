class Order < ActiveRecord::Base
  include AASM
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items
  belongs_to :user
  validates :user_id, presence: true

  def add_cart_items_from_cart(cart)
    cart.cart_items.each do |item|
      item.cart_id = nil
      cart_items << item
    end
  end

  def total_price
    cart_items.to_a.sum { |cart_item| cart_item.total_price }
  end

  aasm :column => 'status' do
    state :cart, :initial => true
    state :paid
    state :ordered
    state :cancelled
    state :completed

    event :ordered do
      transitions :from => :cart, :to => :ordered
    end

    event :cancelled do
      transitions :from => [:cart, :ordered, :paid], :to => :cancelled
    end

    event :paid do
      transitions :from => :ordered, :to => :paid
    end

    event :completed do
      transitions :from => :paid, :to => :completed
    end
  end
end