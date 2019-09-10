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
        flash[:message] = "You ignored the friend request"
    end

    def update
        friendship = Friendship.find(params[:id])
        friendship.confirmed = true
        friendship.save
        flash[:message] = "You and #{friendship.user.full_name} are friends now"
        redirect_back(fallback_location: root_path)
    end
end
