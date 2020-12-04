class FollowsController < ApplicationController
      def following
        @user = User.find(params[:user_id])
        current_user.followees << @user
        redirect_back(fallback_location: user_path(@user))
      end
      
      def unfollow
        @user = User.find(params[:user_id])
        current_user.followed_users.find_by(followee_id: @user.id).destroy
        redirect_back(fallback_location: user_path(@user))
      end
end
