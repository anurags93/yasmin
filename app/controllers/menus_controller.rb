class MenusController < ApplicationController

load_and_authorize_resource
layout 'dashboard'
	def index
		#@menus = Menu.page(params[:page])
		@menus = Menu.all
		#@paging = Menu.paginate(:page => params[:page])
		@menu_category = MenuCategory
	end

	def new
		@menu = Menu.new
  end

	def create
  	
  	@menu = Menu.new(menu_params)
  	
		# @menu.menu_choice = params[:menu][:menu_choice]
		# @menu.menu_category_id = params[:menu][:menu_category_id]
		if @menu.save
			redirect_to :action => 'new'
		else
		render :action => 'new'
		end
  end

	def edit
		@menu = Menu.find(params[:id])
	end

	def update
		@menu = Menu.find(params[:id])
		@menu.menu_category_id = params[:menu][:menu_category_id]
		@menu.menu_choice = params[:menu][:menu_choice]

		if @menu.update(menu_params)
			redirect_to menus_path, notice: "Menu was successfully updated." 
		else
			render :edit, status: :unprocessable_entity 
		end
	end


	def destroy
		@menu=Menu.find(params[:id])
		@menu.destroy
		redirect_to menus_path, notice: "One Data was successfully destroyed."
	end 

	def menu_params
		params.require(:menu).permit(:name,:stock,:price,:menu_choice, :menu_category_id, :sort_order, images_attributes: [:name, :image, :description])
	end

end
