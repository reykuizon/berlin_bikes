require 'rails_helper'

describe Comment do

  context "Testing validation" do
    
    it "it is not valid without body" do
      expect(Comment.new(body:nil)).not_to be_valid
    end

    it "it is not valid without rating" do
      expect(Comment.new(rating:nil)).not_to be_valid
    end
    
  end
end

    