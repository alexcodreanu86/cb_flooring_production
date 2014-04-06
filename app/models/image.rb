class Image < ActiveRecord::Base
  has_attached_file :image_path, :styles => { original: '800x1000>', :medium => "250x250>" }, :default_url => "/images/:style/missing.png"
  validates_attachment :image_path, :content_type => { :content_type => ["image/jpg", "image/jpeg" ,"image/gif", "image/png"] }

  belongs_to :album

  after_create :add_order

  def add_order
    self.order = self.album.images.count
    self.save
  end
end