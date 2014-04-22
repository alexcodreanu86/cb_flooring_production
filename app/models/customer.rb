class Customer < ActiveRecord::Base
  validates :name, :phone , presence: true
  validates :phone, uniqueness: true
  validates_format_of :phone, with: /\d?\D?\d{3}\D*\d{3}\D?\d{4}\D?\d{4}?/

  has_many :jobs

  def update_phone_number
    format_phone
  end

  private

  def format_phone
    self.phone.gsub!(/\d?\D?(\d{3})\D*(\d{3})\D?(\d{4})\D*(\d{4})?/, "(\\1)-\\2-\\3 ext: \\4")
    self.phone[-5..-1] = "" if self.phone.end_with?("ext: ");
  end
end