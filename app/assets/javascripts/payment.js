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
});