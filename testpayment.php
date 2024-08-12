<?php
$url = "https://api.paystack.co/transaction/initialize";

$fields = [
  'email' => "customer@email.com",
  'amount' => "20000"
];

$fields_string = http_build_query($fields);

//open connection
$ch = curl_init();

//set the url, number of POST vars, POST data
curl_setopt($ch,CURLOPT_URL, $url);
curl_setopt($ch,CURLOPT_POST, true);
curl_setopt($ch,CURLOPT_POSTFIELDS, $fields_string);
curl_setopt($ch, CURLOPT_HTTPHEADER, array(
  "Authorization: Bearer sk_test_8829cfa49a425e119d248f64762e6aad8e04360f",
  "Cache-Control: no-cache",
));

//So that curl_exec returns the contents of the cURL; rather than echoing it
curl_setopt($ch,CURLOPT_RETURNTRANSFER, true); 

//execute post
$result = curl_exec($ch);
// echo $result;
$aa = json_decode($result);
    //   var_dump($aa);

    $redirect = "";
    foreach ($aa->data as $coords => $street) {
      // echo $coords ."=>".$street."<br>";
      if ($coords == "authorization_url") {
        $redirect = $street;
      }
      if ($coords == "reference") {
        $refno = $street;
        // $_SESSION['refno'] = $refno;
      }
    }

    echo $redirect;
    



?>
<script src="https://js.paystack.co/v1/inline.js"></script>
<script>
    function payWithPaystack(e) {
  e.preventDefault();

  let handler = PaystackPop.setup({
    key: 'sk_test_8829cfa49a425e119d248f64762e6aad8e04360f', // Replace with your public key
    email: "muhdmuhd158@gmail.com",
    amount: 2000 * 100,
    ref: ''+Math.floor((Math.random() * 1000000000) + 1), // generates a pseudo-unique reference. Please replace with a reference you generated. Or remove the line entirely so our API will generate one for you
    // label: "Optional string that replaces customer email"
    onClose: function(){
      alert('Window closed.');
    },
    callback: function(response){
      let message = 'Payment complete! Reference: ' + response.reference;
      alert(message);
    }
  });

  handler.openIframe();
}
payWithPaystack()

</script>