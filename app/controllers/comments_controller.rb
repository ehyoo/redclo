class CommentsController < ApplicationController
  before_action :set_subderrit, only: [:show, :edit, :update, :destroy]

  # GET /comments/1
  def show
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to subderrit_post_path(:subderrit_id => params[:subderrit_id], :id => params[:post_id])
  end

  # PATCH/PUT /comments/1
  def update
  end


  # DELETE /comments/1
  def destroy
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body, :post_id)
    end
end
