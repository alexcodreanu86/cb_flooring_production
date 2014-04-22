class Job < ActiveRecord::Base
  belongs_to :customer

  validates :customer_id, :address, presence: true
end