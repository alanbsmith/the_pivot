module ApplicationHelper

  def full_title(page_title)
    base_title = "Scream n' Cream"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

    BOOTSTRAP_FLASH_MSG = {
    success: 'alert-success',
    error: 'alert-error',
    alert: 'alert-block',
    notice: 'alert-info'
  }

  def bootstrap_class_for(flash_type)
    BOOTSTRAP_FLASH_MSG.fetch(flash_type, flash_type.to_s)
  end

end
