import 'package:flutter/material.dart';

Row _product(
    String _img, double _w, double _h, String _name, String _totalPrice) {
  return Row(
    children: [
      Container(
        alignment: Alignment.topLeft,
        child: Image.asset(_img, width: _w, height: _h),
      ),
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$_name\n',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: '\nTổng tiền: $_totalPrice',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

class BeingTransported extends StatelessWidget {
  const BeingTransported({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            const Divider(),
            const SizedBox(height: 10),
            _product('assets/images/nikeair1.jfif', 150, 150,
                'Air Jordan 1 Mid SE', '64.99'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: Colors.lightBlue,
                    side: const BorderSide(color: Colors.lightBlue),
                  ),
                  onPressed: () {},
                  child: const Text('Xem Chi Tiết'),
                ),
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
