import 'package:doan/screens/trangchinh/home_screen.dart';
import 'package:flutter/material.dart';

class Pay extends StatelessWidget {
  static String routeName = "/Paysuccess";
  const Pay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 130,
            ),
            Text(
              'Đặt hàng thành công',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text('Continue', style: TextStyle(fontSize: 18)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.purple.withOpacity(0.8)),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.fromLTRB(30, 30, 30, 30)),
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, HomeScreen.routeName),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
