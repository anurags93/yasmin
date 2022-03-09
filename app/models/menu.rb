class Menu < ApplicationRecord
	   belongs_to :parent, :class_name => 'Menu', optional: true
     has_many :children, :class_name => 'Menu', :foreign_key => 'parent_id'
     belongs_to :menu_category
     has_many :images, as: :imagable
     accepts_nested_attributes_for :images

     validates :name, presence: true  
     validates :price, presence: true
     monetize :price_cents
     monetize :tax_cents
     monetize :net_amount_cents

     #WillPaginate.per_page = 15

     after_save :update_rates
     
     def category_list
        all_child = MenuCategory.joins("INNER JOIN menu_categories as parent_menu on menu_categories.parent_id = parent_menu.id").select('menu_categories.id, concat(parent_menu.name, \'->\', menu_categories.name) as name')
        no_child_parent = MenuCategory.where(parent_id: nil).where('id not in (SELECT distinct(parent_id) FROM "menu_categories" WHERE ("menu_categories"."parent_id" IS NOT NULL))').select(:id, :name)
        (all_child + no_child_parent).sort_by &:name
    end 
     
     def category_id_without_subcategory
     MenuCategory.where(parent_id: nil).where('id not in (SELECT distinct(parent_id) FROM "menu_categories" WHERE ("menu_categories"."parent_id" IS NOT NULL))').select(:id,:name)
     end
     
     def category_id_with_subcategory
       MenuCategory.where.not(parent_id: nil).select('distinct(parent_id)').pluck(:parent_id).uniq
     end



     def items_with_tax(item_id)

      Menu.joins('LEFT JOIN menu_categories  on menu_categories.id=menus.menu_category_id INNER JOIN taxes on taxes.id=menu_categories.tax_id').select('menus.menu_category_id,menus.id,menu_ca
      tegories.tax_id,taxes.gst')

     end



      def update_rates
        tax,net_amount = calculate_tax_and_amount
        self.update_column(:tax_cents, tax*100)
        self.update_column(:net_amount_cents, net_amount*100)
      end

      private

      def calculate_tax_and_amount

        tax_percetage = menu_category.tax.gst
        tax=price*tax_percetage/100
        net_amount=price-tax
       return tax,net_amount
      end
     
end