class HomeController < ApplicationController
   
  # skip_before_filter :verify_authenticity_token, only: :addcart
 
  def index
   
  end
   
  def user_profile

    @user_addresses=UserAddress.where(user_id: current_user.id)
  end

  def menu
  @menu_list=MenuCategory.all.where(parent_id:nil)
  @menu_category=MenuCategory
  @distinct_menu=Menu.all
  @cart_data=current_user.cart_array
  @item_total=0
    @cart_data.each do |item_id,item_qty|
      @item_obj=@distinct_menu.find(item_id.to_i)
      @item_total=@item_total+(@item_obj.price)*item_qty
    end
  @menupage_itemlist_with_nochild=Menu.new

  @data_array=[]

  @menupage_itemlist_with_nochild.category_id_without_subcategory.each do |categorydata|
  @data_array.push fetch_items(categorydata.id)
  end

  # append_items(@data_array)

  @menupage_itemlist_with_nochild.category_id_with_subcategory.each do |category_id|
  category = MenuCategory.find category_id
  h = {id: category.id, name: category.name, subcategories: []}
  subcategories = MenuCategory.where(parent_id: category_id)
  subcategories.each do |subcategory|
  h[:subcategories].push fetch_items(subcategory.id)
  end
  @data_array.push h
  end

  end
    
  def view_cart_page
  @distinct_menu=Menu.all
  @cart_data=current_user.cart_array
  @item_total=0
    @cart_data.each do |item_id,item_qty|
      @item_obj=@distinct_menu.find(item_id.to_i)
      @item_total=@item_total+(@item_obj.price)*item_qty
    end

  end

  def checkout_params
    params.require(:order_summary).permit(:order_address)
  end

    private

  def fetch_items(category_id)
  menu_category = MenuCategory.find category_id
  h = {id: menu_category.id ,name: menu_category.name}
  items =  Menu.where(menu_category_id: menu_category.id)
  arr = []
    items.each do |item|
      item_h = Hash.new
      item_h[:id] = item.id
      item_h[:name] = item.name
      item_h[:price] = item.price
      item_h[:stock] = item.stock
      arr.push(item_h)
    end
  h[:items] = arr
  return h
  end




    
end
