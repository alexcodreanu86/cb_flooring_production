FactoryGirl.define do
  factory :quote_request do |f|
    f.phone "(847)-847-8447"
    f.name "Bob Marley"
    f.message "Can I have a quote please?"
  end
end
