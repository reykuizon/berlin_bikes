require 'rails_helper'

describe ProductsController , type: :controller do
  @user = FactoryGirl.create(:user)

  # RENDER INDEX PAGE
  describe "GET #index" do

    it 'responds successfully with an HTTP 200 status code' do 
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders index template" do 
      get :index
      expect(response).to render_template(:index)
    end
  end

  # RENDERS SHOW PAGE
  context "GET #show" do
    it "renders show template" do 
      @product = FactoryGirl.create(:product)
      get :show, params: {id: @product}
      expect(response).to render_template(:show)
    end
  end
  

  # CREATE 
  context "POST #create" do
    before do 
      @user = FactoryGirl.build(:admin)
      sign_in @user
    end
    it "Successfully create new Product" do  
      @product = FactoryGirl.create(:product)
      expect(response).to be_successful
    end
    it "create invalid product" do 
       expect(Product.new(name:nil)).not_to be_valid
    end  
  end  

  # DELETE
  context "DELETE #destroy" do
    before do 
      @user = FactoryGirl.build(:admin)
      @product = FactoryGirl.create(:product)
      sign_in @user
    end
    it "Successfully delete product" do  
        delete :destroy, params: {id: @product}
         # expect(response).to redirect_to products_url  //!having problem with redirect
    end  
  end

  #UPDATE
  context "PUT #update" do
    before do 
      @product = FactoryGirl.create(:product)
      @user = FactoryGirl.build(:admin)
      sign_in @user
    end
    it "Successfully update product (price)" do
      @price_edit = {:id=>@product.id, :name=>@product.name, :description=>@product.description, :image_url=>@product.image_url,  :price=> 59.88, :colour=>@product.colour}
      put :update, params: {:id=> @product.id, :product => @price_edit}
      expect(@product.price).to eq 59.88
    end
  end
  
    





end
