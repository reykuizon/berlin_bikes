# GUESS USER CLASS
FactoryGirl.define do
  # sequence(:email) { |n| "user#{n}gmail.com"}
  factory :user do
    email "test03@gmail.com"
    password "password"
    first_name "Rey"
    last_name "Kuizon"
    admin false
  end

   factory :admin do
    email "tast03@gmail.com"
    password "password"
    first_name "Rey"
    last_name "Kuizon"
    admin true  
  end

end