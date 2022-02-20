  

  $(document).ready(function() {
   
			   $(".clickMenuCls").on("click",function(e){
			   //alert($(".clickMenuCls a").attr("href"));
			   });
			   
     			/*    $(".item_div").on("click",function(e)
			    {  
			       
			        $("#mainJsonMenuSec").html("");
			        $(".loadingImgSec").css("display","block");
			        $("#itemModal").modal("show");
			        var cur_id=$(this).attr("id");
			        cur_id=cur_id.split("_");
			        cur_id=cur_id[1];
			        var cur_id=cur_id;
			        var price=$("#price_"+cur_id).val();
			       
			        $.ajax({
					type:"post",
					dataType:"json",
						cache:false,
					url:"fetch_item.php",
					data:{
					    fcur_id:cur_id
					},
					success: function(r_data){	

					if(r_data[0].haschild=="" || r_data[0].haschild==null){
					    var subMenuStructure="";
					    var finalsubmenustruct1="";
					}else{
					    var subMenuStructure=r_data[0].haschild;
					    var submenuID=subMenuStructure;
					    fetchSubMenuFunction(submenuID);
					    var finalsubmenustruct1=finalsubmenustruct;
					    //alert(finalsubmenustruct1);
					}
					if(finalsubmenustruct1=="" || finalsubmenustruct1=="null")
					{
					    
					    if(r_data[0].qty==0){
					        var nQtySec='';
					    }
					    else{
					        var nQtySec=r_data[0].qty+' Quantity In Cart'; 
					    }
					    
					    
					    var buttonStruct1="";
					    var buttonStruct2='<div style="color:green;font-weight:bold;text-align:center;">'+nQtySec+'</div><br><div class="rightSubMenu" style="float:left;"><div class="addBtnMenu commonBtnMenu1" onclick="addButton('+r_data[0].id+')"; id="addcart_'+r_data[0].id+'">+</div><input onKeyDown="return false" type="number" class="qtyBtnMenu1 txt_qty_'+r_data[0].id+'" value="0" min="0" title="1" id="qtycart_<?php echo $i; ?>"><div onclick="removeButton('+r_data[0].id+');"class="removeBtnMenu1 commonBtnMenu1" id="removecart_<?php echo $i; ?>">-</div></div><div class="" style="float:right;  margin-top:11px;"><a href="javascript:void(0);" onclick="btnAddToCart('+r_data[0].id+');" class="cartPopBtn1 viewCartPopupBtn button01  addToCartBtn">Add to Cart </a><div align="center" class="hide_loader loader_div_'+r_data[0].id+'"><img src="images/loading2.gif" class="img-responsive" style="width:20%;position: relative;left: 70px;top: -28px;"></div></div><input type="hidden" value='+r_data[0].id+' id="txt_hidden_pro_id_'+r_data[0].id+'"><input type="hidden" value="'+r_data[0].cat_name+'" title='+r_data[0].cat_name+' id="txt_hidden_name_'+r_data[0].id+'"><input type="hidden" value='+r_data[0].price+' id="txt_hidden_price_'+r_data[0].id+'"><div class="clearbothcls"></div>';
					}
					else
					{
					     var buttonStruct2="";
					    var buttonStruct1='<br><div class="leftCartSec"><div class="addBtnMenu commonBtnMenu1" onclick="addButton('+r_data[0].id+')"; id="addcart_'+r_data[0].id+'">+</div><input onKeyDown="return false" type="number" class="qtyBtnMenu1 txt_qty_'+r_data[0].id+'" value="0" min="0" title="1" id="qtycart_<?php echo $i; ?>"><div onclick="removeButton('+r_data[0].id+');"class="removeBtnMenu1 commonBtnMenu1" id="removecart_<?php echo $i; ?>">-</div><div style="margin-top:20px; margin-bottom:20px;"><a href="javascript:void(0);" onclick="btnAddToCart('+r_data[0].id+');" class="cartPopBtn viewCartPopupBtn button01  addToCartBtn">Add to Cart </a><div align="center" class="hide_loader loader_div_'+r_data[0].id+'"><img src="images/loading2.gif" class="img-responsive" style="width:20%;position: relative;left: 70px;top: -28px;"></div></div></div><div class="clearbothcls"></div>';
					}
					var emptyStruct='<div class="itemBodyDesign"><h3 class="itemTitle">'+r_data[0].cat_name+'</h3><p class="itemDescp">'+r_data[0].sdesc+'</p><hr>'+finalsubmenustruct1+'</div>'+buttonStruct1+'<br>'+buttonStruct2;

					$(".loadingImgSec").css("display","none");
					$("#mainJsonMenuSec").html(emptyStruct);
							    
							},error:function(err){
							
							}
						});
					    
					    }); */
            }); 



				 jQuery(function($) {
				    $(window).on('scroll', function() {
				        if ($(this).scrollTop() >= 500) {
				            $('.mSideBar').addClass('fixed-top');
				        } else if ($(this).scrollTop() == 0) {
				            $('.mSideBar').removeClass('fixed-top');
				        }
				    });

				});


    
