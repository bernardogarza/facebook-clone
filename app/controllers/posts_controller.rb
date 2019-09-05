class PostsController < ApplicationController
    before_action :authenticate_user!

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_back(fallback_location: root_path)
            flash[:notice] = "Post successfully created"
        else
            flash[:error] = @post.errors.full_messages
            redirect_back(fallback_location: root_path)
        end
    end

    def destroy
        @post = Post.find(params[:id])
		@post.destroy
        redirect_back(fallback_location: root_path)
        flash[:notice] = "Post successfully deleted"
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])

        if @post.update(post_params)
            redirect_to root_url
            flash[:notice] = "Post successfully edited"
        else
            flash[:error] = @post.errors.full_messages
            render 'edit'
        end
    end

    private
        def post_params
            params.require(:post).permit(:body)
        end
end
