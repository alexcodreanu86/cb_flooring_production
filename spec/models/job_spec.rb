require 'spec_helper'

describe Job do
   
  it "has a valid factory" do 
    expect(FactoryGirl.build(:job)).to be_valid
  end

  it "belongs to a customer" do 
    expect(FactoryGirl.build(:job)).to respond_to(:customer)
  end

  it "is invalid without customer id" do 
    expect(FactoryGirl.build(:job, customer_id: nil)).to_not be_valid
  end

  it "is invalid without an address" do 
    expect(FactoryGirl.build(:job, address: nil)).to_not be_valid
  end

  it "is valid without a description" do 
    expect(FactoryGirl.build(:job, description: nil)).to be_valid
  end

  it "is valid without a completed at date" do 
    expect(FactoryGirl.build(:job, completed_at: nil)).to be_valid
  end

  context "reader methods" do 
    let(:a_job){FactoryGirl.build(:job)}

    it "description returns proper description" do
      expect(a_job.description).to be == "test job"
    end

    it "completed_at returns proper date" do 
      expect(a_job.completed_at).to be == "Mon, 21 Apr 2014".to_date
    end

    it "address returns proper address" do  
      expect(a_job.address).to be == "1 S Dearborn Chicago IL 60001"
    end
  end

end