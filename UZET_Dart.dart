// UZET Payment
// UZET Dart
// https://github.com/uzetco/UZET_Dart

// need install http
import 'package:http/http.dart';

// for get payment url and open in browser
var PaymentUrl = "";

Future UZETCreateLink() async {
  // this info's will get on email README.pdf

  var UZET_Url = "";
  var UZET_Email = "";
  var UZET_Key = "";

  // headers
  var headers = {'Content-Type': 'application/x-www-form-urlencoded'};

  var request = http.Request('POST', Uri.parse(UZET_Url));
  request.bodyFields = {
    'email': UZET_Email,
    'Publishable_Key': UZET_Key,
    'Product': 'Name Package',
    'amount': 'Total',
    'callback_url': 'https://yourdomine.com/uzet/callback',
    'customer_email': 'support@uzet.co',
    'billing_street1': '12',
    'billing_city': 'pairs',
    'billing_state': 'AL',
    'billing_country': 'US',
    'billing_postcode': '10000',
    'customer_givenName': 'UZET',
    'customer_surname': 'Payment',
    'customer_phonenumber': '00000000000'
  };
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    // get payment url
    print(await response.stream.bytesToString()['url']);
    print("uzet urr ${response.stream.bytesToString()['url']}");
    PaymentUrl = response.stream.bytesToString()['url'];
  } else {
    print(response.reasonPhrase);
  }
}
