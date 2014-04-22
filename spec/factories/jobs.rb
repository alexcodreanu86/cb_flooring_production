FactoryGirl.define do
  factory :job do |f|
    f.customer_id 1
    f.address "1 S Dearborn Chicago IL 60001"
    f.completed_at "Mon, 21 Apr 2014"
    f.description "test job"
  end
end