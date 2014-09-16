module ApplicantSessionsHelper

  def sign_in(applicant)
    remember_token = Applicant.new_remember_token
    cookies[:remember_token] = { value: remember_token,
                                 expires: 1.hour.from_now.utc } # may need to change this...
    applicant.update_attribute(:remember_token, Applicant.digest(remember_token))
    self.current_applicant = applicant
  end

  def sign_out
    cookies.delete(:remember_token)
    self.current_applicant = nil
    session[:cart_id] = nil
  end

  def signed_in?
    current_applicant
  end

  def current_applicant=(applicant)
    @current_applicant = applicant
  end

  def current_applicant
    remember_token  = Applicant.digest(cookies[:remember_token])
    @current_applicant ||= Applicant.find_by(remember_token: remember_token)
  end
end
