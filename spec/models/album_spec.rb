require 'spec_helper' 

describe Album do 
  it "has a valid factory" do
    expect(FactoryGirl.create(:album)).to be_valid 
  end
  it "is invalid without a title" do
    expect(FactoryGirl.build(:album, title: nil)).to_not be_valid
  end

  it "is valid without description" do
    expect(FactoryGirl.build(:album, description: nil)).to be_valid
  end

  it "responds to images" do 
    expect(FactoryGirl.build(:album)).to respond_to(:images)
  end
end