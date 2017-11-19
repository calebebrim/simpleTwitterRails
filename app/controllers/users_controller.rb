class UsersController < ApplicationController
    skip_before_action :require_login, only: [:new, :create,:index]  
    
    def index
        @user = User.new
        render :new
    end
    
    def show
        @users = User.where("id NOT IN (:user_id)", user_id: @current_user.id,)
    end
    


    def new
        @user = User.new
    end

    def create
        @user = User.new(allowed_params)
        if @user.save
            redirect_to root_url, notice: 'Thank you for signing up!'
        else
            render :new
        end
    end
    
    private
  
    def allowed_params
        params.require(:user).permit(:name,:email, :password, :password_confirmation, :password_digest)
    end
end
