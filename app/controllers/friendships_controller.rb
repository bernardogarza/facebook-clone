class FriendshipsController < ApplicationController
    def index
    
    end

    def create
        user = User.find(params[:user_id])
        friend_request = current_user.friendships.build(friend: user).save
        redirect_back(fallback_location: root_path)
    end

    def destroy
    
    end

    def update
    
    end

    def show
    
    end
end
