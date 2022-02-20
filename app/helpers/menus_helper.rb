module MenusHelper
 
		 def menupage_input_field_value(item_hash_array)


		            if @cart_data.key?(item_hash_array.to_s)
		              x = item_hash_array.to_s
		              @cart_data[x] 
		            else                     
		              0
		            end
		 end


		 def item_stock_show(stock_value)

		 	 if(stock_value!= 0  &&  stock_value< 5) 
									
			'<div style="background:#ffa03e;color:#fff;width:30%;display:inline;font-size:10px;padding:5px;border-radius:5px;">Low Stock</div>'
									    
			elsif(stock_value<=0) 
			
			'<div style="background:red;color:#fff;width:30%;display:inline;font-size:10px;padding:5px;border-radius:5px;">Out Of Stock</div>'
			
			end


		 end
end
