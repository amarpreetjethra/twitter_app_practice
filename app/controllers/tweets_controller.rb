class TweetsController < ApplicationController
    before_action :authenticate_user!
    def index
        # collecting current user's followees id
        @followees_id = current_user.followees.map{|x| x[:id]}
        
        @all_tweets = Tweet.all.order(created_at: :desc)
       
        if params[:type]=="latest"
            @tweets = Tweet.where("user_id IN (?)", @followees_id).order(created_at: :desc)
            @all_tweets = Tweet.all.order(created_at: :desc)
        else
            @tweets = Tweet.where("user_id IN (?)", @followees_id).order(created_at: :asc)
            @all_tweets = Tweet.all.order(created_at: :asc)
        end
        respond_to do |format|
            format.html # will render a view by default
            format.json { render json: @tweets }
        end
    end
      
       
      
    def new  
    @tweet = Tweet.new
    end
      
       
      
    def create
    @tweet = Tweet.new(tweet_params)
      
    @tweet.user_id = current_user.id
      
    if @tweet.save
      
        redirect_to '/tweets#index'
      
    else
      
        render 'new'
      
    end
      
    end
      
    def destroy

        @tweet = Tweet.find(params[:id])
    
        @tweet.destroy
    
        redirect_to '/', :notice => "Your tweet has been deleted"
    
      end
       
      
    private
      
    def tweet_params
      
        params.require(:tweet).permit(:body,:user_id)
      
    end
end
