class Customer < ActiveRecord::Base
  validates :name, :phone , presence: true
  validates :phone, uniqueness: true
  validates_format_of :phone, with: /\d?\D?\d{3}\D*\d{3}\D?\d{4}\D?\d{4}?/

  has_many :jobs
end