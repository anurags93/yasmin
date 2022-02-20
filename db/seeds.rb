# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

     menu = MenuCategory.create([{ name: 'Starters', parent_id:nil ,sort_order:0},
                   {  name: 'Main Courses', parent_id:nil ,sort_order:0 },
                   {  name: 'Biryani And Rice', parent_id:nil ,sort_order:0 },
                   {  name: 'Bread', parent_id:nil ,sort_order:0 },
                   {  name: 'Drinks Menu', parent_id:nil ,sort_order:0 },
                   {  name: 'White Wine', parent_id:nil ,sort_order:0 },
                   {  name: 'Rose Wine', parent_id:nil ,sort_order:0 },
                   {  name: 'Champagnes', parent_id:nil ,sort_order:0 },
                   {  name: 'Red Wines', parent_id:nil ,sort_order:0 },
                   {  name: 'Beers', parent_id:nil ,sort_order:0 },
                   {  name: 'Soft Drinks', parent_id:nil ,sort_order:0 },
                   {  name: 'Large Bottle', parent_id:nil ,sort_order:0 }])



item = Menu.create([{ name: 'Chicken Tikka', menu_category_id:nil },
                    {  name: 'Paneer 65', menu_category_id:nil  },
                    {  name: 'Chilli Paneer', menu_category_id:nil  },
                    {  name: 'Lamb Seekh Kabab', menu_category_id:nil  },
                    {  name: 'Curry', menu_category_id:nil  },
                    {  name: 'Saag', menu_category_id:nil  },
                    {  name: 'Pathia', menu_category_id:nil  },
                    {  name: 'Dhansak', menu_category_id:nil  },
                    {  name: 'Bhuna', menu_category_id:nil  },
                    {  name: 'Korma', menu_category_id:nil  },
                    {  name: 'Chicken Biryani', menu_category_id:nil  },
                    {  name: 'Lamb Biryani', menu_category_id:nil  },
               		{  name: 'Pulao Rice', menu_category_id:nil  },
           			{  name: 'Plain Rice', menu_category_id:nil  },
       				{  name: 'Plain Naan', menu_category_id:nil  },
				    {  name: 'Cheese Naan', menu_category_id:nil  },
					{  name: 'Chapati', menu_category_id:nil  },
					{  name: 'Tandoori Roti', menu_category_id:nil  },
					{  name: 'Garlic Naan', menu_category_id:nil  },
					{  name: 'Keema Naan', menu_category_id:nil  },
					{  name: 'Corona', menu_category_id:nil  },
					{  name: 'Medusa', menu_category_id:nil  },
					{  name: 'Simba', menu_category_id:nil  },
					{  name: 'Kingfisher', menu_category_id:nil  },
					{  name: 'Pepsi', menu_category_id:nil  },
					{  name: 'Mineral Water', menu_category_id:nil  },
					{  name: 'Lemon Soda', menu_category_id:nil  },
					{  name: 'Cold Drink Soda', menu_category_id:nil  },
					{  name: 'Sauvignon Blanc Wonder Creek', menu_category_id:nil  },
					{  name: 'Chardonnay Flarestone', menu_category_id:nil  },
					{  name: 'Pinot Grigio Rose III Caggio', menu_category_id:nil  },
					{  name: 'Merlot Wonder Creek', menu_category_id:nil  },
					{  name: 'Malbec Valle De Ciebo', menu_category_id:nil  },
					{  name: 'Charles Vercey Brut', menu_category_id:nil  },
					{  name: 'Moet And Chandon Brut Imperial', menu_category_id:nil }])