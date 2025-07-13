class UsersController < ApplicationController
    before_action :set_user, only: [:update, :delete]
  
    def index
      @users = User.all
      @user = User.new
    end
    
    def create 
      @user = User.new(user_params)
       if @user.save
          redirect_to products_path, notice: "User created successfully"
       else
          render :index, notice: "User could not be created" 
       end
    end
  
    def update
      if @user.update(user_params)
        redirect_to products_path, notice: "User update successful!"
      else
        render :index, notice: "User could not be updated" 
      end
    end
    def delete
      if @user.destroy
        redirect_to products_path, notice: "User deletion successful!"
      else
        render :index, notice: "Failed to delete product"
      end
    end
  
    private
  
    def set_user
      @user = User.find(params[:id]) 
    end
  
    def user_params
      params.require(:user).permit(:name, :address, :nickname)
    end
  end