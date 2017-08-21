# GUESS USER CLASS
FactoryGirl.define do
  sequence(:email) do |n| 
    "user#{n}@email#{n}.com"
  end
  factory :user do
    email 
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