module SessionsHelper

  def sign_in(user)
    remember_token = User.new_remember_token
    cookies[:remember_token] = { value: remember_token,
                                 expires: 1.hour.from_now.utc } # may need to change this...
    user.update_attribute(:remember_token, User.digest(remember_token))
    self.current_user = user
  end

  def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
    session[:cart_id] = nil
  end

  def signed_in?
    current_user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token  = User.digest(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_listing=(listing)
    listing.creator_id
  end

  def current_listing
    listing = Listing.find_by(params[:creator_id])
    listing.creator_id
  end
end
