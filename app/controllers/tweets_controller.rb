class TweetsController < ApplicationController
    before_action :before_change , only: [:edit, :update, :destroy]
      
    
    


    def index
        # @tweets = @current_user.tweets
        @users = User.all
        @following = @current_user.following
        unless params[:page]
            params[:page] = 0
        end 
        @tweets = Tweet.where("user_id IN (:following_ids) OR user_id = :user_id", 
                                    following_ids: @current_user.following_ids, user_id: @current_user.id)
                                        .order("created_at DESC")
    end

    def show
        @tweet = Tweet.find(params[:id])
    end

    def new
        @tweet = Tweet.new
    end

    def edit

        @tweet = Tweet.find(params[:id])
        # if @tweet.user != @current_user
        #     redirect_to action: "index"
        # end
    end
    
    def create
        
        @tweet = Tweet.new(tweet_params)
        @tweet.user_id = @current_user.id
        
        if @tweet.save 
            # redirect_to @tweet
            redirect_to action: "index"            
        else
            render 'new'
        end
    end

    def update
        @tweet = Tweet.find(params[:id])
        
        if @tweet.update(tweet_params)
            # redirect_to @tweet
            redirect_to action: "index"
        else
            render 'edit'
        end
    end


    def destroy
        @tweet = Tweet.find(params[:id])
        @tweet.destroy
        
        redirect_to tweets_path
    end
    
    private 
    def tweet_params 
        params.require(:tweet).permit(:text)
    end

    def before_change
        @tweet = Tweet.find(params[:id])
        if @tweet.user != @current_user
            redirect_to action: "index"
        end
    end
end
