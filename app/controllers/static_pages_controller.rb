class StaticPagesController < ApplicationController
  def home
     @animals = Animal.all
      @images = Image.all
  end
end
