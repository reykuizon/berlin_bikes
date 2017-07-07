require 'rails_helper'

describe Comment do

  context "Comment validation" do
    it "it is not valid without body" do
      expect(Comment.new(body:nil)).not_to be_valid
    end

    it "it is not valid without rating" do
      expect(Comment.new(rating:nil)).not_to be_valid
    end
  end

  context "Succesful comment" do
    before do
      @comment = Comment.new(body:"nice", rating: 5) 
    end
    it "will return comments & rating" do
      expect(@comment.body).to eq "nice"
      expect(@comment.rating).to eq 5
    end
  end

end

    