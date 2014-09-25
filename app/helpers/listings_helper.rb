module ListingsHelper

  def signed_in_as_business?(current_user)
    if signed_in?
      has_company_name?(current_user)
    end
  end

  def has_company_name?(current_user)
    current_user.company_name.to_s
    current_user.company_name != ""
  end

  def company_listings(current_user)
   Listing.select { |listing| listing.creator_id == current_user.id }
  end

end
