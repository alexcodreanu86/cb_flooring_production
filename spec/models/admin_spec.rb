require 'spec_helper' 

describe Admin do 
  it "has a valid factory" do
    expect(FactoryGirl.create(:admin)).to be_valid 
  end
  
  it "is invalid without a email" do
    expect(FactoryGirl.build(:admin, email: nil)).to_not be_valid
  end
  
end