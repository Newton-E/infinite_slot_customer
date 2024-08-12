var originalContent;

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
        $("#checkout-address-1").attr("value", response.address);
        $("#checkout-zip").attr("value", response.zip);
  
        // List of states in Nigeria
        const statesInNigeria = [
          "Abia", "Adamawa", "Akwa Ibom", "Anambra", "Bauchi", "Bayelsa", "Benue", "Borno", "Cross River", "Delta",
          "Ebonyi", "Edo", "Ekiti", "Enugu", "FCT", "Gombe", "Imo", "Jigawa", "Kaduna", "Kano", "Katsina", "Kebbi",
          "Kogi", "Kwara", "Lagos", "Nasarawa", "Niger", "Ogun", "Ondo", "Osun", "Oyo", "Plateau", "Rivers", "Sokoto",
          "Taraba", "Yobe", "Zamfara"
        ];
  
        // Populate the select element with states
        let stateOptions = '<option value="">Choose state</option>';
        statesInNigeria.forEach(state => {
          stateOptions += `<option value="${state}">${state}</option>`;
        });
        $("#checkout-state").html(stateOptions);
  
        // Set the current state as selected
        $("#checkout-state").val(response.state);
        
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

  count_wishlist();

  function count_wishlist() {
    $.ajax({
      url: "./includes/count_wishlist.php",
      type: "GET",
      dataType: "text",
      success: function (response) {
        // Process the response data
        $("#account-wishlist-count").html(response);
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
  // count_wishlist();

  // Code for counting compare table
  count_compare();
  function count_compare() {
    $.ajax({
      url: "./includes/count_compare_list.php",
      type: "GET",
      dataType: "text",
      success: function (response) {
        // Process the response data
        $(".account-compare-count").html(response);
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
  // count_orders();

  function count_support_ticket() {
    $.ajax({
      url: "./includes/count_ticket.php",
      type: "GET",
      dataType: "text",
      success: function (response) {
        // Process the response data
        $("#account-support-count").html(response);
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
  // count_support_ticket();

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
  // load_orders_list();

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

  // view_shop_product();
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
      url: "./includes/getwishlist.php",
      method: "GET",
      type: "text",
      success: function (data) {
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
  // get_cart_items();

  $(document).on("change", "#quantity1", function () {
    const qty = $(this).val();
    const product_id = $(this).attr("data-item-id");
    $.ajax({
      url: "./includes/update_cart_items.php",
      method: "POST",
      dataType: "json",
      data: { qty: qty, product_id: product_id },
      success: function (data) {
        if (data.error != "") {
          toastMixin.fire({
            icon: "error",
            title: "Error",
            text: "An error occurred: " + data.error,
          });
        } else {
          toastMixin.fire({
            icon: "success",
            title: "Success Message",
            text: data.msg,
          });
          // window.location.reload()
          filter_cart_data()
        }
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

  $(document).on("click", ".proceed-to-shipping", function (e) {
    const phone = $("#account-phone").val();
    const state = $("#checkout-state").val();
    const zip_code = $("#checkout-zip").val();
    const address1 = $("#checkout-address").val();

    // Function to handle success in getting the geolocation
    function handleSuccess(position) {
        const latitude = position.coords.latitude;
        const longitude = position.coords.longitude;
        const map_url = `https://www.google.com/maps?q=${latitude},${longitude}`;

        // Proceed with the AJAX request
        $.ajax({
            url: "./includes/add_shipping_info.php",
            method: "POST",
            dataType: "text",
            data: {
              phone: phone,
              state: state,
              address1: address1,
              zip_code: zip_code,
              map_url: map_url
            },
            success: function (data) {
                if (data == "success") {
                    window.location.href = './checkout-shipping.php';
                } else {
                    toastMixin.fire({
                        icon: "error",
                        title: "Error",
                        text: "Error: " + data,
                    });
                }
            },
            error: function (xhr, status, error) {
                toastMixin.fire({
                    icon: "error",
                    title: "Ajax Error",
                    text: "An error occurred while making the Ajax request: " + error,
                });
            },
        });
    }

    // Function to handle errors in getting the geolocation
    function handleError(error) {
        toastMixin.fire({
            icon: "error",
            title: "Location Error",
            text: "Unable to retrieve your location: " + error.message,
        });
    }

    // Get the current position
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(handleSuccess, handleError);
    } else {
        toastMixin.fire({
            icon: "error",
            title: "Geolocation Error",
            text: "Geolocation is not supported by this browser.",
        });
    }
});
// check if method is selected
$(document).on("click", ".proceed_to_payment", function(e) {
  e.preventDefault();
  $.ajax({
      url: './includes/check_shipping_method.php',
      type: 'GET',
      dataType: 'json',
      success: function(response) {
          if (response.status === 'success') {
              // Redirect to checkout-payment.php if shipping method is selected
              window.location.href = 'checkout-payment.php';
          } else {
              // Show an alert if shipping method is not selected
              toastMixin.fire({
                icon: "error",
                title: "Error Message",
                text: response.message,
            });
          }
      },
      error: function(xhr, status, error) {
        toastMixin.fire({
          icon: "error",
          title: "Error Message",
          text: error,
      });
      }
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
        console.log(data)
        $("#view_products").html(data);
        originalContent = $("#view_products").html()

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
  function load_checkout_address() {
    $.ajax({
      url: "./includes/get_checkout_address.php",
      type: "GET",
      dataType: "text",
      success: function (response) {
        // Process the response data
        $("#checkout-address").html(response);
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
  // load_checkout_address();


  $(document).on("click", ".submit-ticket", function (e) {
    e.preventDefault();
    const subject = $("#ticket-subject").val();
    const type = $("#ticket-type").val();
    const priority = $("#ticket-priority").val();
    const content = $("#ticket-description").val();

    $.ajax({
      url: "./includes/add_support_ticket.php",
      method: "POST",
      dataType: "text",
      data: {
        subject,
        type,
        priority,
        content
      },
      success: function (data) {
        if (data == "yes") {
          toastMixin.fire({
            icon: "success",
            title: "Submitted Successfully",
            text: "Ticket Submitted Successfully",
          });
          $(".submit-ticket-close").click()
          load_support_ticket()
        } else {
          toastMixin.fire({
            icon: "error",
            title: "Error",
            text: "An error occurred while submitting ticket",
          });
        }

        // window.location.reload();
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

  function load_support_ticket() {
    $.ajax({
      url: "./includes/get_support_tickets.php",
      type: "GET",
      dataType: "text",
      success: function (response) {
        // Process the response data
        $(".support-ticket-content").html(response);
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
  // load_support_ticket();

  function load_single_ticket() {
    const params = new URLSearchParams(window.location.search);
    const id = params.get('id');
    // console.log(page)
    $.ajax({
      url: "./includes/get_single_ticket.php",
      type: "GET",
      dataType: "json",
      data: { id },
      success: function (response) {

        if (response.error == null) {
          $(".single-ticket-header").html(response.header);
          $(".single-ticket-body").html(response.body);
          $(".single-ticket-header-mobile").html(response.mobile);
          $(".submit-ticket-comment").prop("disabled", true);
          $(".submit-ticket-comment").attr("title", "Not implemented yet");
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
  // Call the function to load data
  // load_single_ticket();

  load_addresses();
  function load_addresses() {
    $.ajax({
      url: "./includes/get_addresses.php",
      type: "GET",
      dataType: "text",
      success: function (response) {
        // Process the response data
        $(".registered_addresses").html(response);
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

  $(document).on("click", ".add-new-address", function (e) {
    e.preventDefault();
    const address = $("#newaddress").val();

    $.ajax({
        url: "./includes/add_new_address.php",
        method: "POST",
        dataType: "json",
        data: {
            address: address
        },
        success: function (data) {
            if (data.error === "") {
                toastMixin.fire({
                    icon: "success",
                    title: "Success",
                    text: "Address has been added successfully!",
                });
                $(".add-new-address-close").click();
                load_addresses();
            } else {
                toastMixin.fire({
                    icon: "error",
                    title: "Error",
                    text: "An error occurred while adding address: " + data.error,
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


  $(document).on("click", ".delete-new-address", function (e) {
    e.preventDefault();
    const id = $(this).attr("data-addressid");


    $.ajax({
      url: "./includes/delete_address.php",
      method: "POST",
      dataType: "text",
      data: {
        id,
      },
      success: function (data) {
        if (data == "yes") {
          toastMixin.fire({
            icon: "success",
            title: "Success",
            text: "Address has been deleted successfully!",
          });
          $(".add-new-address-close").click()
          load_addresses()
        } else {
          toastMixin.fire({
            icon: "error",
            title: "Error",
            text: "An error occurred while deleting addresss" + data,
          });
        }

        // window.location.reload();
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
  // function load_checkout_address() {
  //   $.ajax({
  //     url: "./includes/get_checkout_address.php",
  //     type: "GET",
  //     dataType: "text",
  //     success: function (response) {
  //       // Process the response data
  //       $("#checkout-address").html(response);
  //       // Add more lines here to populate other elements with the retrieved data
  //     },
  //     error: function (xhr, status, error) {
  //       // Handle the Ajax request error
  //       toastMixin.fire({
  //         icon: "error",
  //         title: "Ajax Error",
  //         text: "An error occurred while making the Ajax request: " + error,
  //       });
  //     },
  //   });
  // }
  // Call the function to load data
  // load_checkout_address();

  $(document).on("click", ".submit-ticket", function (e) {
    e.preventDefault();
    const subject = $("#ticket-subject").val();
    const type = $("#ticket-type").val();
    const priority = $("#ticket-priority").val();
    const content = $("#ticket-description").val();

    $.ajax({
      url: "./includes/add_support_ticket.php",
      method: "POST",
      dataType: "text",
      data: {
        subject,
        type,
        priority,
        content
      },
      success: function (data) {
        if (data == "yes") {
          toastMixin.fire({
            icon: "success",
            title: "Submitted Successfully",
            text: "Ticket Submitted Successfully",
          });
          $(".submit-ticket-close").click()
          load_support_ticket()
        } else {
          toastMixin.fire({
            icon: "error",
            title: "Error",
            text: "An error occurred while submitting ticket",
          });
        }

        // window.location.reload();
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

  function load_support_ticket() {
    $.ajax({
      url: "./includes/get_support_tickets.php",
      type: "GET",
      dataType: "text",
      success: function (response) {
        // Process the response data
        $(".support-ticket-content").html(response);
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
  // load_support_ticket();

  function load_single_ticket() {
    const params = new URLSearchParams(window.location.search);
    const id = params.get('id');
    // console.log(page)
    $.ajax({
      url: "./includes/get_single_ticket.php",
      type: "GET",
      dataType: "json",
      data: { id },
      success: function (response) {

        if (response.error == null) {
          $(".single-ticket-header").html(response.header);
          $(".single-ticket-body").html(response.body);
          $(".single-ticket-header-mobile").html(response.mobile);
          $(".submit-ticket-comment").prop("disabled", true);
          $(".submit-ticket-comment").attr("title", "Not implemented yet");
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
  // Call the function to load data
  // load_single_ticket();


  function load_addresses() {
    $.ajax({
      url: "./includes/get_addresses.php",
      type: "GET",
      dataType: "text",
      success: function (response) {
        // Process the response data
        $(".registered_addresses").html(response);
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
  // load_addresses();

  // $(document).on("click", ".add-new-address", function (e) {
  //   e.preventDefault();
  //   const address = $("#newaddress").val();


  //   $.ajax({
  //     url: "./includes/add_new_address.php",
  //     method: "POST",
  //     dataType: "text",
  //     data: {
  //       address,
  //     },
  //     success: function (data) {
  //       if (data == "yes") {
  //         toastMixin.fire({
  //           icon: "success",
  //           title: "Success",
  //           text: "Address has been added successfully!",
  //         });
  //         $(".add-new-address-close").click()
  //         load_addresses()
  //       } else {
  //         toastMixin.fire({
  //           icon: "error",
  //           title: "Error",
  //           text: "An error occurred while Adding addresss" + data,
  //         });
  //       }

  //       // window.location.reload();
  //     },
  //     error: function (xhr, status, error) {
  //       // Handle the Ajax request error
  //       toastMixin.fire({
  //         icon: "error",
  //         title: "Ajax Error",
  //         text: "An error occurred while making the Ajax request: " + error,
  //       });
  //     },
  //   });
  // });

  $(document).on("click", ".delete-new-address", function (e) {
    e.preventDefault();
    const id = $(this).attr("data-addressid");


    $.ajax({
      url: "./includes/delete_address.php",
      method: "POST",
      dataType: "text",
      data: {
        id,
      },
      success: function (data) {
        if (data == "yes") {
          toastMixin.fire({
            icon: "success",
            title: "Success",
            text: "Address has been deleted successfully!",
          });
          $(".add-new-address-close").click()
          load_addresses()
        } else {
          toastMixin.fire({
            icon: "error",
            title: "Error",
            text: "An error occurred while deleting addresss" + data,
          });
        }

        // window.location.reload();
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



  // veiw shop product script
  // view_shop_product();
  function view_shop_product() {
    $.ajax({
      url: './includes/fetch_shop_products.php',
      method: 'GET',
      dataType: 'json',
      success: function (data) {
        $("#view_products").append(data);
        originalContent = $("#view_products").html()

      }
    });
  }
  // end view shop product script

  //Remove cart button event handlers
  $("#cart_details").on("click", ".btn_remove", function (e) {
    e.preventDefault();
    var delete_id = $(this).attr('id');

    $.ajax({
      url: "./includes/delete_cart.php",
      method: "POST",
      data: { delete_id: delete_id }, // Pass the delete_id to the server
      dataType: "json",
      success: function (data) {
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
          get_order_summary();
        }
      },
      error: function () {
        toastMixin.fire({
          title: "Error Message",
          icon: "error",
          text: "An error occurred while deleting cart. Please try again."
        });
      }
    });
  });
  //Remove cart button event handlers
  $("#cart_list_filter").on("click", ".btn_remove_cart", function (e) {
    e.preventDefault();
    var delete_id = $(this).attr('id');
    $.ajax({
      url: "./includes/delete_cart.php",
      method: "POST",
      data: { delete_id: delete_id }, // Pass the delete_id to the server
      dataType: "json",
      success: function (data) {
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
      error: function () {
        toastMixin.fire({
          title: "Error Message",
          icon: "error",
          text: "An error occurred while deleting cart. Please try again."
        });
      }
    });
  });
  // veiw product script
  // view_products();
  function view_products() {
    $.ajax({
      url: './includes/fetchproducts.php',
      method: 'GET',
      dataType: 'json',
      success: function (data) {
        $("#view_products").html(data);
        originalContent = $("#view_products").html()

      }
    });
  }
  // end view product script

  // attach click event to dynamically generated elements with class ".btn_view_cart"
  $("#view_products").on("click", ".btn_view", function (e) {
    e.preventDefault();
    var product_id = $(this).attr("id");

    $.ajax({
      url: './includes/load_product_details.php',
      method: 'POST',
      dataType: 'json',
      data: { product_id: product_id },
      success: function (data) {
        $("#quick-view-electro").modal("show");
        $("#productName").html(data.product_name);
        $("#productid").val(data.productid);
        $(".quick-view-price").html(data.product_price);
        $(".quick-view-brand").html(data.brand_name);
        $(".quick-view-categiory").html(data.categoryname);
        $(".btn_add_cart").attr("id", data.productid);
        $(".btn_add_wishlist_preview").attr("id", data.productid);
        $(".view_more_product").attr("href", "shop-single.php?product=" + data.productid);
        $("#productName").attr("href", "shop-single.php?product=" + data.productid);
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
      success: function (data) {
        $('#cart_details').html(data.cart_details);
        $('.cart_price').text(data.total_price);
        $('.cart_prices').text(data.total_price);
        $('.cart_count').text(data.total_item);
        $('.cart_counts').text(data.total_item);
      },
      error: function () {
        toastMixin.fire({
          title: "An error occurred while loading the cart. Please try again.",
          icon: "warning",
        });
      }
    });
  }

  // click event to add to cart without qty value
  // Attach click event to "Add to Cart" button
  $(document).on("click", ".btn_add_cart_qty", function (e) {
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
      success: function (data) {
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
          // Load the updated cart
          loadCart();
        }
      },
      error: function () {
        // Error in Ajax request
        toastMixin.fire({
          title: "An error occurred while adding the product to the cart. Please try again.",
          icon: "warning",
        });
      }
    });
  });
  // Attach click event to "Add to Cart" button
  $(document).on("click", ".btn_add_cart", function (e) {
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
      success: function (data) {
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
      error: function () {
        // Error in Ajax request
        toastMixin.fire({
          title: "An error occurred while adding the product to the cart. Please try again.",
          icon: "warning",
        });
      }
    });
  });
  // load compare product
  function load_compared_products() {
    let category_id = $("#first-product-category").val();
    let product_id = $("#first-product-id").val();
    $.ajax({
        url: "./includes/load_compare_products.php",
        method: "POST", // Change to POST method
        dataType: "json",
        data: {category_id: category_id, product_id: product_id},
        success: function (data) {
            let output = '';
            $.each(data, function (index, product) {
                output += '<div class="col-lg-3 col-md-4 col-sm-6 px-2 mb-4">';
                output += '<label>'
                output += '<input type="checkbox" class="card-input-element" name="compare_product[]" value="' + product.product_id + '">';
                output += '<div class="card card-default card-input">' + product.product_status;
                output += '<img src="../retailers_admin/assets/img/products/' + product.image_preview + '" class="card-img-top" alt="Product">';
                output += '<div class="card-body py-2"><span class="product-meta d-block fs-xs pb-1">' + product.category_name + '</span>';
                output += '<h3 class="product-title fs-sm">' + product.product_name + '</h3>';
                output += '<div class="d-flex justify-content-between">';
                output += '<div class="product-price"><span class="text-accent">' + product.product_price + '</span></div>';
                output += '<div class="star-rating"><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i></div>';
                output += '</div></div></div></div></label>';
            });
            $("#compare_products").html(output);
        },
        error: function () {
            toastMixin.fire({
                title: "An error occurred while loading the compare products. Please try again.",
                icon: "warning",
            });
        }
    });
}

// submit compare product form
$("#compare-form").on('submit', function (e) {
  e.preventDefault();
  let first_prod_id = $('#first-product-id').val();
  let selectedProducts = $('input[name="compare_product[]"]:checked').map(function () {
      return this.value;
  }).get();

  if (selectedProducts.length === 0) {
      // No product selected, handle accordingly
      toastMixin.fire({
          title: "Please select at least one product to compare.",
          icon: "warning",
      });
      return;
  }

  $.ajax({
      url: "./includes/compare_product.php",
      method: "POST",
      dataType: "json",
      data: {selectedProducts: selectedProducts, first_prod_id: first_prod_id},
      success: function (data) {
          // Handle response
          if (data.error !== "") {
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
              $("#compare-modal").modal("hide");
              count_compare();
          }
      },
      error: function () {
          // Handle error response
          toastMixin.fire({
              title: "An error occurred while submitting the form.",
              icon: "warning",
          });
      }
  });
});

  //compare product events listeners
  $("#view_products").on("click", ".btn_compare", function (e) {
    e.preventDefault();
    let product_id = $(this).attr("id");
    $.ajax({
      url: "./includes/compare_select.php",
      method: "POST",
      dataType: "json",
      data: { product_id: product_id },
      success: function (data) {
        $("#compare-modal").modal("show");
        $("#compare-category").html(data.categoryname);
        $(".compared_product_name").html(data.product_name);
        $(".compare_prod_ammount").html(data.product_price);
        $(".compared_product_img").attr("src", data.product_image);
        $("#first-product-id").val(data.productid);
        $("#first-product-category").val(data.categoryid);
        load_compared_products();
      },
      error: function () {
        // Error in Ajax request
        toastMixin.fire({
          title: "An error occurred while comparing product. Please try again.",
          icon: "warning",
        });
      }
    });
  });
  //compare product events listeners for preview
  $(document).on("click", ".btn_compare_preview", function (e) {
    e.preventDefault();
    let compareid = $(this).attr("id");
    $.ajax({
      url: "./includes/compare_product.php",
      method: "POST",
      dataType: "json",
      data: { compareid: compareid },
      success: function (data) {
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
      error: function () {
        // Error in Ajax request
        toastMixin.fire({
          title: "An error occurred while comparing product. Please try again.",
          icon: "warning",
        });
      }
    });
  });

  //Add product to wish list
  $("#view_products").on("click", ".btn_add_wishlist", function (e) {
    e.preventDefault();
    let wishlistid = $(this).attr("id");
    $.ajax({
      url: "./includes/add_wishlist.php",
      method: "POST",
      dataType: "json",
      data: { wishlistid: wishlistid },
      success: function (data) {
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
          count_wishlist();
        }
      },
      error: function () {
        // Error in Ajax request
        toastMixin.fire({
          title: "An error occurred while adding the product to the wish list. Please try again.",
          icon: "warning",
        });
      }
    });
  });
  //Add product to wish list for preview
  $(document).on("click", ".btn_add_wishlist_preview", function (e) {
    e.preventDefault();
    let wishlistid = $(this).attr("id");
    $.ajax({
      url: "./includes/add_wishlist.php",
      method: "POST",
      dataType: "json",
      data: { wishlistid: wishlistid },
      success: function (data) {
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
      error: function () {
        // Error in Ajax request
        toastMixin.fire({
          title: "An error occurred while adding the product to the wish list. Please try again.",
          icon: "warning",
        });
      }
    });
  });

  //listen to change on quantity of preview 
  $(document).on("keyup", ".preview-product-qty", function (e) {
    e.preventDefault();
    let product_id = $(this).attr("id");
    let quantity = $(this).val();
    $.ajax({
      url: "./includes/load_product_details.php",
      method: "POST",
      dataType: "json",
      data: { product_id: product_id },
      success: function (data) {

        if (data.product_stork < quantity) {
          $(".product-badge").addClass("bg-danger");
          $(".product-badge").html("<i class='ci-security-check'></i> Not Enough in Stock");

          setInterval(() => {
            $(".product-badge").removeClass("bg-danger");
            $(".product-badge").html("<i class='ci-security-check'></i>Only " + data.product_stork + " Products are Available");
            $(".preview-product-qty").val(data.product_stork);
          }, 2000)
        } else {
          $(".product-badge").removeClass("bg-danger");
          $(".product-badge").html("<i class='ci-security-check'></i> Product Available");
        }

      },
      error: function () {
        // Error in Ajax request
        toastMixin.fire({
          title: "An error occurred while comparing product. Please try again.",
          icon: "warning",
        });
      }
    });
    // $(".preview-product-qty").val(1);
  });

  function load_product_img() {
    let img_id = $("#productid").val();
    $.ajax({
      url: './includes/preview_product_img.php',
      method: 'POST',
      dataType: 'json',
      data: { img_id: img_id },
      success: function (data) {
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
      data: { img_id: img_id },
      success: function (data) {
        $("#prod_img_children").html(data);
        initImageZoom();
      }
    });
  }
  $(document).on("click", ".change-preview-image", function () {
    $(".change-preview-image").removeClass("active")
    $(this).addClass("active")
    $("#main-quickview-image").attr("src", $(this).attr("data-img"));
    initImageZoom();
  })
  $('#login_form').submit(function (event) {
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
      success: function (response) {
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
      error: function () {
        toastMixin.fire({
          icon: 'error',
          text: 'An error occurred during login'
        });
      }
    });
  });

  $('#login-form').submit(function (event) {
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
      success: function (response) {
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
      error: function () {
        toastMixin.fire({
          icon: 'error',
          text: 'An error occurred during login'
        });
      }
    });
  });
  // Registration for registration
  $("#form_register").submit(function (e) {
    e.preventDefault();
    let fname = $("#reg_fn").val();
    let user_email = $("#reg_email").val();
    let address = $("#reg_address").val();
    let phone = $("#reg_phone").val();
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
          phone: phone,
          address: address,
          password_comfirm: password_comfirm
        },
        beforeSend: function () {
          $("#btn_reg").attr("disabled", true);
          $("#btn_reg").html('<span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span> Loading...');
        },
        success: function (data) {
          // console.log(data)
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
            setTimeout(function () {
              window.location.href = "account-profile.php";
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
      success: function (response) {
        // Process the response data
        $("#user_infor").html(response.username);
        // Add more lines here to populate other elements with the retrieved data
      },
      error: function (xhr, status, error) {
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
  $("#user_login_accout").on("click", function (e) {
    e.preventDefault();
    $.ajax({
      url: './includes/load_session.php',
      type: 'GET',
      dataType: 'json',
      success: function (response) {
        if (response.userid !== undefined) {
          // Session is set, redirect to account profile page
          window.location.href = 'account-profile.php';
        } else {
          // Session is not set, show sign-in modal
          $("#signin-modal").modal('show');
        }
      },
      error: function (xhr, status, error) {
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
  $("#form_recovery").submit(function (e) {
    e.preventDefault();
    let useremail = $("#recover_email").val();
    if (useremail == "") {
      $(this).addClass("was-validated");
    } else {
      $.ajax({
        url: './includes/recovery_password.php',
        method: 'POST',
        dataType: 'json',
        data: { useremail: useremail },
        beforeSend: function () {
          $("#btn_recover").attr("disabled", true);
          $("#btn_recover").html('<span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span> Loading...');
        },
        success: function (data) {
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
      success: function (data) {
        const numberToFormated = data.total_price.toLocaleString('en-US', { minimumFractionDigits: 2, maximumFractionDig: 2 });
        $("#cart_list_filter").html(data.cart_details);
        $(".cart_list_price").text("₦ " + numberToFormated);
        $("#total_price").val(data.total_price);
      },
      error: function () {
        toastMixin.fire({
          title: "An error occurred while loading the cart. Please try again.",
          icon: "warning",
        });
      }
    });
  }

  // cart update
  $('#cart_list_filter').on('change', '.txt_update_qty', function(e) {
    e.preventDefault();
    let qtyid = $(this).attr('id');
    let qtyVal = $(this).val();

    $.ajax({
        method: "POST",
        url: "./includes/update_cart_items.php",
        data: { qtyid: qtyid, qtyVal: qtyVal },
        dataType: "json",
        success: function(data) {
            if (data.error !== "") {
                toastMixin.fire({
                    title: "Error Message",
                    text: data.error,
                    icon: "error"
                });
            } else {
                toastMixin.fire({
                    title: "Success Message",
                    text: data.msg,
                    icon: "success"
                });
                filter_cart_data();
                get_cart_items();
                loadCart();
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log("AJAX Error: ", textStatus, errorThrown);
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
          $(".cart_list_price").html("₦" + data.discounted_price.toLocaleString('en-US', { minimumFractionDigits: 2, maximumFractionDig: 2 }));
          $('.cart_price').text("₦" + data.discounted_price.toLocaleString('en-US', { minimumFractionDigits: 2, maximumFractionDig: 2 }));
          toastMixin.fire({
            title: 'success message',
            text: 'Promo code applied successfully. Discounted price: ₦' + data.discounted_price.toLocaleString('en-US', { minimumFractionDigits: 2, maximumFractionDig: 2 }),
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
      success: function (response) {
        if (response.success) {
          // Logout was successful, redirect to the login page
          window.location.href = './account-signin.php';
        } else {
          // Logout failed, display an error message
          alert('Logout failed. Please try again.');
        }
      },
      error: function () {
        // AJAX request encountered an error
        alert('An error occurred during logout. Please try again.');
      }
    });
  });




  $(document).on("click", ".btn_buy_now_preview", function (e) {
    e.preventDefault();

    var product_id = $(this).attr("id");
    var quantity = $(".preview-product-qty").val();
    var amount = $(".quick-view-price").html();
    // alert(product_id + " "+ quantity+" "+amount);
    // Send Ajax request to add the product to the cart
    $.ajax({
      url: "./includes/add_new_pending_order.php",
      method: "POST",
      dataType: "TEXT",
      data: {
        productid: product_id,
        quantity: quantity,
        amount: amount
      },
      success: function (data) {
        // let resp = JSON.parse(data)
        // Check if the request was successful
        console.log("here" + data)
        if (data !== "error" && data !== "error in query") {
          window.location.href = data
        } else {
          alert("there was an error");
        }
        // if (data.error != "") {
        //   // Product added to cart successfully
        //   toastMixin.fire({
        //     title: "Error Message",
        //     icon: "warning",
        //     text: data.error
        //   });
        //   // Load the updated cart
        //   // loadCart();
        // } else {
        //   // Error adding product to cart
        //   toastMixin.fire({
        //     title: "Cart Added",
        //     text: data.msg,
        //     icon: "success"
        //   });
        //   // loadCart();
        // }
      },
      error: function () {
        // Error in Ajax request
        toastMixin.fire({
          title: "An error occurred while adding the product to the cart. Please try again.",
          icon: "warning",
        });
      }
    });
  });

  function load_tracking_order(product_id, ordercode) {
    $.ajax({
      url: "./includes/fetch_order_tracking.php",
      type: "GET",
      dataType: "json",
      data: { product_id: product_id, order_code: ordercode },
      success: function (response) {
        // Process the response data
        // console.log(response)
        $(".order_number").html(response.order_number);
        $("#order_tracking_details").html(response.order_tracking);
        $("#order_tracking_header").html(response.order_tracking_head);
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
  $(document).on("click", ".clickable-row", function () {

    window.location = $(this).data("href")
  });
  let observerEnabled = true;

  // document.querySelector("footer div:first-child")
  // function loadMore() {
  //   $.ajax({
  //     url: "./includes/loadmoreproduct.php",
  //     method: "GET",
  //     type: "text",
  //     success: function (data) {
  //       if (data == "no") {
  //         $("#view_products").append("No More product to display!");
  //         observerEnabled = false;
  //       } else {
  //         $("#view_products").append(data);
  //         originalContent = $("#view_products").html()
  //       }
  //     },
  //   });
  // }
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

  function observer() {
    // Infinite scroll (will load more product when reaching the end)
    const lastProductObserver = new IntersectionObserver((entries) => {
      const lastProduct = entries[0];
      if (!lastProduct.isIntersecting) return;

      if (observerEnabled) {
        loadMore();
      }

      lastProductObserver.unobserve(lastProduct.target);

      // Check if observer is still enabled before observing the next target
      if (observerEnabled) {
        lastProductObserver.observe(document.querySelector("footer div:first-child"));
      }
    });

    // Initial observation
    lastProductObserver.observe(document.querySelector("footer div:first-child"));
  }

  function observeTarget() {
    // Check the flag before observing
    if (observerEnabled) {
      observer();
    }
  }
  $(document).on('input', '.widget-filter-search', function () {
    var searchTerm = $(this).val().toLowerCase();
    var category = $(this).data('category');

    // Loop through each list item and show/hide based on the search term
    $('.widget-list-item[data-category="' + category + '"]').each(function () {
        var subcategory = $(this).find('.widget-filter-item-text').text().toLowerCase();
        if (subcategory.includes(searchTerm)) {
            $(this).show();
        } else {
            $(this).hide();
        }
    });
});
  
$(document).on('input','.brand-widget', function () {
    var searchTerm = $(this).val().toLowerCase();

    // Loop through each list item and show/hide based on the search term
    $('.brand-list li').each(function () {
        var brandName = $(this).find('.brand-label').text().toLowerCase();
        
        if (brandName.includes(searchTerm)) {
          $(this).removeClass('hidden');
      } else {
          $(this).addClass('hidden');
      }
    });
});

  originalContent = $("#view_products").html();

  $('.searchInput').on('input', function () {
    // Get the value from the input
    var searchText = $(this).val().toLowerCase();
    // console.log(searchText)
    // Make an AJAX request to the PHP script

    if (searchText !== "") {
      $.ajax({
        url: './includes/search.php',
        method: 'GET',
        dataType: 'json',
        data: { searchText },
        success: function (data) {
          // Display the search results
          $("#view_products").html(data);
        }
      });
    } else {
      // If searchText is empty, restore the original content
      $("#view_products").html(originalContent);
    }
  });
  function update_product_view_counter(id) {

    $.ajax({
      url: './includes/update_product_view_counter.php',
      method: 'POST',
      dataType: 'text',
      data: { product_id: id },
      success: function (data) {
        // Display the search results
        // $("#view_products").html(data);
        console.log(data)
      }
    });
  }
  function fetch_shop_category() {

    $.ajax({
      url: './includes/fetch_categories.php',
      method: 'GET',
      dataType: 'json',
      success: function (data) {
        // Display the search results
        $("#shop-categories").html(data);
        // console.log(data)
      }
    });
  }
  function fetch_shop_brand() {

    $.ajax({
      url: './includes/fetch_brand.php',
      method: 'GET',
      dataType: 'json',
      success: function (data) {
        // Display the search results
        $(".brand_category").html(data);
        // console.log(data)
      }
    });
  }
  function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    // console.log('URL: ' + url);
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)");
    // console.log('Regex:', regex);
    var results = regex.exec(url);
    // console.log('Results:', results);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, ' '));
  }

  const currentPath = window.location.pathname;



  // Extract the filename from the path
  const currentPageName = currentPath.substring(currentPath.lastIndexOf('/') + 1);

  // Log or use the currentPageName variable as needed
  // alert(currentPageName)
  if (currentPageName == "account-orders.php") {
    count_wishlist();
    count_orders();
    count_support_ticket();
    load_orders_list();
  } else if (currentPageName == "order-tracking.php") {
    var product_id = getParameterByName('productid');
    var ordercode = getParameterByName('ordercode');
    load_tracking_order(product_id, ordercode);
  } else if (currentPageName == "shop-cart.php") {
    get_cart_items();
    // filter_cart_data();
    var err = getParameterByName('error');
    if (err == "true") {
      toastMixin.fire({
        icon: "info",
        title: "Information",
        text: "Select atleast one product to checkout ! ",
      });
    }
  } else if (currentPageName == "shop.php") {
    view_shop_product();
    observeTarget();
    fetch_shop_category();
    fetch_shop_brand();
  } else if (currentPageName == "shop-list.php") {
    view_shop_product()
  } else if (currentPageName == "shop-single.php") {
    var product_id = getParameterByName('product');
    if (product_id !== "") {
      update_product_view_counter(product_id)
    }
  } else if (currentPageName == "index.php") {
    observeTarget()
    view_products()
  } else if (currentPageName == "checkout-details.php") {
    load_checkout_address();
    get_order_summary();
  } else if (currentPageName == "checkout-shipping.php") {
    get_order_summary();
  } else if (currentPageName == "account-profile.php") {
    count_wishlist();
    count_orders();
    count_support_ticket();
  }
// get criteria
fetch_criteria();
function fetch_criteria() {
  $.ajax({
      url: './includes/fetch_criteria.php',
      method: "GET",
      dataType: "json",
      success: function(data) {
          // Populate select input with fetched specification details
          var select = $('.compare-criteria');
          select.empty(); // Clear previous options
          select.append($('<option>', {
              value: 'all',
              text: 'Comparison criteria *' // Initial option
          }));
          $.each(data, function(index, criteria) {
              select.append($('<option>', {
                  value: criteria.criteria_name,
                  text: criteria.criteria_name
              }));
          });

          // After populating select input, append it to the display_compare div
          $('#display_compare .compare-criteria').append(select);
      },
      error: function() {
          // Handle error if AJAX request fails
          console.error("Error fetching specification details.");
      }
  });
}
// get compared item
fetch_compare_products();
function fetch_compare_products() {
  $.ajax({
    url: './includes/fetch_compare_products.php',
    method: 'GET',
    dataType: 'html', // Change dataType to 'html' since you're expecting HTML content
    success: function(data) {
      $("#display_compare").append(data);
    }
  });
}


$(document).on("click", ".btn-del-compare", function(e) {
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
              fetch_compare_products();
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
load_checkout_methods();
function load_checkout_methods() {
  $.ajax({
    url: './includes/load_checkout_methods.php',
    method: 'POST',
    dataType: 'json',
    success: function(data) {
      $('#load_shipping_method').append(data);
    }
  });
}
//Updating shipping method data
$(document).on('click', '.shipping-row', function() {
  var radioId = $(this).data('id');
  $('#' + radioId).prop('checked', true);

  // Make an AJAX request to update the database with the selected shipping method
  $.ajax({
      url: './includes/update_shipping_method.php',
      type: 'POST',
      data: {
          shipping_method_id: radioId
      },
      success: function(response) {
          // No need to handle the response since we're not expecting any
          get_order_summary();
      },
      error: function(xhr, status, error) {
          // Handle error response if needed
          toastMixin.fire({
            title: error,
              icon: "error"
          });
      }
  });
});
// Function to fetch the final total amount
function fetchFinalTotal(callback) {
  $.ajax({
      url: './includes/get_order_summary.php',
      method: 'GET',
      dataType: 'json',
      success: function(response) {
          if (response.error) {
              toastMixin.fire({
                  title: 'Error message',
                  text: response.error,
                  icon: 'error'
              });
          } else {
              // Ensure final_total is included in the response
              if (response.final_total) {
                  callback(response.final_total);
              } else {
                  toastMixin.fire({
                      title: 'Error message',
                      text: 'Final total amount is missing from the response.',
                      icon: 'error'
                  });
              }
          }
      },
      error: function(xhr, status, error) {
          toastMixin.fire({
              title: 'Error message',
              text: error,
              icon: 'error'
          });
      }
  });
}

  // check the payment method
  $(document).on("click", "#checkout-review", function(e) {
    e.preventDefault(); // Prevent the default form submission

    // Check if the card section is filled
    let cardNumber = $('input[name="number"]').val();
    let cardName = $('input[name="name"]').val();
    let cardExpiry = $('input[name="expiry"]').val();
    let cardCVC = $('input[name="cvc"]').val();

    // Check if PayStack or Flutterwave is selected
    let payStackSelected = $('#paystack-option').is(':checked');
    let flutterwaveSelected = $('#flutterwave-option').is(':checked');

    // Determine the payment type
    let payType = '';
    if (cardNumber && cardName && cardExpiry && cardCVC) {
        payType = 'card';
    } else if (payStackSelected) {
        payType = 'paystack';
    } else if (flutterwaveSelected) {
        payType = 'flutterwave';
    }

    // Validate that the card details are not empty when 'card' is selected
    if (payType === 'card' && (!cardNumber || !cardName || !cardExpiry || !cardCVC)) {
        toastMixin.fire({
            title: 'Error message',
            text: 'Please fill in all the card details.',
            icon: 'error'
        });
        return; // Exit the function if card details are incomplete
    }

    // Prepare the data for the PHP script
    let data = {
        pay_type: payType,
        card_number: payType === 'card' ? cardNumber : '',
        card_name: payType === 'card' ? cardName : '',
        card_expired_date: payType === 'card' ? cardExpiry : '',
        card_csv: payType === 'card' ? cardCVC : ''
    };

    // Check if a payment method is selected or filled
    if (payType) {
        // Send the data to the PHP script using AJAX
        $.ajax({
            url: './includes/payment_type_process.php',  // Path to your PHP script
            type: 'POST',
            data: data,
            success: function(response) {
                try {
                    let responseData = JSON.parse(response);
                    if (responseData.status === 'success') {
                        window.location.href = './checkout-review.php';
                    } else {
                        toastMixin.fire({
                            title: 'Error message',
                            text: 'Payment processing failed: ' + (responseData.message || 'Unknown error'),
                            icon: 'error'
                        });
                    }
                } catch (e) {
                    toastMixin.fire({
                        title: 'Error message',
                        text: 'Failed to process the server response.',
                        icon: 'error'
                    });
                }
            },
            error: function(xhr, status, error) {
                toastMixin.fire({
                    title: 'Error message',
                    text: 'Payment processing failed: ' + error,
                    icon: 'error'
                });
            }
        });
    } else {
        toastMixin.fire({
            title: 'Error message',
            text: 'Please select a payment method or fill in your card details.',
            icon: 'error'
        });
    }
});
// Event handler for the "pay_to_complete_order" button
$("#pay_to_complete_order").on('click', function(e) {
  e.preventDefault();

  // Fetch checkout details and determine the payment method
  fetchCheckoutDetails().then(function(data) {
      const payType = data.pay_type;

      if (payType === 'card') {
          toastMixin.fire({
              title: 'Error message',
              text: 'Sorry, the card payment cannot be initiated now. Please use another payment gateway instead.',
              icon: 'error'
          });
      } else if (payType === 'paystack') {
          pay_payStack(); // Initiate PayStack payment function
      } else if (payType === 'flutterwave') {
          pay_flutterWave(); // Initiate Flutterwave payment function
      } else {
          toastMixin.fire({
              title: 'Error message',
              text: 'Please select a valid payment method.',
              icon: 'error'
          });
      }
  }).catch(function(error) {
      toastMixin.fire({
          title: 'Error message',
          text: 'Failed to fetch payment details. Please try again.',
          icon: 'error'
      });
  });
});

// Load  payment details
fetchCheckoutDetails();
// Function to fetch checkout details
function fetchCheckoutDetails() {
  return new Promise(function(resolve, reject) {
      $.ajax({
          url: './includes/fetch_checkout_details.php',
          type: 'POST',
          success: function(response) {
              try {
                  const data = JSON.parse(response);

                  if (data && data.pay_type) {
                      // Update HTML with fetched data
                      $('#shipping_user_name').text(data.fullname);
                      $('#shipping_user_address').text(data.address + ', ' + data.state);
                      $('#shipping_user_phone').text(data.phone_number);

                      if (data.pay_type === 'card') {
                          $('#payment_method').html('<li><span class="text-muted">Credit Card:&nbsp;</span>**** **** **** ' + data.card_number_last4 + '</li>');
                      } else {
                          $('#payment_method').html('<li><span class="text-muted">Payment Method:&nbsp;</span>' + data.pay_type + '</li>');
                      }

                      resolve(data);
                  } else {
                      reject('Invalid data format');
                  }
              } catch (e) {
                  console.error('Error parsing JSON response:', e);
                  reject(e);
              }
          },
          error: function(xhr, status, error) {
              console.error('AJAX Error:', error);
              reject(error);
          }
      });
  });
}

function pay_flutterWave() {
  // Implementation for Flutterwave payment
  console.log("Flutterwave payment initiated");
}
// Function to initiate PayStack payment
function pay_payStack() {
  // Fetch user data from load_session.php
  $.ajax({
      url: './includes/load_session.php',
      method: 'GET',
      dataType: 'json',
      success: function(response) {
          if (response.error) {
              toastMixin.fire({
                  title: 'Error message',
                  text: response.error,
                  icon: 'error'
              });
              return;
          }

          var email = response.useremail;
          var userid = response.userid;
          var username = response.username;
          var userphonenumber = response.phone;
          var paymentmethod = "PayStack Gateway";

          // Fetch the final total and proceed with payment
          fetchFinalTotal(function(amount) {
              var handler = PaystackPop.setup({
                  key: 'pk_test_7186664cecd58a0d7264957435bb37a40683a198', // Put your public key here
                  email: email, // Put your customer's email here
                  amount: amount * 100, // Amount in kobo
                  currency: 'NGN',
                  ref: '' + Math.floor((Math.random() * 1000000000) + 1), // Generate random reference number
                  metadata: {
                      custom_fields: [
                          {
                              display_name: "Customer Name",
                              variable_name: "customer_name",
                              value: username
                          },
                          {
                              display_name: "Phone Number",
                              variable_name: "phone_number",
                              value: userphonenumber
                          }
                      ]
                  },
                  callback: function(response) {
                      // Send payment details to your server
                      var paymentData = {
                          email: email,
                          amount: amount, // Convert back to naira
                          reference: response.reference,
                          userid: userid, // Include userid in payment data
                          username: username,
                          paymentmethod: paymentmethod
                      };
                      // Send paymentData to your server using AJAX
                      $.ajax({
                          url: './includes/process_payment.php', // Replace with your server-side script URL
                          method: 'POST',
                          data: paymentData,
                          success: function(data) {
                              // Handle success response from server
                              toastMixin.fire({
                                  title: 'Payment Success',
                                  text: 'Payment Successful! Transaction reference: ' + response.reference,
                                  icon: 'success'
                              });

                              // Wait for 3 seconds before redirecting
                              setTimeout(function() {
                                  window.location.href = './checkout-complete.php';
                              }, 3000);

                              // Disable the PayStack button after successful payment
                              $("#pay_payStack").attr('disabled', true);
                          },
                          error: function(xhr, status, error) {
                              console.error("Error: ", xhr, status, error);
                              toastMixin.fire({
                                  title: 'Error processing payment. Please try again later.',
                                  icon: 'error'
                              });
                          }
                      });
                  },
                  onClose: function() {
                      // Handle closed payment dialog
                      toastMixin.fire({
                          title: 'Payment window closed.',
                          icon: 'warning'
                      });
                  }
              });
              handler.openIframe();
          });
      },
      error: function(xhr, status, error) {
          toastMixin.fire({
              title: 'Error fetching user data. Please try again later.',
              icon: 'error'
          });
      }
  });
}
});