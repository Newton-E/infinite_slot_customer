$(document).ready(function() {
  // sweetAlert
  var toastMixin = Swal.mixin({
    toast: true,
    icon: 'success',
    title: 'General Title',
    animation: false,
    position: 'top-right',
    showConfirmButton: false,
    timer: 3000,
    timerProgressBar: true,
    didOpen: (toast) => {
    toast.addEventListener('mouseenter', Swal.stopTimer)
    toast.addEventListener('mouseleave', Swal.resumeTimer)
    }
});
    // veiw shop product script
    view_shop_product();
    function view_shop_product(){
        $.ajax({
            url: './includes/fetch_shop_products.php',
            method: 'GET',
            dataType: 'json',
            success: function(data){
                $("#view_products").html(data);
            }
        });
    }
    // end view shop product script
    $("#cart_details").on("click", ".btn-del-compare", function(e) {
      e.preventDefault();
      var delete_id = $(this).attr('id');
      
      $.ajax({
          url: "./includes/delete_compare.php",
          method: "POST",
          data: { delete_id: delete_id }, // Pass the delete_id to the server
          dataType: "json",
          success: function(data) {
              if (data.error !== "") {
                  // Handle error
                  toastMixin.fire({
                    title: "Error Message",
                    icon: "warning",
                    text: data.error
                  });
              } else {
                  //Success Message
                  toastMixin.fire({
                    title: "Cart Deleted",
                    icon: "success",
                    text: data.msg
                  });
                  loadCart();
                  filter_cart_data();
              }
          },
          error: function() {
            toastMixin.fire({
              title: "Error Message",
              icon: "error",
              text: "An error occurred while deleting cart. Please try again."
            });
          }
      });
    });
    //Remove cart button event handlers
$("#cart_details").on("click", ".btn_remove", function(e) {
  e.preventDefault();
  var delete_id = $(this).attr('id');
  
  $.ajax({
      url: "./includes/delete_cart.php",
      method: "POST",
      data: { delete_id: delete_id }, // Pass the delete_id to the server
      dataType: "json",
      success: function(data) {
          if (data.error !== "") {
              // Handle error
              toastMixin.fire({
                title: "Error Message",
                icon: "warning",
                text: data.error
              });
          } else {
              //Success Message
              toastMixin.fire({
                title: "Cart Deleted",
                icon: "success",
                text: data.msg
              });
              loadCart();
              filter_cart_data();
          }
      },
      error: function() {
        toastMixin.fire({
          title: "Error Message",
          icon: "error",
          text: "An error occurred while deleting cart. Please try again."
        });
      }
  });
});
//Remove cart button event handlers
    $("#cart_list_filter").on("click", ".btn_remove_cart", function(e) {
      e.preventDefault();
      var delete_id = $(this).attr('id');
      $.ajax({
          url: "./includes/delete_cart.php",
          method: "POST",
          data: { delete_id: delete_id }, // Pass the delete_id to the server
          dataType: "json",
          success: function(data) {
              if (data.error !== "") {
                  // Handle error
                  toastMixin.fire({
                    title: "Error Message",
                    icon: "warning",
                    text: data.error
                  });
              } else {
                  //Success Message
                  toastMixin.fire({
                    title: "Cart Deleted",
                    icon: "success",
                    text: data.msg
                  });
                  loadCart();
                  filter_cart_data();
              }
          },
          error: function() {
            toastMixin.fire({
              title: "Error Message",
              icon: "error",
              text: "An error occurred while deleting cart. Please try again."
            });
          }
      });
    });
  // veiw product script
  view_products();
  function view_products(){
      $.ajax({
          url: './includes/fetchproducts.php',
          method: 'GET',
          dataType: 'json',
          success: function(data){
              $("#view_products").html(data);
          }
      });
  }
  // end view product script
  
  // attach click event to dynamically generated elements with class ".btn_view_cart"
  $("#view_products").on("click", ".btn_view", function(e) {
      e.preventDefault();
      var product_id = $(this).attr("id");
      
      $.ajax({
      url: './includes/load_product_details.php',
      method: 'POST',
      dataType: 'json',
      data: {product_id: product_id},
      success: function(data) {
        $("#quick-view-electro").modal("show");
        $("#productName").html(data.product_name);
        $("#productid").val(data.productid);
        $(".quick-view-price").html(data.product_price);
        $(".quick-view-brand").html(data.brand_name);
        $(".quick-view-categiory").html(data.categoryname);
        $(".btn_add_cart").attr("id", data.productid);
        $(".btn_add_wishlist_preview").attr("id", data.productid);
        $(".view_more_product").attr("href", "shop-single.php?product=" + data.productid);
        $(".btn_compare_preview").attr("id", data.productid);
        $(".preview-product-qty").attr("id", data.productid);
        load_product_img();
        load_child_img();
      }
    });
      
  });
  // Call the loadCart function initially to load the cart on page load
  loadCart();
  function loadCart() {
    $.ajax({
      url: "./includes/load_cart.php",
      method: "GET",
      dataType: "json",
      success: function(data) {
        $('#cart_details').html(data.cart_details);
        $('.cart_price').text(data.total_price);
        $('.cart_prices').text(data.total_price);
        $('.cart_count').text(data.total_item);
        $('.cart_counts').text(data.total_item);
      },
      error: function() {
        toastMixin.fire({
          title: "An error occurred while loading the cart. Please try again.",
            icon: "warning",
        });
      }
    });
  }

  // click event to add to cart without qty value
  $(document).on("click", ".btn-add-to-cart", function(e) {
    e.preventDefault();
  
    var product_id = $(this).attr("id");
    var quantity = 1;
    // Send Ajax request to add the product to the cart
    $.ajax({
      url: "./includes/add_to_cart.php",
      method: "POST",
      dataType: "json",
      data: {
        product_id: product_id,
        quantity: quantity
      },
      success: function(data) {
        // Check if the request was successful
        if (data.error != "") {
          // Product added to cart successfully
          toastMixin.fire({
            title: "Error Message",
            icon: "warning",
            text: data.error
          });
          // Load the updated cart
          loadCart();
        } else {
          // Error adding product to cart
          toastMixin.fire({
            title: "Cart Added",
            text: data.msg,
            icon: "success"
          });
          loadCart();
        }
      },
      error: function() {
        // Error in Ajax request
        toastMixin.fire({
          title: "An error occurred while adding the product to the cart. Please try again.",
            icon: "warning",
        });
      }
    });
  });
  // Attach click event to "Add to Cart" button
$(document).on("click", ".btn_add_cart_qty", function(e) {
  e.preventDefault();

  var product_id = $(this).attr("id");
  var quantity = 1;
  // Send Ajax request to add the product to the cart
  $.ajax({
    url: "./includes/add_to_cart.php",
    method: "POST",
    dataType: "json",
    data: {
      product_id: product_id,
      quantity: quantity
    },
    success: function(data) {
      // Check if the request was successful
      if (data.error != "") {
        // Product added to cart successfully
        toastMixin.fire({
          title: "Error Message",
          icon: "warning",
          text: data.error
        });
        // Load the updated cart
        loadCart();
      } else {
        // Error adding product to cart
        toastMixin.fire({
          title: "Cart Added",
          text: data.msg,
          icon: "success"
        });
      }
    },
    error: function() {
      // Error in Ajax request
      toastMixin.fire({
        title: "An error occurred while adding the product to the cart. Please try again.",
          icon: "warning",
      });
    }
  });
});
// Attach click event to "Add to Cart" button
$(document).on("click", ".btn_add_cart", function(e) {
  e.preventDefault();

  var product_id = $(this).attr("id");
  var quantity = $(".preview-product-qty").val();
  // Send Ajax request to add the product to the cart
  $.ajax({
    url: "./includes/add_to_cart.php",
    method: "POST",
    dataType: "json",
    data: {
      product_id: product_id,
      quantity: quantity
    },
    success: function(data) {
      // Check if the request was successful
      if (data.error != "") {
        // Product added to cart successfully
        toastMixin.fire({
          title: "Error Message",
          icon: "warning",
          text: data.error
        });
        // Load the updated cart
        loadCart();
      } else {
        // Error adding product to cart
        toastMixin.fire({
          title: "Cart Added",
          text: data.msg,
          icon: "success"
        });
        loadCart();
      }
    },
    error: function() {
      // Error in Ajax request
      toastMixin.fire({
        title: "An error occurred while adding the product to the cart. Please try again.",
          icon: "warning",
      });
    }
  });
});
//compare product events listeners
$("#view_products").on("click", ".btn_compare", function(e) {
  e.preventDefault();
  let compareid = $(this).attr("id");
  $.ajax({
    url: "./includes/compare_product.php",
    method: "POST",
    dataType: "json",
    data: {compareid:compareid},
    success: function(data) {
      if (data.error != "") {
        toastMixin.fire({
          icon: 'error',
          title: 'Error Message', 
          text: data.error
        });
      } else {
        toastMixin.fire({
          icon: 'success',
          title: 'Success Message',
          text: data.msg
        });
      }
    },
    error: function() {
      // Error in Ajax request
      toastMixin.fire({
        title: "An error occurred while comparing product. Please try again.",
          icon: "warning",
      });
    }
  });
});
//compare product events listeners for preview
$(document).on("click", ".btn_compare_preview", function(e) {
  e.preventDefault();
  let compareid = $(this).attr("id");
  $.ajax({
    url: "./includes/compare_product.php",
    method: "POST",
    dataType: "json",
    data: {compareid:compareid},
    success: function(data) {
      if (data.error != "") {
        toastMixin.fire({
          icon: 'error',
          title: 'Error Message', 
          text: data.error
        });
      } else {
        toastMixin.fire({
          icon: 'success',
          title: 'Success Message',
          text: data.msg
        });
      }
    },
    error: function() {
      // Error in Ajax request
      toastMixin.fire({
        title: "An error occurred while comparing product. Please try again.",
          icon: "warning",
      });
    }
  });
});

//Add product to wish list
$("#view_products").on("click", ".btn_add_wishlist", function(e){
  e.preventDefault();
  let wishlistid = $(this).attr("id");
  $.ajax({
    url: "./includes/add_wishlist.php",
    method: "POST",
    dataType: "json",
    data: {wishlistid:wishlistid},
    success: function(data) {
      if (data.error != "") {
        toastMixin.fire({
          icon: 'error',
          title: 'Error Message', 
          text: data.error
        });
      } else {
        toastMixin.fire({
          icon: 'success',
          title: 'Success Message',
          text: data.msg
        });
      }
    },
    error: function() {
      // Error in Ajax request
      toastMixin.fire({
        title: "An error occurred while adding the product to the wish list. Please try again.",
          icon: "warning",
      });
    }
  });
});
//Add product to wish list for preview
$(document).on("click", ".btn_add_wishlist_preview", function(e){
  e.preventDefault();
  let wishlistid = $(this).attr("id");
  $.ajax({
    url: "./includes/add_wishlist.php",
    method: "POST",
    dataType: "json",
    data: {wishlistid:wishlistid},
    success: function(data) {
      if (data.error != "") {
        toastMixin.fire({
          icon: 'error',
          title: 'Error Message', 
          text: data.error
        });
      } else {
        toastMixin.fire({
          icon: 'success',
          title: 'Success Message',
          text: data.msg
        });
      }
    },
    error: function() {
      // Error in Ajax request
      toastMixin.fire({
        title: "An error occurred while adding the product to the wish list. Please try again.",
          icon: "warning",
      });
    }
  });
});

//listen to change on quantity of preview 
$(document).on("change", ".preview-product-qty", function(e) {
  e.preventDefault();
  let product_id = $(this).attr("id");
  let quantity = $(this).val();
  $.ajax({
    url: "./includes/load_product_details.php",
    method: "POST",
    dataType: "json",
    data: {product_id:product_id},
    success: function(data) {
      if (data.product_stork < quantity) { 
        $(".product-badge").addClass("bg-danger");
        $(".product-badge").html("<i class='ci-security-check'></i> Not Enough in Stock");
      }else{
        $(".product-badge").removeClass("bg-danger");
        $(".product-badge-text").html("<i class='ci-security-check'></i> Product Available");
      }
    },
    error: function() {
      // Error in Ajax request
      toastMixin.fire({
        title: "An error occurred while comparing product. Please try again.",
          icon: "warning",
      });
    }
  });
});
  function load_product_img() {
    let img_id = $("#productid").val();
    $.ajax({
        url: './includes/preview_product_img.php',
        method: 'POST',
        dataType: 'json',
        data: {img_id: img_id},
        success:function(data) {
            $("#product_item_img").html(data);
            initImageZoom(); // Call the function to initialize image zoom
        }
    });
}

// Initialize image zoom
   //function initImageZoom() {
       //$(".image-zoom").each(function() {
       //    new ImageZoom(this);
     //  });
   //}

  // Children Image preview
  function load_child_img() {
    let img_id = $("#productid").val();
    $.ajax({
      url: './includes/load_child_img.php',
      method: 'POST',
      dataType: 'json',
      data: {img_id:img_id},
      success: function(data) {
        $("#prod_img_children").html(data);
        initImageZoom();
      }
    });
  }
  $(document).on("click", ".change-preview-image", function(){
    $(".change-preview-image").removeClass("active")
    $(this).addClass("active")
    $("#main-quickview-image").attr("src", $(this).attr("data-img"));
    initImageZoom();
  })
  $('#login_form').submit(function(event) {
    event.preventDefault(); // Prevent form submission
    var user_email = $('#user_email').val();
    var password = $('#password').val();

    // AJAX request to login.php
    $.ajax({
        url: './includes/login.php',
        type: 'POST',
        data: {
            user_email: user_email,
            password: password
        },
        dataType: 'json',
        success: function(response) {
            if (response.success) {
              toastMixin.fire({
                icon: 'success',
                title: 'Success Message',
                text: 'Login Successful'
              });
                // Redirect to home page
                window.location.href = 'index.php';
                $("#signin-modal").modal('hide');
            } else {
              toastMixin.fire({
                icon: 'error',
                title: 'Error Message',
                text: response.error
              });
            }
        },
        error: function() {
          toastMixin.fire({
            icon: 'error',
            text: 'An error occurred during login'
          });
        }
    });
});

  $('#login-form').submit(function(event) {
    event.preventDefault(); // Prevent form submission
    var user_email = $('#user_email').val();
    var password = $('#password').val();

    // AJAX request to login.php
    $.ajax({
        url: './includes/login.php',
        type: 'POST',
        data: {
            user_email: user_email,
            password: password
        },
        dataType: 'json',
        success: function(response) {
            if (response.success) {
              toastMixin.fire({
                icon: 'success',
                title: 'Success Message',
                text: 'Login Successful'
              });
                // Redirect to home page
                loadsession();
                loadCart();
                filter_cart_data();
                $("#signin-modal").modal('hide');
            } else {
              toastMixin.fire({
                icon: 'error',
                title: 'Error',
                text: 'Login failed. ' + response.error
              });
            }
        },
        error: function() {
          toastMixin.fire({
            icon: 'error',
            text: 'An error occurred during login'
          });
        }
    });
});
// Registration for registration
$("#form_register").submit(function(e) {
  e.preventDefault();
  let fname = $("#reg_fn").val();
  let user_email = $("#reg_email").val();
  let user_phone = $("#reg_phone").val();
  let user_password = $("#reg_password").val();
  let password_comfirm = $("#reg_password_confirm").val();
  let delay = 2000;
  if (user_password != password_comfirm) {
    toastMixin.fire({
      icon: 'error',
      text: 'The two passwords do not match, please try again'
    });
  } else {
  $.ajax({
    url: "./includes/registration_accounts.php",
    method: "POST",
    dataType: "json",
    data: {
      fname: fname,
      user_email: user_email,
      user_phone: user_phone,
      user_password: user_password,
      password_comfirm: password_comfirm
    },
    beforeSend:function(){
      $("#btn_reg").attr("disabled", true);
      $("#btn_reg").html('<span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span> Loading...');
    },
    success: function(data) {
      if (data.error != "") {
        toastMixin.fire({
          icon: "error",
          text: data.error
        });
        $("#btn_reg").attr("disabled", false);
        $("#btn_reg").html('<i class="ci-user me-2 ms-n1"></i>Try again');
      } else {
        toastMixin.fire({
          icon: "success",
          text: data.msg
        });
        setTimeout(function(){
          window.location.href="account-profile.php";
        }, delay);
      }
    } 
  });
}

}); //for registration purposes

function loadsession() {
  $.ajax({
    url: './includes/load_session.php',
    type: 'GET',
    dataType: 'json',
    success: function(response) {
      // Process the response data
      $("#user_infor").html(response.username);
      // Add more lines here to populate other elements with the retrieved data
    },
    error: function(xhr, status, error) {
      // Handle the Ajax request error
      toastMixin.fire({
        icon: 'error',
        title: 'Ajax Error',
        text: 'An error occurred while making the Ajax request: ' + error
      });
    }
  });
}
// Call the function to load data
loadsession();
// view profile
$("#user_login_accout").on("click", function(e) {
  e.preventDefault();
  $.ajax({
    url: './includes/load_session.php',
    type: 'GET',
    dataType: 'json',
    success: function(response) {
      if (response.userid !== undefined) {
        // Session is set, redirect to account profile page
        window.location.href = 'account-profile.php';
      } else {
        // Session is not set, show sign-in modal
        $("#signin-modal").modal('show');
      }
    },
    error: function(xhr, status, error) {
      // Handle the Ajax request error
      toastMixin.fire({
        icon: 'error',
        title: 'Ajax Error',
        text: 'An error occurred while making the Ajax request: ' + error
      });
    }
  });
});
//Recover password
$("#form_recovery").submit(function(e) {
  e.preventDefault();
  let useremail = $("#recover_email").val();
  if (useremail == "") {
    $(this).addClass("was-validated");
  } else {
  $.ajax({
    url: './includes/recovery_password.php',
    method: 'POST',
    dataType: 'json',
    data: {useremail: useremail},
    beforeSend: function(){
      $("#btn_recover").attr("disabled", true);
      $("#btn_recover").html('<span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span> Loading...');
    },
    success: function(data) {
      if (data.error != "") {
        toastMixin.fire({
          icon: 'error',
          title: "Error Message",
          text: data.error
      });
      $("#btn_recover").attr("disabled", false);
      $("#btn_recover").html('Try again');
      } else {
        toastMixin.fire({
          icon: 'success',
          title: "Success Message",
          text: data.msg
      });
      $("#btn_recover").attr("disabled", false);
      $("#btn_recover").html('Get new password');
      }
    }
  });
}
});

// shop cart filter fetch data
filter_cart_data();
function filter_cart_data() {
  $.ajax({
    url: "./includes/filter_cart_data.php",
    method: "GET",
    dataType: "json",
    success: function(data) {
      const numberToFormated = data.total_price.toLocaleString('en-US', {minimumFractionDigits: 2, maximumFractionDig: 2});
      $('#cart_list_filter').html(data.cart_details);
      $('.cart_list_price').text("₦" + numberToFormated);
      $("#total_price").val(data.total_price);
    },
    error: function() {
      toastMixin.fire({
        title: "An error occurred while loading the cart. Please try again.",
        icon: "warning",
      });
    }
  });
}

// cart update
$(document).on('change','.txt_update_qty', function(e){
  e.preventDefault();
  let qtyid = $(this).attr('id');
  let qtyVal = $(this).val();
  $.ajax({
    method: "POST",
    url: "./includes/update_cart_items.php",
    data: {qtyid: qtyid, qtyVal: qtyVal},
    dataType: "json",
    success: function(data) {
      if (data.error !== "") {
        toastMixin.fire({
          title: "Error Message",
          text: data.error,
          icon: "error", // Use "error" instead of "Error"
        });
      } else {
        toastMixin.fire({
          title: "Success Message",
          text: data.msg,
          icon: "success" // Use "success" instead of "Success"
        });
        filter_cart_data();
        loadCart();
      }
    }
  });
});
//Applying promo codes to cart
$(document).on('submit', '#form_promo', function (e) {
  e.preventDefault();
  var promocode = $("#promoCode").val();
  var total_price = $("#total_price").val();
  var initialprice = $(".cart_list_price").html();

  $.ajax({
      url: './includes/apply_promocode.php',
      method: 'POST',
      dataType: 'json',
      data: {
          promocode: promocode,
          total_price: total_price
      },
      beforeSend: function () {
          $('#btn_promo').attr('disabled', true);
          $('#btn_promo').html('<span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span> Applying...');
      },
      success: function (data) {
          if (data.error) {
            toastMixin.fire({
              title: 'Error Message',
              text: data.error,
              icon: 'error'
          });
          } else if (data.discounted_price) {
            $("#discount_price").removeClass("d-none");
            $("#discount_price").html(initialprice);
            $("#total_price").val(data.discounted_price);
            $("#promoCode").val("");
            $("#promoCode").attr('disabled', 'disabled');
            $('#btn_promo').attr('disabled', true);
            $('#btn_promo').html('Promo Code Applied');
            $(".cart_list_price").html("₦" + data.discounted_price.toLocaleString('en-US', {minimumFractionDigits: 2, maximumFractionDig: 2}));
            $('.cart_price').text("₦" + data.discounted_price.toLocaleString('en-US', {minimumFractionDigits: 2, maximumFractionDig: 2}));
              toastMixin.fire({
                title: 'success message',
                text: 'Promo code applied successfully. Discounted price: ₦' + data.discounted_price.toLocaleString('en-US', {minimumFractionDigits: 2, maximumFractionDig: 2}),
                icon: 'success'
              });
              // discount_price
          } else {
              // Handle other cases or provide appropriate feedback
              toastMixin.fire({
                title: 'Error Message',
                text: 'An unknown error occurred',
                icon: 'error'
            });
          }
      },
      error: function () {
          // Handle the case where there's an AJAX request error
          alert("An error occurred while processing the request.");

          // Restore the button
          $('#btn_promo').attr('disabled', false);
          $('#btn_promo').html('Apply Promo Code');
      }
  });
});

$(document).on('click', '.btn_logout', function (e) {
  e.preventDefault();
  $.ajax({
    url: './includes/logout_user.php',
    method: 'POST',
    dataType: 'json',
    beforeSend: function () {
      $(".btn_logout").attr('disabled', true);
      $(".btn_logout").html('<span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span> Logging Out..');
    },
    success: function(response) {
      if (response.success) {
        // Logout was successful, redirect to the login page
        window.location.href = './account-signin.php';
      } else {
        // Logout failed, display an error message
        alert('Logout failed. Please try again.');
      }
    },
    error: function() {
      // AJAX request encountered an error
      alert('An error occurred during logout. Please try again.');
    }
  });
});

});