module ResumesHelper

  def find_applicant_name(applicant_id)
    applicant = User.find { |user| user.id == applicant_id }
    "#{applicant.first_name.capitalize} #{applicant.last_name.capitalize}"
  end

  def find_order_resume(order_id)
    resume = Resume.find { |resume| resume.order_id == order_id }
    resume.attachment_url.to_s
  end

end
