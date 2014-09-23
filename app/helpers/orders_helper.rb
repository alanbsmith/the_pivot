module OrdersHelper

  def set_resume_order_id(order)
    resume = Resume.select { |user_id| order.user_id }.last
    resume.order_id = order.id
    resume.save!
  end

end
