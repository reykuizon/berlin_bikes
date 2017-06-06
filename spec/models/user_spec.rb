require 'rails_helper'

describe User do
  context "first and last name present" do
    @user = User.create!(first_name: "John", last_name: "Smith", email: "sample10@gmail.com", password: 123456)
  it "should return first name only" do
    expect(User.first_name).to eq "John Smith sample9@gmail.com 123456"
  end
  end
end