//Increment Decrement Function Add To cart ----------------------------------------------------------
		
		$(function() {
		 $(".button01").on("click", function() {
		   var $button = $(this);
		   var $parent = $button.parent(); 
		   var oldValue = $parent.find('.input').val();
           
           var add_btn_id=$(this).attr("id");
		      var item_id=add_btn_id.split("_");
		      var final_item_id=item_id[1];
		      var item_qty=$("#txt_qty_"+item_id[1]).val();
		      //var final_item_data=final_item_id+'-'+newVal;
		      
		   if ($button.text() == "+")
		   {
		      var newVal = parseFloat(oldValue) + 1;
		      
		      update_Addcart(final_item_id,newVal);
		    } else
		    {
		       // Don't allow decrementing below zero
		      if (oldValue > 1)
		      {
		        var newVal = parseFloat(oldValue) - 1;
		        
		        } 
		        else
		        {
		            
		        newVal = 0;
		      }
		      update_Addcart(add_btn_id,newVal);
		      }
		    //$parent.find('a.add-to-cart').attr('data-quantity', newVal);
		    $parent.find('.input').val(newVal);
		 });
		});

//Increment Decrement Function Add To cart End -------------------------------------------------------------


// Remove Item From Cart   ---------------------------------------------------------------------------------

function btnRemoveToCart(cur_id){
	
	var txt_qty=$(".txt_qty_"+cur_id).val(); 
	if(txt_qty==0)
	{
	   
	}
	else
	{
	//var txt_qty=$(".txt_qty_"+cur_id).val();
	txt_qty=1;
	var txt_hidden_pro_id=$("#txt_hidden_pro_id_"+cur_id).val();
	var txt_hidden_name=$("#txt_hidden_name_"+cur_id).val();
	var txt_hidden_price=$("#txt_hidden_price_"+cur_id).val();
	var fc_totCount=$("#fc_totCount").html();
	var fc_totalamt=$("#fc_totalamt").html();
    var new_fc_totCount=parseInt(fc_totCount)-1;
    var cur_item_total=parseInt(txt_qty)*parseFloat(txt_hidden_price).toFixed(2);
    var new_fc_totalamt=(parseFloat(fc_totalamt)-parseFloat(cur_item_total)).toFixed(2);
    
	$(".loader_div_"+cur_id).css("display","block");
	$(".btnAddToCart").attr("disabled",true);
	$(".minus_btn").attr("disabled",true);
	
	$.ajax({
		type:"POST",		
		url:"remove_from_cart_page.php",
		data:{txt_qty:txt_qty,txt_hidden_pro_id:txt_hidden_pro_id,txt_hidden_name:txt_hidden_name,txt_hidden_price:txt_hidden_price},
		success: function(r_data){	
                 $(".fixedCartSec").css("display","block");	
                
                 $(".fixedCartSec #fc_totCount").html(new_fc_totCount);
                 $(".fixedCartSec #fc_totalamt").html(new_fc_totalamt);
                 $(".loader_div_"+cur_id).css("display","none");
				 $(".btnAddToCart").attr("disabled",false);
				 $(".minus_btn").attr("disabled",false);
				 
				
		},error:function(err){
	
			$('#tryagainModal').modal('show');
			location.reload();
		}
	});
	
	}

	
	
}

