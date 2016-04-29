class CommentsController < ApplicationController

  # GET /comments/1
  def show
  end

  # GET /comments/1/comments/new
  def new
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    if comment_params[:op_comment_id]
      op_comment = Comment.find(comment_params[:op_comment_id])
      @comment.user = current_user
      @comment.save
      op_comment.replies << @comment
      op_comment.save
    else 
      @comment.save
    end
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
      params.require(:comment).permit(:body, :post_id, :op_comment_id)
    end
end
