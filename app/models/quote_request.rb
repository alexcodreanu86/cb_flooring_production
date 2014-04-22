class QuoteRequest < ActiveRecord::Base
  validates :phone, :name, presence: true
  validates_format_of :phone, with: /\d?\D?\d{3}\D*\d{3}\D?\d{4}\D?\d{4}?/

  before_save :format_phone

  private

  def format_phone
    self.phone.gsub!(/\d?\D?(\d{3})\D*(\d{3})\D?(\d{4})\D*(\d{4})?/, "(\\1)-\\2-\\3 ext: \\4")
    self.phone[-5..-1] = "" if self.phone.end_with?("ext: ");
  end
end


