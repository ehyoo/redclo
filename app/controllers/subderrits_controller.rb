# Subderrits Controller
class SubderritsController < ApplicationController
  before_action :set_subderrit, only: [:show, :edit, :update, :destroy]

  # GET /subderrits
  # GET /subderrits.json
  def index
    @subderrits = Subderrit.all
  end

  # GET /subderrits/1
  # GET /subderrits/1.json
  def show
  end

  # GET /subderrits/new
  def new
    @subderrit = Subderrit.new
  end

  # GET /subderrits/1/edit
  # Maybe later

  # def edit
  # end

  # POST /subderrits
  # POST /subderrits.json
  def create
    user = current_user
    @subderrit = user.subderrits.create(subderrit_params)
    @subderrit.moderators << current_user.username
    respond_to do |format|
      if @subderrit.save

        format.html { redirect_to @subderrit, notice: 'Subderrit was successfully created.' }
        format.json { render :show, status: :created, location: @subderrit }
      else
        format.html { render :new }
        format.json { render json: @subderrit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subderrits/1
  # PATCH/PUT /subderrits/1.json
  def update
    respond_to do |format|
      if @subderrit.update(subderrit_params)
        format.html { redirect_to @subderrit, notice: 'Subderrit was successfully updated.' }
        format.json { render :show, status: :ok, location: @subderrit }
      else
        format.html { render :edit }
        format.json { render json: @subderrit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subderrits/1
  # DELETE /subderrits/1.json
  def destroy
    @subderrit.destroy
    respond_to do |format|
      format.html { redirect_to subderrits_url, notice: 'Subderrit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_subderrit
    @subderrit = Subderrit.find(params[:id])
  end

  def subderrit_params
    params.require(:subderrit).permit(:name)
  end
end
