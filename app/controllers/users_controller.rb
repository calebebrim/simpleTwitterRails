class UsersController < ApplicationController
    skip_before_action :require_login, only: [:new, :create,:index]  
    
    def index
        @user = User.new
        render :new
    end
    
    def show
        if params[:id]
            @user = User.find(params[:id])
            unless params[:page]
                params[:page] = 0
            end 
            @tweets = @user.tweets.paginate(:order =>"created_at ASC" ,:page => params[:page], :per_page => 14)
            render template: "tweets/index"    
        else
            @users = User.where("id NOT IN (:user_id)", user_id: @current_user.id,)            
        end
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
