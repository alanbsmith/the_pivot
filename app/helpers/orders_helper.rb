module OrdersHelper

  def set_resume_order_id(order)
    resume = Resume.find { |resume| resume.user_id = order.user.id }
    resume.order_id = order.id
  end

end
