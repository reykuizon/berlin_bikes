
require 'rails_helper'

describe UsersController do
  let(:user1){User.create!(email:"reykuizon90@gmail.com", password:"password")}
  let(:user2){User.create!(email:"reykuizon91@gmail.com", password:"password")}
  # @user = User.create!(email:"reykuizon1111@gmail.com", password:"password")
  # @user1 = User.create!(email:"reykuizon2222@gmail.com", password:"password")
  # @user = FactoryGirl.create(:user)

  describe "GET #show" do

    context "when a user is logged in" do
      before do
        sign_in user1
      end
      it "loads correct user details" do
        get :show, params: {id: user1.id}
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq user1
      end

      context "User cannot see other user page" do
        before do
          sign_in user2 
        end
      it "redirect to root path" do
        get :show, params: {id: user2.id}
        expect(assigns(:user)).to eq user2
        expect(response).to redirect_to(root_path)
      end 
      end
    end
    
    context "when a user is not logged in" do  
        it "redirects to login" do
        get :show, params: {id: user1.id}
        expect(response).to redirect_to(new_user_session_url)
      end
    end

    
    
  end

end


