require 'rails_helper'

describe Product do

	before do 
		@product = Product.create!(name: "race bike")
		@user = User.create!(first_name: "Rey", last_name: "Kuizon", email: "test@gmail.com", password: "password")
		@product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
		@product.comments.create!(rating: 3, user: @user, body: "Ok bike!")
		@product.comments.create!(rating: 5, user: @user, body: "Great bike!")
	end

	context "when the product has comments" do
		it "returns an average rating of all comments" do 
			expect(@product.average_rating).to eq 3
		end
		it "returns an invalid product description" do
		expect(Product.new(description: "Nice bike")).not_to be_valid
		end
	end
	
end