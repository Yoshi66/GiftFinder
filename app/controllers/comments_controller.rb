class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user

  def create
    @demand = Demand.find(params[:demand_id])
    @comment = @demand.comments.build(comment_params)
    @comment.user= User.find(current_user.id)

    if @comment.save
      flash[:sacces] = "Thank you for your help"
      redirect_to @demand
    else
      redirect_to root_path
    end
  end

  def destroy
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:post, :url, :question, :demand_id, :user_id)
    end
end
