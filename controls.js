$(document).ready(function () {
  var toastMixin = Swal.mixin({
    toast: true,
    icon: "success",
    title: "General Title",
    animation: false,
    position: "top-right",
    showConfirmButton: false,
    timer: 3000,
    timerProgressBar: true,
    didOpen: (toast) => {
      toast.addEventListener("mouseenter", Swal.stopTimer);
      toast.addEventListener("mouseleave", Swal.resumeTimer);
    },
  });
  //Infinite scroll(will load more product when reaching the end)
  const lastProductObserver = new IntersectionObserver((entries) => {
    const lastProduct = entries[0];
    if (!lastProduct.isIntersecting) return;
    // console.log("ssss");
    loadMore();
    loadMore_list();
    lastProductObserver.unobserve(lastProduct.target);
    lastProductObserver.observe(
      document.querySelector("footer div:first-child")
    );
  });
  lastProductObserver.observe(document.querySelector("footer div:first-child"));
  function loadMore() {
    $.ajax({
      url: "./includes/loadmoreproduct.php",
      method: "GET",
      type: "text",
      success: function (data) {
        $("#view_products").append(data);
      },
    });
  }
  function loadMore_list() {
    $.ajax({
      url: "./includes/loadmoreproduct_list.php",
      method: "GET",
      type: "text",
      success: function (data) {
        $(".shop-list-product").append(data);
      },
    });
  }

  function load_profile_info() {
    $.ajax({
      url: "./includes/load_session.php",
      type: "GET",
      dataType: "json",
      success: function (response) {
        // Process the response data
        $("#user_infor").html(response.username);
        $("#profile-fullname").html(response.username);
        $("#profile-email").html(response.useremail);
        $("#profile-image").attr("src", "img/shop/account/" + response.image);
        $("#account-email").attr("value", response.useremail);
        $("#account-phone").attr("value", response.phone);
        $("#account-fullname").attr("value", response.username);
        $("#profile-image-top").attr(
          "src",
          "img/shop/account/" + response.image
        );
        $("#checkout-address-1").attr("value", response.address);
        $("#checkout-address-2").attr("value", response.address2);
        $("#checkout-zip").attr("value", response.zip);
        // Add more lines here to populate other elements with the retrieved data
      },
      error: function (xhr, status, error) {
        // Handle the Ajax request error
        toastMixin.fire({
          icon: "error",
          title: "Ajax Error",
          text: "An error occurred while making the Ajax request: " + error,
        });
      },
    });
  }
  // Call the function to load data
  load_profile_info();

  function count_wishlist() {
    $.ajax({
      url: "./includes/count_wishlist.php",
      type: "GET",
      dataType: "text",
      success: function (response) {
        // Process the response data
        $(".account-wishlist-count").html(response);
        // Add more lines here to populate other elements with the retrieved data
      },
      error: function (xhr, status, error) {
        // Handle the Ajax request error
        toastMixin.fire({
          icon: "error",
          title: "Ajax Error",
          text: "An error occurred while making the Ajax request: " + error,
        });
      },
    });
  }
  // Call the function to load data
  count_wishlist();

  function count_orders() {
    $.ajax({
      url: "./includes/count_order.php",
      type: "GET",
      dataType: "text",
      success: function (response) {
        // Process the response data
        $("#account-order-count").html(response);
        // Add more lines here to populate other elements with the retrieved data
      },
      error: function (xhr, status, error) {
        // Handle the Ajax request error
        toastMixin.fire({
          icon: "error",
          title: "Ajax Error",
          text: "An error occurred while making the Ajax request: " + error,
        });
      },
    });
  }
  // Call the function to load data
  count_orders();

  function count_support_ticket() {
    $.ajax({
      url: "./includes/count_ticket.php",
      type: "GET",
      dataType: "text",
      success: function (response) {
        // Process the response data
        $(".account-support-count").html(response);
        // Add more lines here to populate other elements with the retrieved data
      },
      error: function (xhr, status, error) {
        // Handle the Ajax request error
        toastMixin.fire({
          icon: "error",
          title: "Ajax Error",
          text: "An error occurred while making the Ajax request: " + error,
        });
      },
    });
  }
  // Call the function to load data
  count_support_ticket();

  function load_orders_list() {
    $.ajax({
      url: "./includes/get_orders.php",
      type: "GET",
      dataType: "text",
      success: function (response) {
        // Process the response data
        $("#orders_list").html(response);
        // Add more lines here to populate other elements with the retrieved data
      },
      error: function (xhr, status, error) {
        // Handle the Ajax request error
        toastMixin.fire({
          icon: "error",
          title: "Ajax Error",
          text: "An error occurred while making the Ajax request: " + error,
        });
      },
    });
  }
  // Call the function to load data
  load_orders_list();

  $(document).on("click", "#update-profile", function (e) {
    e.preventDefault();
    const fullname = $("#account-fullname").val();
    const email = $("#account-email").val();
    const phone = $("#account-phone").val();
    const password = $("#account-confirm-pass").val();
    if (fullname == "" || email == "" || phone == "" || password == "") {
      toastMixin.fire({
        icon: "error",
        title: "Empty Values",
        text: "All fields must be filled",
      });
      return false;
    } else {
      $.ajax({
        url: "./includes/update_profile.php",
        type: "POST",
        dataType: "text",
        data: {
          fullname: fullname,
          email: email,
          phone: phone,
          password: password,
        },
        success: function (response) {
          // Process the response data
          if (response == "ok") {
            toastMixin.fire({
              title: "Success",
              icon: "success",
              text: "Profile details updated successfully",
            });
            window.location.reload();
          } else if (response == "not ok") {
            toastMixin.fire({
              title: "Information",
              icon: "info",
              text: "No Details is been updated",
            });
          } else {
            toastMixin.fire({
              title: "Error",
              icon: "error",
              text: response,
            });
          }
          // Add more lines here to populate other elements with the retrieved data
        },
        error: function (xhr, status, error) {
          // Handle the Ajax request error
          toastMixin.fire({
            icon: "error",
            title: "Ajax Error",
            text: "An error occurred while making the Ajax request: " + error,
          });
        },
      });
    }
  });

  $(document).on("click", "#order-sort", function (e) {
    e.preventDefault();
    const value = $(this).val();

    if (value == "0") {
      window.location.reload();
    } else {
      $.ajax({
        url: "./includes/filter_orders.php",
        type: "POST",
        dataType: "text",
        data: { value: value },
        success: function (response) {
          // Process the response data
          $("#orders_list").html(response);
        },
        error: function (xhr, status, error) {
          // Handle the Ajax request error
          toastMixin.fire({
            icon: "error",
            title: "Ajax Error",
            text: "An error occurred while making the Ajax request: " + error,
          });
        },
      });
    }
  });

  view_shop_product();
  function view_shop_product() {
    $.ajax({
      url: "./includes/fetch_shop_list_products.php",
      method: "GET",
      dataType: "text",
      success: function (data) {
        $(".shop-list-product").html(data);
      },
    });
  }
  get_wishlist_product();
function get_wishlist_product() {
    $.ajax({
    url:"./includes/getwishlist.php",
    method:"GET",
    type:"text",
    success:function(data){
      $("#wishlist-items").html(data);
    }
  });
}

  function get_cart_items() {
    $.ajax({
      url: "./includes/get_cart_items.php",
      method: "GET",
      dataType: "text",
      success: function (data) {
        const response = JSON.parse(data);
        if (response.error == "empty") {
          $("#shop-cart-items").html(
            "<h3 class='text-center'>Your Cart is Empty!</h3>"
          );
        } else {
          $("#shop-cart-items").html(response.cart_details);
          $("#shop-cart-total-side").html(response.total_price);
        }
      },
      error: function (xhr, status, error) {
        // Handle the Ajax request error
        toastMixin.fire({
          icon: "error",
          title: "Ajax Error",
          text: "An error occurred while making the Ajax request: " + error,
        });
      },
    });
  }
  get_cart_items();

  $(document).on("change", "#quantity1", function () {
    const qty = $(this).val();
    const product_id = $(this).attr("data-item-id");
    $.ajax({
      url: "./includes/update_cart_items.php",
      method: "POST",
      dataType: "text",
      data: { qty: qty, product_id: product_id },
      success: function (data) {
        toastMixin.fire({
          icon: "success",
          title: "Success Message",
          text: "Cart Updated Successfully",
        });
        $(this).val(qty);
      },
      error: function (xhr, status, error) {
        // Handle the Ajax request error
        toastMixin.fire({
          icon: "error",
          title: "Ajax Error",
          text: "An error occurred while making the Ajax request: " + error,
        });
      },
    });
  });

  $(document).on("click", "#remove_cart_item", function () {
    const product_id = $(this).attr("data-item-id");
    $.ajax({
      url: "./includes/delete_cart.php",
      method: "POST",
      dataType: "text",
      data: { delete_id: product_id },
      success: function (data) {
        toastMixin.fire({
          icon: "success",
          title: "Success Message",
          text: "Cart Item has been deleted Successfully",
        });
        console.log(data.msg);
        window.location.reload();
      },
      error: function (xhr, status, error) {
        // Handle the Ajax request error
        toastMixin.fire({
          icon: "error",
          title: "Ajax Error",
          text: "An error occurred while making the Ajax request: " + error,
        });
      },
    });
  });
  get_order_summary();
  function get_order_summary() {
    $.ajax({
      url: "./includes/get_order_summary.php",
      method: "GET",
      dataType: "text",
      success: function (data) {
        const response = JSON.parse(data);
        if (response.error == "empty") {
          $("#order_summary").html(
            "<h3 class='text-center'>No order has been placed!</h3>"
          );
        } else {
          $("#order_summary").html(response.order_summary);
          $("#order_summary_bottom").html(response.order_summary_bottom);
        }
      },
      error: function (xhr, status, error) {
        // Handle the Ajax request error
        toastMixin.fire({
          icon: "error",
          title: "Ajax Error",
          text: "An error occurred while making the Ajax request: " + error,
        });
      },
    });
  }

  $(document).on("click", "#proceed-to-shipping", function (e) {
    const fname = $("#account-fullname").val();
    const email = $("#account-email").val();
    const phone = $("#account-phone").val();
    const country = $("#checkout-country").val();
    const zip_code = $("#checkout-zip").val();
    const address1 = $("#checkout-address-1").val();
    const address2 = $("#checkout-address-2").val();
 
    $.ajax({
      url: "./includes/add_shipping_info.php",
      method: "POST",
      dataType: "text",
      data: {
        fname: fname,
        email: email,
        phone: phone,
        address1: address1,
        address2: address2,
        zip_code: zip_code,
        country: country,
      },
      success: function (data) {
     
        if (data == "success") {
          window.location.href='./checkout-shipping.php'
        } else {
          toastMixin.fire({
            icon: "error",
            title: "Ajax Error",
            text: "eroor " + data,
          });
        }
      },
      error: function (xhr, status, error) {
        // Handle the Ajax request error
        toastMixin.fire({
          icon: "error",
          title: "Ajax Error",
          text: "An error occurred while making the Ajax request: " + error,
        });
      },
    });
  });

  $(document).on("change", "#shop_sorting", function (e) {
    const value = $(this).val();
    $.ajax({
      url: "./includes/filter_shop_product.php",
      method: "POST",
      dataType: "text",
      data: {
        criteria: value,
      },
      success: function (data) {
        $("#view_products").html("");
        $("#view_products").html(data);
      },
      error: function (xhr, status, error) {
        // Handle the Ajax request error
        toastMixin.fire({
          icon: "error",
          title: "Ajax Error",
          text: "An error occurred while making the Ajax request: " + error,
        });
      },
    });
  });


  $(document).on("change", "#shop_list_sorting", function (e) {
    const value = $(this).val();
    $.ajax({
      url: "./includes/filter_shop_list_product.php",
      method: "POST",
      dataType: "text",
      data: {
        criteria: value,
      },
      success: function (data) {
        $(".shop-list-product").html("");
        $(".shop-list-product").html(data);
      },
      error: function (xhr, status, error) {
        // Handle the Ajax request error
        toastMixin.fire({
          icon: "error",
          title: "Ajax Error",
          text: "An error occurred while making the Ajax request: " + error,
        });
      },
    });
  });

  $(document).on("click", "#remove_wishlist", function (e) {
    const id = $(this).attr("data-prod-id");
    $.ajax({
      url: "./includes/remove_wishlist.php",
      method: "POST",
      dataType: "text",
      data: {
        product_id: id,
      },
      success: function (data) {
        toastMixin.fire({
          icon: "success",
          title: "Removed Successfully",
          text: "Item has been removed from wish list successfully",
        });
        get_wishlist_product();
        count_wishlist();
      },
      error: function (xhr, status, error) {
        // Handle the Ajax request error
        toastMixin.fire({
          icon: "error",
          title: "Ajax Error",
          text: "An error occurred while making the Ajax request: " + error,
        });
      },
    });
  });
});
