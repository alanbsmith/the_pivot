class Resume < ActiveRecord::Base
  belongs_to :user
  belongs_to :cart_listing

  has_attached_file :document,
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_options => {...}



  validates_attachment :document, content_type: { content_type: "application/pdf" }

end
