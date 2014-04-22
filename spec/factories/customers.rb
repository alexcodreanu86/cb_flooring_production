FactoryGirl.define do
  factory :customer do |f|
    f.phone "(847)-847-8447"
    f.name "Bob Marley"
    f.email "test@test.com"
    f.address "1 S Dearborn Chicago IL 60001"
  end
end