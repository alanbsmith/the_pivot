module BusinessSessionsHelper

  def sign_in(business)
    remember_token = Business.new_remember_token
    cookies[:remember_token] = { value: remember_token,
                                 expires: 1.hour.from_now.utc } # may need to change this...
    business.update_attribute(:remember_token, Business.digest(remember_token))
    self.current_business = business
  end

  def sign_out
    cookies.delete(:remember_token)
    self.current_business = nil
    session[:cart_id] = nil
  end

  def signed_in?
    current_business
  end

  def current_business=(business)
    @current_business = business
  end

  def current_business
    remember_token  = Business.digest(cookies[:remember_token])
    @current_business ||= Business.find_by(remember_token: remember_token)
  end
end
