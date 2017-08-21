FactoryGirl.define do
   sequence :id do |n|
    n = n+50
  end
  factory :product do
    name "test bike"
    description "test description"
    image_url "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTselaSQ4kB8O9iAaDUdTs-AfX5XFlq2S2sgmg8CZq9ZYetRz9Wg"
    colour "Blue"
    price 59.88
    id 
  end

  # factory :product2 do
  #   name "test bike"
  #   description "test description"
  #   image_url "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTselaSQ4kB8O9iAaDUdTs-AfX5XFlq2S2sgmg8CZq9ZYetRz9Wg"
  #   colour "Red"
  #   price 59.88
  #   id 
  # end

end