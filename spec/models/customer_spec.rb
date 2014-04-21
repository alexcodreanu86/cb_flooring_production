require 'spec_helper'

describe Customer do 

  it "has a valid factory" do 
    expect(FactoryGirl.build(:customer)).to be_valid
  end

  it "validates name presence" do 
    expect(FactoryGirl.build(:customer, name: nil)).to_not be_valid
  end

  it "validates phone presence" do 
    expect(FactoryGirl.build(:customer, phone: nil)).to_not be_valid
  end

  it "validates phone format" do 
    expect(FactoryGirl.build(:customer, phone: "123456")).to_not be_valid
  end

  it "responds to jobs" do 
    expect(FactoryGirl.build(:customer)).to respond_to(:jobs)
  end
end