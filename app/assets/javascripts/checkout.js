$( document ).ready(function() {
   

 // Coupon Apply Button --------------------------------------------------------------------------------------

 $(".cpn_apply_btn").on("click",function(e){
        
    var cpn_name=$("#cpn_code").val();
    var total=$("#bag_total").val();
    $("#cpn_loader").css("visibility","visible");
    $.ajax({
        type:"POST",
        dataType:"json",
        url:"check_coupon.php",
        cache:false,
        data:{cpn_name:cpn_name},
        success:function(r_data)
        {
            
            if(r_data.length==0)
            {
                //alert("Invalid Promo Code");
                    $('#alertmsgModal .iconCls h1').html('Invalid Promo Code');
                    
                    $('#alertmsgModal').modal('show');
            }
            else
            {
                $("#cpn_loader").css("visibility","hidden");    
                //alert(r_data);
                if(r_data[0].cpn_type==1)
                {
                    if(r_data[0].dis_format=="%")
                    {
                      var discount=total*r_data[0].cpn_discount/100;
                        $("#coupon_discount").val(discount);
                      var order_total=(parseFloat(total)-parseFloat(discount)).toFixed(2);
                      //alert(order_total);
                    }
                    else
                    {
                        var discount=r_data[0].cpn_discount;
                        $("#coupon_discount").val(discount);
                        var order_total=(parseFloat(total)-parseFloat(discount)).toFixed(2);
                        //alert(order_total);
                    }
                    $(".coupon_discount").html(discount);
                    
                    $(".order_total").html(order_total);
                }
                else
                {
                    if(r_data[0].dis_format=="%")
                    {
                      var discount=total*r_data[0].cpn_discount/100;    
                       var order_total=(parseFloat(total)-parseFloat(discount)).toFixed(2);
                       //alert(order_total);
                    }
                    else
                    {
                        var discount=r_data[0].cpn_discount;
                        var order_total=(parseFloat(total)-parseFloat(discount)).toFixed(2);
                        //alert(order_total);
                    }
                    $(".coupon_discount").html(discount);
                    
                    $("#final_bag_total").val(order_total);
                    $("#coupon_Id").val((r_data[0].id));
                    $(".order_total").html(order_total);
                    $(".order_pay_total").html(order_total);
                }
                
            }
            
            
        }
        ,
        error:function(err)
        {
            
        }
    });
    });

  // Coupon Apply Button End --------------------------------------------------------------------------------------


 // Cash on Delivery Payment Button -------------------------------------------------------------------------------

        $(".order_submit_btn_cod").on("click",function(e){
         $(".order_submit_btn_cod").attr("disabled", true);
        var total=$("#bag_total").val();
        var finaltotal=$("#final_bag_total").val();
        var buyer_id=$("#cus_id").val();
        var pro_list=$("#pro_list").val();
        //alert(pro_list);
        var payment_type="COD";
        var cpn_name=$("#cpn_code").val();
        var coupon_Id=$("#coupon_Id").val();
        var coupon_discount=$("#coupon_discount").val();
        //var total_items=$("#total_items").val();
        //var empty_box="";
        /*for(i=0; i<$(".cart-list-product .cart_items").length; i++){
            var c_id=$(".cart-list-product .cart_items:eq("+i+")").attr("id");
            var new_c_id=c_id.split("_");
            
            var cqty_val=$("#item_qty_"+new_c_id[1]).val();
            var citem_total=$("#item_total_"+new_c_id[1]).val();
            var final_val=new_c_id[1]+"-"+cqty_val+"-"+citem_total;
            empty_box=empty_box+final_val+"|";
        }
        empty_box=empty_box.slice(0,-1);
        */
              if(buyer_id==0)
              {
                //alert("Login First");
                $('#alertmsgModal iconCls h1').html('Login First');
                $('#alertmsgModal').modal('show');
               window.location.replace("login_register.php");
              }
              else
              {
                  if($('.shipaddr').is(':checked')) {  
                var shipaddr=$("input[name='shipaddr']:checked").val();
                $.ajax({
            type:"post",
            url:"checkout_do.php",
            data:{pro_list:pro_list,buyer_id:buyer_id,order_total:total,payment_type:payment_type,shipaddr:shipaddr,ftotal:finaltotal,cpn_code:cpn_name,coupon_discount:coupon_discount,coupon_Id:coupon_Id},
            success:function(r_data)
            {
                var responsedata=r_data.split("-");
                if(responsedata[0]==1)
                {
                    //alert("Successfully Submitted");
                    $('#successModal').modal('show');
                    $(".order_submit_btn_cod").attr("enabled", true);
                    window.location.replace("thanks_page.php?payment_id="+responsedata[2]+"&&order_id="+responsedata[1]);
                    //window.location.replace("https://yasminrestaurants.com/My-Profile");
                }
                else
                {
                //  alert("Try Again");
                    $('#tryagainModal').modal('show');
                }
                
            },
            error:function(err)
            {
                
            }
        });
              }
              else
              {
                 // alert("Select Delivery Address");
                    $('#alertmsgModal .iconCls h1').html('Select Delivery Address');
                        $('#alertmsgModal').modal('show');
              }
              }
    
    });

 // Cash on Delivery Payment Button End------------------------------------------------------------------------------
 

 // Online Payment Button -------------------------------------------------------------------------------------------
 
    $(".order_submit_btn").on("click",function(e){
        
         $(".order_submit_btn").attr("disabled", true);
        var total=$("#bag_total").val();
        var buyer_id=$("#cus_id").val();
        var pro_list=$("#pro_list").val();
        var payment_type="ONILNE";
        //var total_items=$("#total_items").val();
        var empty_box="";
        for(i=0; i<$(".cart-list-product .cart_items").length; i++){
            var c_id=$(".cart-list-product .cart_items:eq("+i+")").attr("id");
            var new_c_id=c_id.split("_");
            
            var cqty_val=$("#item_qty_"+new_c_id[1]).val();
            var citem_total=$("#item_total_"+new_c_id[1]).val();
            var final_val=new_c_id[1]+"-"+cqty_val+"-"+citem_total;
            empty_box=empty_box+final_val+"|";
        }
        empty_box=empty_box.slice(0,-1);
              if(buyer_id==0)
              {
               //alert("Login First");
                $('#alertmsgModal .iconCls h1').html('Login First');
                        $('#alertmsgModal').modal('show');
               window.location.replace("login_register.php");
              }
              else
              {
                 
              if($('.shipaddr').is(':checked')) {
                  
                var shipaddr=$("input[name='shipaddr']:checked").val();
                $("#shipaddrform").val(shipaddr);
                $("#order_form").submit();
              }
              else
              {
                  //alert("Select Shipping Address");
                    $('#alertmsgModal .iconCls h1').html('Select Delivery Address');
                        $('#alertmsgModal').modal('show');
              }
                   

              } 
    
    });

    // Online Payment Button End -------------------------------------------------------------------------------------

});


