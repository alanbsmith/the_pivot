module ResumesHelper

  def find_applicant_name(applicant_id)
    applicant = User.find { |user| user.id == applicant_id }
    "#{applicant.first_name} #{applicant.last_name}"
  end

  def find_order_resume(order_user_id)
    resume = Resume.find { |resume| resume.user_id == order_user_id }
    "#{resume.attachment}"
  end

end
