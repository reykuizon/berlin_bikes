require 'rails_helper'

describe ProductsController , type: :controller do
	before do
		@user = FactoryGirl.create(:user)
    @admin = FactoryGirl.create(:admin)
    @product1 = FactoryGirl.create(:product, name:'New Bike')
	end

  
  #--------- INDEX ----------
  describe "GET #index" do
    let(:products) { Product.all }
    subject{ get :index}
    it "responds successfully with an HTTP 200 status code" do
      expect(subject).to be_success
      expect(subject).to have_http_status(200)
    end
    it "renders index template" do
      expect(subject).to render_template(:index)
    end
    it "assigns all products to @products " do
      get :index
      expect(assigns['products']).to eq(products)
    end
  end


  #--------- SHOW ----------
  describe " GET #show" do
    let(:product){FactoryGirl.create(:product)}
    subject{ get :show, params: {id: product.id}}
    
    it "renders show template" do
      expect(subject).to render_template(:show)
    end
  end


  #--------- CREATE ----------
  describe " POST #create" do

    # ADMIN
    context "when admin is logged in" do
      before do
        sign_in @admin
      end

      it "create valid Product" do
      expect{
          post :create, params: {product: FactoryGirl.attributes_for(:product)}
          }.to change(Product, :count).by(1)
      end
      it "does not create invalid product" do
         expect{
          post :create, params: {product: FactoryGirl.attributes_for(:product, name: nil)}
          }.not_to change(Product, :count)
      end
    end

    # NOT ADMIN
    context " when user is not admin" do
      before do
        sign_in @user
      end
      it "it redirect to root path" do  
        post :create, params: {product: FactoryGirl.attributes_for(:product)}
        expect(response).to have_http_status(302) #URL redirection
        expect(response).to redirect_to root_path
      end
		end
	end
	
	
  #--------- EDIT ----------
		describe " GET #edit" do	
			
			let (:product){FactoryGirl.create(:product)}
		
      # ADMIN
			context " when admin is logged in" do
				before do
					sign_in @admin
					end	
				it "renders edit template" do
					get :edit, params: { id: product.id }
					expect(response).to render_template :edit
				end
			end

			# NOT ADMIN			
			describe " when user is not admin" do
				before	do
					sign_in @user
				end
				it "redirect to root path" do
					get :edit, params: { id: product.id }
					expect(response).to have_http_status(302)
					expect(response).to redirect_to root_path
				end
      end
		end
    
    
	 #--------- UPDATE ----------
   describe " PATH #update" do 
    
    # WITH VALID ATTRIBUTES
		context " with valid product attributes" do
			before do
				sign_in @admin
				patch :update, params: {
          id: @product1.id, product: { name: 'New Bike Name'}
        }
			end	

      it "update @product1 attributes" do
        @product1.reload
				expect(@product1.name).to eq("New Bike Name")
      end
      it "redirect to updated product" do
        expect(response).to redirect_to @product1
      end
    end

    # WITH INVALID ATTRIBUTE
    context " with invalid product attributes" do
			before do
				sign_in @admin
				patch :update, params: {
          id: @product1.id, product: { name: nil}
        }
			end	

      it "does not update @product1 attributes" do
        @product1.reload
				expect(@product1.name).to eq("New Bike")
      end
      it "renders the :edit template" do        
        expect(response).to render_template :edit
      end         
    end
  end


   #--------- DELETE ----------
  describe " DELETE #destroy" do
    before do
      sign_in @admin
    end

    it "deletes the product" do
      expect {
        delete :destroy, params: {id: @product1.id}                
      }.to change(Product, :count).by(-1)
    end
    it "redirects to product#index" do
      delete :destroy, params: {id: @product1.id}
      expect(response).to redirect_to('/products')
    end
  end

end



