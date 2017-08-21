# GUESS USER CLASS
FactoryGirl.define do
  # sequence(:email) { |n| "user#{n}gmail.com"}
  factory :user do
    email "test04@gmail.com"
    password "password"
    first_name "Rey"
    last_name "Kuizon"
    admin false
  end

   factory :admin, class: User do
    email "tast13@gmail.com"
    password "password"
    first_name "Rey"
    last_name "Kuizon"
    admin true  
  end

end