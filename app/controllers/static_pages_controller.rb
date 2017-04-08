class StaticPagesController < ApplicationController
  def index
  end
  
  # FEATURED PRODUCT, 1ST PRODUCT ON THE DB
  # def landing_page
  #   @featured_product = Product.first
  # end

  # TAKE FIRST 3 PRODUCTS ON DB
  def landing_page
    @products = Product.limit(3)
  end

end



