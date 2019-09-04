class LikesController < ApplicationController
    def create
        post = Post.find(params[:post_id])
        like = post.likes.build(user: current_user)
        like.save
        redirect_back(fallback_location: root_path)
    end

    def destroy
        post = Post.find(params[:post_id])
        like = post.likes.find_by(user: current_user).destroy
        redirect_back(fallback_location: root_path)
    end
end
