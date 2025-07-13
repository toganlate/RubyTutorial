class SalesController < ApplicationController
    before_action :set_sale, only: [:delete]
  
    def index
      @sales = Sale.all
      @sale = Sale.new
    end
    
    def create 
      @sale = Sale.new(sale_params)
       if @sale.save
          redirect_to products_path, notice: "Sale created successfully"
       else
          redirect_to products_path, alert: "Sale could not be created" 
       end
    end
  
    def delete
      if @sale.destroy
        redirect_to products_path, notice: "Sale deletion successful!"
      else
        render :index, notice: "Failed to delete sale"
      end
    end
  
    private
  
    def set_sale
      @sale = Sale.find(params[:id]) 
    end
  
    def sale_params
      params.require(:sale).permit(:product_name, :user_nickname, :quantity)
    end
end
