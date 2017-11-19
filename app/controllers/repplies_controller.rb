class ReppliesController < ApplicationController
    before_action :require_login
    
    def create
        @tweet = Tweet.find(params[:tweet_id])
        @repply = @tweet.repplies.create(repply_params)
        redirect_to tweet_path(@tweet)
    end

    def destroy
        @tweet = Tweet.find(params[:tweet_id])
        @repply = @tweet.repplies.find(params[:id])
        @repply.destroy
        redirect_to tweet_path(@tweet)
      end

    private 
    def repply_params
        params.require(:repply).permit(:owner,:text)
    end
    
    
end
