class CommentsController < ApplicationController
    def create
        post = Post.find(params[:post_id])
        comment = post.comments.build(comment_params.merge(user: current_user))
        if comment.save
            flash[:notice] = 'Your comment was successfully posted'
            redirect_back(fallback_location: root_path)
        else
            flash[:error_comment] = comment.errors.full_messages
            redirect_back(fallback_location: root_path)
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        redirect_back(fallback_location: root_path)
        flash[:notice] = "Comment successfully deleted"
    end

    private
        def comment_params
            params.require(:comment).permit(:body)
        end
end
