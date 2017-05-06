class ImageLikesController < ApplicationController
 before_action :authenticate_user!, only: [:update]

  # PATCH/PUT /image_likes/1
  # PATCH/PUT /image_likes/1.json
  def update
    @image = Image.find(params[:id])
    @current_user_like = ImageLike.where(image_id: params[:id]).where(user_id: current_user.id)
   
    if @current_user_like.presence
      @current_user_like.first.destroy
      notice = "You unliked this image."
    else
      @like = ImageLike.create(user_id: current_user.id, image_id: params[:id])
      notice = "You liked this image."
    end
    
    respond_to do |format|
      format.html { redirect_to @image, notice: notice }
      format.json { head :no_content }
    end
  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_like
      @image_like = ImageLike.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_like_params
      params.require(:image_like).permit(:user_id, :image_id)
    end
end
