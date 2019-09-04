class CommentsController < ApplicationController
    def create
        post = Post.find(params[:post_id])
        comment = post.comments.build(comment_params.merge(user: current_user))
        if comment.save
            flash[:notice] = 'You comment was successfully posted'
            redirect_back(fallback_location: root_path)
        else
            flash[:error] = @post.errors.full_messages
            redirect_back(fallback_location: root_path)
        end
    end

    def destroy
    
    end

    private
        def comment_params
            params.require(:comment).permit(:body)
        end
end
