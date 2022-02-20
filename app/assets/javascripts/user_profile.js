

  $( document ).ready(function() {
   
                $(".addNewAddCls").on("click",function(e){
				
								$("#myModal").modal("show");
								
								});


								$(".editBtnCls").on("click",function(e){
										$("#myModal").modal("show");
								});

			   $(".delete_address_btn").on("click",function(e)
			       {
			       
			       var cur_id=$(this).attr("id"); 
			       var cnf=confirm("Delete This Address");
			       if(cnf==true)
			       {
			           $.ajax({
			               url:"deleteaddress.php",
			               type:"POST",
			               data:{cur_id:cur_id},
			               success:function(r_data)
			               {
			                  location.reload();
			               }
			               ,error:function(e)
			               {
			                   
			               }
			            });
			           
			       }
		       
		       });




			$(".order_disp_btn").on("click",function(e){
					    var order_ori_id=$(this).attr("id");
					    $.ajax({
						type:"POST",
						url:"view_order_popup.php",
						data:{order_ori_id:order_ori_id},
						success:function(r_data)
						{
							if(r_data==0)
							{
								//alert("pls Login");
									$('#alertmsgModal .iconCls h1').html('Please Login');
									
									$('#alertmsgModal').modal('show');
							}
							else
							{
								
								$(".modal-body_1").html(r_data);
							}
						},
						error:function(err)
						{
						}
					    });
             });

            
            $(".address_btn").on("click",function(e)
			        {
			        
			        var address_zip=$("#address_zip").val();
			        var address_address=$("#address_address").val();
			        var address_options=$('input[name="address_options"]:checked').val();
			        if(address_zip=="" || address_zip==null)
			        {
			           $("#address_zip").focus(); 
			        }
			        else if(address_address=="" || address_address==null)
			        {
			            $("#address_address").focus();
			        }
			        
			        else
			        {
			           
			            $.ajax({
			            	  url: '/pincodes/check_pincode',
			            	  type:"POST",
									    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
									    contentType: 'application/json',
									    data: JSON.stringify({address_zip:address_zip}),
									    success:function(r_data)
			                {
			                  if(r_data.status=="success")
			                  {
			                     $.ajax({
						               url:"/user_addresses/",
						               type:"POST",
						               beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
									         contentType: 'application/json',
						               data:JSON.stringify({pincode:address_zip,address:address_address,address_options:address_options}),
						               success:function(r_data)
						               {
						                   $("#add-address-modal").modal('hide');
						                   $(".address_msg").html(r_data);
						                   location.reload();
						               }
						               ,error:function(e)
						               {
						                   
						               }
						               });  
			                  }
			                  else
			                  {
			                     
			                      	$('#alertmsgModal .iconCls h1').html('Sorry! We Are Not Delivering Here');
								
															$('#alertmsgModal').modal('show');
										    }
			               }
			               ,error:function(e)
			               {
			                   
			               }
			            });
			           
			            
			       
			        }
			       
                });




            $(".update_btn").on("click",function(e)
				        {
				        
				        var cus_name=$("#cus_name").val();
				        var cus_mobile=$("#cus_mobile").val();
				        var cus_zip=$("#cus_zip").val();
				        var cus_address=$("#cus_address").val();
				        if(cus_name=="" || cus_name==null)
				        {
				           $("#cus_name").focus(); 
				        }
				       
				        else if(cus_zip=="" || cus_zip==null)
				        {
				            $("#cus_zip").focus();
				        }
				        else if(cus_address=="" || cus_address==null)
				        {
				            $("#cus_address").focus();
				        }
				        else
				        {
				           
				            	var filter =/^(\+?\d{1,4}[\s-])?(?!0+\s+,?$)\d{10}\s*,?$/;
								if ((filter.test(cus_mobile)) || (!isNaN(cus_mobile) && cus_mobile.length >9))
								{
								   
				            $.ajax({
				               url:"update_cusinfo.php",
				               type:"POST",
				               data:{cus_name:cus_name,cus_mobile:cus_mobile,cus_zip:cus_zip,cus_address:cus_address},
				               success:function(r_data)
				               {
				                  $(".msg").html("Successfully Saved"); 
				               }
				               ,error:function(e)
				               {
				                   
				               }
				            });
								    
								}
								else{
									$("#cus_mobile").focus();
									$("#cus_mobile").addClass("error_class");
								}
				        }
				       
             });






		$(".btnProfileSubmit").on("click",function(e){
						if($("#txt_name_p").val()=="" || $("#txt_name_p").val()==null){
							$("#txt_name_p").focus();
							$("#txt_name_p").addClass("p_err_cls");
						}
						else if($("#txt_email_p").val()=="" || $("#txt_email_p").val()==null){
							$("#txt_email_p").focus();
							$("#txt_email_p").addClass("p_err_cls");
						}
						else if($("#txt_phone_p").val()=="" || $("#txt_phone_p").val()==null){
							$("#txt_phone_p").focus();
							$("#txt_phone_p").addClass("p_err_cls");
						}
						else{
						var txt_email=$("#txt_email_p").val();
						var txt_mono=$("#txt_phone_p").val();
						if( isEmail(txt_email)){	
						var filter =/^(\(?(0|\+44)[1-9]{1}\d{1,4}?\)?\s?\d{3,4}\s?\d{3,4})$/;
						if ((filter.test(txt_mono)) || (!isNaN(txt_mono) && txt_mono.length > 9)) {
								var txt_pincode_p=$("#txt_pincode_p").val();
								
							var txt_name_p=$("#txt_name_p").val();
							
			                var fd = new FormData();				
							fd.append("txt_name_p", txt_name_p);
							fd.append("txt_email", txt_email);
							fd.append("txt_mono", txt_mono);
							
							//var txt_cust_add_p=$("#txt_cust_add_p").val();
						
							
							//fd.append("txt_cust_add_p", txt_cust_add_p);
							fd.append("txt_pincode_p", txt_pincode_p);
										
							$(".btnProfileSubmit").attr("disabled",true);
							//alert(fd);
			                $.ajax({
			                    url: 'customer_profile_update_do.php',
			                    data: fd,
			                    contentType: false,
			                    processData: false,
			                    type: 'POST',
			                    async: true,
			                    success: function(data){
									if(data=="la"){
										//alert("Login Again !..");
											$('#alertmsgModal .iconCls h1').html('Login Again !..');
								
								$('#alertmsgModal').modal('show');
										window.location.replace("customer_log_out.php");
									}
									else if(data=="err"){
										$('#tryagainModal').modal('show');
										location.reload();
									}
									else if(data=="iimg"){
										//alert("Invalid Image Format. Please select jpg,png,jpeg,gif format !..");
											$('#alertmsgModal .iconCls h1').html('Invalid Image Format. Please select jpg,png,jpeg,gif format !..');
								
								$('#alertmsgModal').modal('show');
										$("#txt_profile_pic_p").focus();
										$("#txt_profile_pic_p").addClass("p_err_cls");
									}
									else{
										//alert("Successfully Updated !..");
											$('#alertmsgModal .iconCls h1').html('Successfully Updated !..');
								
								$('#alertmsgModal').modal('show');
									}
			                        
									$(".btnProfileSubmit").attr("disabled",false);
									
			                    },error:function(err){
									//alert("Try Again !..");
									$('#tryagainModal').modal('show');
									location.reload();
								}
			                });
							    
						}
						else{
							$("#txt_phone_p").focus();
							$("#txt_phone_p").addClass("p_err_cls");
						}			
					}
					else{
						$("#txt_email_p").focus();
						$("#txt_email_p").addClass("p_err_cls");
					}	
				}
        });




    });


  function isEmail(email) {
  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
  return regex.test(email);
} 

