require 'spec_helper' 

describe Image do
  it "can have attached file" do 
    should have_attached_file(:image_path) 
  end
  it "it checks that an attachment is present on creation"do
    should validate_attachment_presence(:image_path)
  end

  it "validates the content type"do 
    should validate_attachment_content_type(:image_path).
                allowing('image/png', 'image/jpg', 'image/jpeg', 'image/gif').
                rejecting('text/plain', 'text/xml')
  end
end