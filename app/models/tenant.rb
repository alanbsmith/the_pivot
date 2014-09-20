class Tenant < ActiveRecord::Base
  belongs_to :users
end
