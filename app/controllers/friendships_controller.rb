class FriendshipsController < ApplicationController
    def index
        @friend_requests = Friendship.all
    end

    def create
        current_user.friendships.build(friend_id: params[:friend_id]).save
        redirect_back(fallback_location: root_path)
    end

    def destroy
        friendship = Friendship.find(params[:id])
        friendship.destroy
        redirect_back(fallback_location: root_path)
    end

    def update
        friendship = Friendship.find(params[:id])
        friendship.confirmed = true
        friendship.save
        redirect_back(fallback_location: root_path)
    end

    def show
    
    end
end
