class Image < ActiveRecord::Base
  has_attached_file :image_path, 
                    :styles => { original: '1200x1200>', thumb: "150x150>"}, 
                    :default_url => "/images/:style/missing.png"
                    
  validates_attachment :image_path, :content_type => { :content_type => ["image/jpg", "image/jpeg" ,"image/gif", "image/png"] }
  validates_attachment :image_path, presence: true

  belongs_to :album
end