// Remove Item From Cart  End ---------------------------------------------------------------------------------

// Add Item To Cart   ---------------------------------------------------------------------------------
	
function btnAddToCart(cur_id){
    
     var fc_totCount=$("#fc_totCount").html();
     var fc_totalamt=$("#fc_totalamt").html();
	 var cur_item_total=0;
   if($('.itemBodyDesign').find('.subMenuSec').length !== 0)
	{
	  var SubmneuArray = [];
	  var ItemSumVal=[];
	   var txt_qty=$(".txt_qty_"+cur_id).val(); 
	  
	 $('.menu_box:checked').each(function () {
        var subMenuId=$(this).attr("id");
       
         var subMenuFinalId=subMenuId.split("_");
        
	     var txt_hidden_pro_id=$("#txt_hidden_pro_id_"+subMenuFinalId[1]).val();
    	 var txt_hidden_name=$("#txt_hidden_name_"+subMenuFinalId[1]).val();
    	 var txt_hidden_price=$("#txt_hidden_price_"+subMenuFinalId[1]).val();
    	 
    	 if(txt_hidden_price=="0" || txt_hidden_price==null || txt_hidden_price==" ")
    	 {
    	    
    	     var txt_hidden_price=$("#price_"+cur_id).val();
    	     
    	 }
    	 else
    	 {
    	     var txt_hidden_price_subitem=$("#txt_hidden_price_"+subMenuFinalId[1]).val();
    	      var txt_hidden_price_mainItem=$("#price_"+cur_id).val();
    	      var txt_hidden_price=parseFloat(txt_hidden_price_subitem)+parseFloat(txt_hidden_price_mainItem);
    	 
    	 }
    	
    	 var SubmenuItems=txt_hidden_pro_id+"-"+txt_hidden_name+"-"+txt_qty+"-"+txt_hidden_price;
    	  var sum=(parseInt(txt_qty)*parseFloat(txt_hidden_price)).toFixed(2);
    	  
    	   ItemSumVal.push(sum);
    	  
    	   SubmneuArray.push(SubmenuItems);
    	   
     });
     var cart_info=SubmneuArray;
     cur_item_total = 0;
$.each(ItemSumVal,
function()
{
    cur_item_total=cur_item_total+parseFloat(this);
    
});
       /*Showing Cart Items & Total*/
    	 var new_fc_totCount=parseInt(fc_totCount)+1;
         var new_fc_totalamt=(parseFloat(fc_totalamt)+parseFloat(cur_item_total)).toFixed(2);
        
         
	}
	else
	{
	    var txt_qty=$(".txt_qty_"+cur_id).val(); 
	    var txt_hidden_pro_id=$("#txt_hidden_pro_id_"+cur_id).val();
    	var txt_hidden_name=$("#txt_hidden_name_"+cur_id).val();
    	var txt_hidden_price=$("#txt_hidden_price_"+cur_id).val();
    	var cart_info=txt_hidden_pro_id+"-"+txt_hidden_name+"-"+txt_qty+"-"+txt_hidden_price;
    	
    	 /*Showing Cart Items & Total*/
    	 var new_fc_totCount=parseInt(fc_totCount)+1;
    	 var cur_item_total=cur_item_total+parseInt(txt_qty)*parseFloat(txt_hidden_price).toFixed(2);
    	
         var new_fc_totalamt=(parseFloat(fc_totalamt)+parseFloat(cur_item_total)).toFixed(2);
	}
	
	if(cur_item_total=="" || cur_item_total==0 || cur_item_total==null || cur_item_total==NaN)
	{
	    	$('#alertmsgModal .iconCls h1').html('Please Select Item & Quantity');
					
					$('#alertmsgModal').modal('show');

	}
	else
	{
	    $(".loader_div_"+cur_id).css("display","block");
        $('.addToCartBtn').addClass('disabled');
	    
						$.ajax({
		type:"POST",		
		url:"add_to_cart_page_do.php",
		data:{menu_items:cart_info},
		success: function(r_data){	
                 $(".fixedCartSec").css("display","block");	
                  $("#itemModal").modal("hide");
                 $(".fixedCartSec #fc_totCount").html(new_fc_totCount);
                 $(".fixedCartSec #fc_totalamt").html(new_fc_totalamt);
                 $(".loader_div_"+cur_id).css("display","none");
				  $('.addToCartBtn').removeClass('disabled');
				 
				
		},error:function(err){
	
			$('#tryagainModal').modal('show');
			location.reload();
		}
	});
	}
	
}

