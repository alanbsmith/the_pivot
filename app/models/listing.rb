class Listing  < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :job_type, presence: true
end
