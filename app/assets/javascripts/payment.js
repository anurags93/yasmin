$( document ).ready(function() {


	   $(".payOnl").click(function(){
	   
	   	  if($('input[name="order_address"]:checked').val() != null)
	   	  {
	   	  	

			 $(".address_form_style").submit();
            
	   	  }
	   	  	else
	   	  	{
	   	  		$('#alertmsgModal .iconCls h1').html('Please Select Delivery Address');
				$('#alertmsgModal').modal('show');

	   	  	}

	    });


      //    $('.order_pay_total_online').click(function() {
      //   setTimeout(function(){
      //   	$(".stripe-button-el").hide();
		    // $(".stripe-button-el").click();
      //              },
      //        500);
      //     });


      $("input[name='payment_radio']").click(function(){
    
      var cur_id = $(this).attr("id");
      
      if (cur_id == "payment_radio_cod")
      {
      $(".order_pay_total_cod").css("display","inline-block");
      $(".order_pay_total_online").css("display","none");
      }
      else if(cur_id == "payment_radio_online")
      {
      	$(".order_pay_total_cod").css("display","none");
      	$(".order_pay_total_online").css("display","inline-block");
      }
      
      });
		

});

