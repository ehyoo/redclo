# Comments controller
class CommentsController < ApplicationController
  # GET /comments/1
  def show
  end

  # GET /comments/1/comments/new
  def new
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.net_votes = 0
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
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to subderrit_post_path(:subderrit_id => params[:subderrit_id], :id => @comment.id), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /comments/1
  def destroy
    comment = Comment.find(params[:comment_id])
    comment.destroy
    respond_to do |format|
      format.html { redirect_to subderrit_post_path(:id => params[:post_id], :subderrit_id => params[:subderrit_id]), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @comment = Comment.find(params[:comment_id])
    cvote = Cvote.new
    cvote.value = 1
    cvote.comment = @comment
    cvote.user = current_user
    cvote.save
    redirect_to subderrit_post_path(:id => params[:post_id])
  end

  def downvote
    @comment = Comment.find(params[:comment_id])
    cvote = Cvote.new
    cvote.value = -1
    cvote.comment = @comment
    cvote.user = current_user
    cvote.save
    redirect_to subderrit_post_path(:id => params[:post_id])
  end

  def delete_vote
    Cvote.where(user_id: current_user.id, comment_id: params[:comment_id]).destroy_all
    redirect_to subderrit_post_path(:id => params[:post_id])
  end

  def edit_vote
    cvote = Cvote.where(user_id: current_user.id, comment_id: params[:comment_id]).first
    cvote.value = cvote.value * -1
    cvote.save
    redirect_to subderrit_post_path(:id => params[:post_id])
  end

  private

    # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id, :op_comment_id)
  end
end
