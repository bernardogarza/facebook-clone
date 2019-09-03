class PostsController < ApplicationController
    def create
        post = current_user.posts.build(post_params)
        if post.save
            redirect_back(fallback_location: root_path)
        else
            flash[:error] = post.errors.full_messages
            redirect_back(fallback_location: root_path)
        end
    end

    def destroy
        post = Post.find(params[:id])
		post.destroy
		redirect_back(fallback_location: root_path)
    end

    def edit
        
    end

    private
        def post_params
            params.require(:post).permit(:body)
        end
end
