# GUESS USER CLASS
FactoryGirl.define do
  # sequence(:email) { |n| "user#{n}gmail.com"}
  factory :user do
    email "test54@gmail.com"
    password "password"
    first_name "Rey"
    last_name "Kuizon"
    admin false

    factory :admin do
      admin true
    end
    
  end
end