
require 'rails_helper'

describe UsersController do
  # let(:user1){User.create!(email:"reykuizon92@gmail.com", password:"password")}
  # let(:user2){User.create!(email:"reykuizon93@gmail.com", password:"password")}
  
  before do
  @user = FactoryGirl.create(:user)
  end
  
  describe "GET #show" do
    # LOAD STATUS 200 - @user
    context "when a user is logged in" do
      before do
        sign_in @user
      end
      it "loads correct user details" do
        get :show, params: {id: @user.id}
        expect(response).to be_successful
        expect(assigns(:user)).to eq @user
      end
    end

      # USER CANNOT SEE OTHER - USER2
      # context "User cannot see other user page" do
      #   before do
      #     sign_in user2
      #   end
      #   it "redirect to root path" do
      #     get :show, params: {id: user2.id}
      #     expect(response).to redirect_to(root_path)
      #     expect(assigns(:user)).to eq user2
      #   end 
      # end
    
    
    # REDIRECT TO LOG IN PAGE
    context "when a user is not logged in" do  
        it "redirects to login" do
        get :show, params: {id: @user.id}
        expect(response).to redirect_to(new_user_session_url)
      end
    end

  end

end


