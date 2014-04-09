class QuoteRequest < ActiveRecord::Base
  validates :phone, :name, presence: true
  validates_format_of :phone, with: /\d?\D?\d{3}\D*\d{3}\D?\d{4}\D?\d{4}?/
end
