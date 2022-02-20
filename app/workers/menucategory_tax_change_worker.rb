class MenucategoryTaxChangeWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  
  def perform menu_category_id
    menus=Menu.where(menu_category_id: menu_category_id)
    menus.each do |menu|
      menu.update_rates
    end
  end
end