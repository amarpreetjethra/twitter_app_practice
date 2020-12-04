class UsersController < ApplicationController
    def profile

        @userid = params[:user_id]

        @userinfo = User.find(params[:user_id])

        @usercount = @userinfo.tweets

        @tweets = Tweet.all

        respond_to do |format|
            format.html # will render a view by default
            format.json { render json: {all_data: {followers: @userinfo.followers, following: @userinfo.followees}} }
        end

    end

   
end
