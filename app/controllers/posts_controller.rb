class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.net_votes = 0
    respond_to do |format|
      if @post.save
        format.html { redirect_to subderrit_post_path(:subderrit_id => params[:subderrit_id], :id => @post.id), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to subderrit_post_path(:subderrit_id => params[:subderrit_id], :id => @post.id), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to subderrit_path(:id => params[:subderrit_id]), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @post = Post.find(params[:post_id])
    pvote = Pvote.new
    pvote.value = 1
    pvote.post = @post
    pvote.user = current_user
    pvote.save
    redirect_to Subderrit.find(params[:subderrit_id])
  end

  def downvote
    @post = Post.find(params[:post_id])
    pvote = Pvote.new
    pvote.value = -1
    pvote.post = @post
    pvote.user = current_user
    pvote.save
    redirect_to Subderrit.find(params[:subderrit_id])
  end

  def delete_vote
    Pvote.where(user_id: current_user.id, post_id: params[:post_id]).destroy_all
    redirect_to Subderrit.find(params[:subderrit_id])
  end

  def edit_vote
    pvote = Pvote.where(user_id: current_user.id, post_id: params[:post_id]).first
    pvote.value = pvote.value * -1
    pvote.save
    redirect_to Subderrit.find(params[:subderrit_id])
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :subderrit_id)
    end
end
