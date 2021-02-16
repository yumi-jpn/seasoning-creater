class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    redirect_to "/tastes/#{@comment.taste.id}" #コメントと結びつくツイートの詳細画面
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :image).merge(user_id: current_user.id, taste_id: params[:taste_id])
  end
end
