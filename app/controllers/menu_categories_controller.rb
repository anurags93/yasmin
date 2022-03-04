class MenuCategoriesController < ApplicationController
  load_and_authorize_resource
  layout 'dashboard'
  def index
   @menu_category = MenuCategory.all.order(:id)
  end

  def new
    @menu_category = MenuCategory.new

    
  end

  # def show
  #   @menu_category = MenuCategory.all
    
  # end

  def create
    #binding.pry
   @menu_category = MenuCategory.new(menu_params)

   @menu_category.parent_id = params[:menu_category][:parent_id]
   @menu_category.tax_id = params[:menu_category][:tax_id]
   
   ##binding.pry
     if @menu_category.save
       ### redirect_to :action => 'index'
       MenucategoryTaxChangeWorker.perform_async(@menu_category.id)
          redirect_to new_menu_category_path, notice: "Menu Category was successfully Added." 
      
     else
        render :action => 'new'
     end
   
  end
  
  def edit
     @menu_category = MenuCategory.find(params[:id])
  end

  def update
      @menu_category = MenuCategory.find(params[:id])
      @menu_category.parent_id = params[:menu_category][:parent_id]
      @menu_category.tax_id = params[:menu_category][:tax_id]
  
      if @menu_category.update(menu_params)
        MenucategoryTaxChangeWorker.perform_async(@menu_category.id)
       
        redirect_to menu_categories_path, notice: "Menu Category was successfully updated." 
      
      else
         render :edit, status: :unprocessable_entity 
      end
   
  end

  def destroy
    @menu_category=MenuCategory.find(params[:id])
    @menu_category.destroy
    respond_to do |format|
      format.html { redirect_to menu_categories_path, notice: "One Data was successfully destroyed." }
      format.json { head :no_content }
    end
  end 

   def menu_params
      params.require(:menu_category).permit(:name, :sort_order)
   end

end