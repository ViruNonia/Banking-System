// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
//
// class PaymentScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Payment'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             _pay();
//           },
//           child: Text('Pay Now'),
//         ),
//       ),
//     );
//   }
//
//   Future<void> _pay() async {
//     try {
//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: 'YOUR_PAYMENT_INTENT_CLIENT_SECRET',
//           applePay: true,
//           googlePay: true,
//           style: ThemeMode.light,
//           merchantDisplayName: 'Your Merchant Name',
//         ),
//       );
//       await Stripe.instance.presentPaymentSheet();
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
// }
