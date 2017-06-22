# GUESS USER CLASS
FactoryGirl.define do
  # sequence(:email) { |n| "user#{n}gmail.com"}
  factory :user do
    email "test1@gmail.com"
    password "password"
    first_name "Rey"
    last_name "Kuizon"
    admin false
  end
end