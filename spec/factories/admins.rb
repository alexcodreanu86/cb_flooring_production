FactoryGirl.define do
  factory :admin do |f|
    f.email "test@test.com"
    f.password "testtest"
    f.password_confirmation "testtest"
  end
end 