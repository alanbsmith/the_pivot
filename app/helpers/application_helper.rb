module ApplicationHelper
  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end

  def image_or_fallback_admin(item)
    item.image.present? ? item.image.url(:admin_thumb) : 'fallback/default_image.png'
  end

  def image_or_fallback_user(item)
    item.image.present? ? item.image.url(:user_thumb) : 'fallback/default_image.png'
  end

  def image_or_fallback_show(item)
    item.image.present? ? item.image.url(:big_image) : 'fallback/default_image.png'
  end
end
