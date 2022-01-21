class MenuCategoriesController < ApplicationController
  
  def index
   @menu_categories = MenuCategory.all
  end

  def new
    @menu_category = MenuCategory.new
    #@menu=menu_category.new
  end
end