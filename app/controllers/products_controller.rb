class ProductsController < ApplicationController
  before_action :set_product, only: [:update, :delete]
  

  def index
    @products = Product.all
    @product = Product.new
    @users = User.all
    @user = User.new
  end
  
  def create 
    @product = Product.new(product_params)
     if @product.save
        redirect_to products_path, notice: "Product created successfully"
     else
        render :index, notice: "Product could not be created" 
     end
  end

  def update
    if @product.update(product_params)
      redirect_to products_path, notice: "Product update successful!"
    else
      render :index, notice: "Product could not be updated" 
    end
  end

  
  def delete
    if @product.destroy
      redirect_to products_path, notice: "Product deletion successful!"
    else
      render :index, notice: "Failed to delete product"
    end
  end
  
  

  private
  
  def set_product
    @product = Product.find(params[:id]) 
  end

  def product_params
    params.require(:product).permit(:name)
  end

end

