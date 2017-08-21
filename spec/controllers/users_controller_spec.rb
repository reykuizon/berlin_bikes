
require 'rails_helper'

describe UsersController , type: :controller do
  
  describe "GET #show" do
    before do
      @user = FactoryGirl.create(:user)
    end

    # USER LOGIN
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


    # USER NOT LOGIN 
    context "when a user is not logged in" do
      it "will redirect to new user session" do
      get :show, params: {id: @user.id}
      expect(response).to redirect_to(new_user_session_path)
      end
    end


    # USER CANNOT ACCESS ANOTHER USER PAGE
    context"when user tries to access another users account" do
      before do
        sign_in @user
      end
      
      it "redirects to index page" do
        @user1 =FactoryGirl.create(:user)
        get :show, params: {id:@user1.id}
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
        
      end
    end
  end

end


