require 'spec_helper'

describe QuoteRequest do
  it "has a valid factory" do 
    expect(FactoryGirl.create(:quote_request)).to be_valid
  end

  it "validates phone number presence" do 
    expect(FactoryGirl.build(:quote_request, phone: nil)).to_not be_valid
  end

  it "validates name presence" do 
    expect(FactoryGirl.build(:quote_request, name: nil)).to_not be_valid
  end

  it "validates that phone number is valid" do 
    expect(FactoryGirl.build(:quote_request, phone: "1234345")).to_not be_valid
  end

  it "has status false on creation" do 
    quote = FactoryGirl.build(:quote_request)
    expect(quote.status).to be_false
  end
end
