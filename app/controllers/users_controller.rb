class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@my_image = @user.images.all.page(params[:page]).per(4)
  end
end