// Add Item To Cart End   ---------------------------------------------------------------------------------

    
     var emptySubMenuStruct="";

 var finalsubmenustruct="";
function fetchSubMenuFunction(submenuID){
  
    var cur_id=submenuID;
    
      	$.ajax({
    		type:"post",
    		dataType:"json",
    		cache:false,
    		async: false,
    		url:"fetch_sub_item.php",
    		data:{
    		    subcur_id:cur_id
    		},
    		success: function(r_data){
    		    var emptySubMenuStruct="";
    		    //alert(JSON.stringify(r_data));
    		    for(i=0; i<r_data.length; i++){
    		        
    		        if(r_data[i].qty==0){
    		            var qtySec='';
    		            
    		        }
    		        else{
    		           var qtySec= r_data[i].qty+' Quantity In Cart';
    		        }
    		        if(r_data[i].price==0){
    		            var priceSec='';
    		            
    		        }
    		        else{
    		           var priceSec='£'+ r_data[i].price;
    		        }
    		        if(r_data[i].menu_choice=='s')
    		        {
    		            var choiceStruct='<div style="float:left"><input  type="radio" id="rd_'+r_data[i].id+'" name="rd_menu" value="'+r_data[i].id+'" class="menu_box"></div>';
    		            
    		        }
    		        else
    		        {
    		            var choiceStruct='<div style="float:left"><input type="checkbox" id="cd_'+r_data[i].id+'" value="'+r_data[i].id+'" class="menu_box"></div>';
    		        
    		        }
    		        var subMenuStruct=choiceStruct+'<div class="subMenuSec" id="mname_'+r_data[i].id+'"><div class="leftSubMenu">'+r_data[i].cat_name+'&nbsp;&nbsp;<span style="font-weight:bold;color:#333;position:relative;">'+priceSec+'</span><br><span class="qtyClsSec">'+qtySec+'</span></div><div class="rightSubMenu"></div><input type="hidden" value='+r_data[i].id+' id="txt_hidden_pro_id_'+r_data[i].id+'"><input type="hidden" value="'+r_data[i].cat_name+'" title='+r_data[0].cat_name+' id="txt_hidden_name_'+r_data[i].id+'"><input type="hidden" value='+r_data[i].price+' id="txt_hidden_price_'+r_data[i].id+'"><div class="clearbothcls"></div></div>';
    		        emptySubMenuStruct=emptySubMenuStruct+subMenuStruct;
    		    }
    		   finalsubmenustruct=emptySubMenuStruct;
    		   
    		},error:function(err){
    		    alert("Try Again !..");
    		}
      	});
      return finalsubmenustruct;	
} 

   
    function update_Addcart(item_id,item_qty) 
    {
    	
    	$.ajax({
    type: "PUT",
    
    url: '/cart/update_cart',
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    contentType: 'application/json',
    data: JSON.stringify({item_id:item_id,quantity:item_qty})
}).done(function( msg )
        {
            //alert( "Data Saved: " + msg );
        });
    	
    }
    
   
    function removeEvent(remove_id){
		    //var remove_id=$(this).attr("id");
			
			$("#cart_"+remove_id).css("display","none");
			$.ajax({
		    type: "PUT",
		    
		    url: '/cart/remove_cart_data',
		    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
		    contentType: 'application/json',
		    data: JSON.stringify({item_id:remove_id})
		    }).done(function( msg )
		        {
		            //alert( "Data Saved: " + msg );
		        });
				   
    }

    // cart page remove button
    $( document ).ready(function() {
   

		    
    });

    //cart page remove button end
