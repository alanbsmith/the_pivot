class ApplicantMailer < ActionMailer::Base
  default from: "employmeplease@gmail.com"

  def welcome_applicant_email(applicant)
    @applicant = applicant
    @url  = 'http://employme.com/login'
    mail(to: @applicant.email, subject: 'Welcome to EmployMe!')
  end

  def welcome_business_email(business)
    @business = business
    @url  = 'http://employme.com/login'
    mail(to: @business.email, subject: 'Welcome to EmployMe!')
  end

  def welcome_admin_email(admin)
    @admin = admin
    @url  = 'http://employme.com/login'
    mail(to: @admin.email, subject: 'Welcome to EmployMe!')
  end

end
