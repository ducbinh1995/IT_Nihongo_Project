class StaticPagesController < ApplicationController
  def home
     @animals = Animal.all
      @images = Image.left_joins(:image_likes).group("images.id").order("count(images.id) DESC")
  end
end
