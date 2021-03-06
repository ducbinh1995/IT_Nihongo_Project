class ImagesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /images
  # GET /images.json
  def index
    @images = Image.all
  end

  # GET /images/1
  # GET /images/1.json
  def show
   @image_comment = ImageComment.new
   @likes = ImageLike.where(image_id: @image.id).count
    if user_signed_in?
      @current_user_like = ImageLike.where(image_id: @image.id).where(user_id: current_user.id).presence
      @image_comments ||= ImageComment.where(:image_id => @image.id)
      respond_to do |format|
        format.html
        format.json { render json: @image_comments }
      end
    end
  end

  # GET /images/new
  def new
    @image = Image.new
    @animals = Animal.all
  end

  # GET /images/1/edit
  def edit
    @image = Image.find(params[:id])
    @animals = Animal.all
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)
    @image.user_id = current_user.id

    respond_to do |format|
      if @image.save
        url = ""
        format.html { redirect_to url, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to "", notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:user_id, :animal_id, :title, :description, :file, :created_at)
    end
end
