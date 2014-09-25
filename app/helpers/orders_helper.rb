module OrdersHelper

  def set_resume_order_id(order)
      resume = Resume.select { |user_id| order.user_id }.last
    unless resume == nil
      resume.order_id = order.id
      resume.save!
    end
  end

  def find_order_applicant_name(order)
    user = User.find { |user| user.id == order.user_id }
    "#{user.first_name} #{user.last_name}"
  end

  def company_listings( order, current_user)
   order.listings.select { |listing| listing.creator_id == current_user.id }
  end
end
