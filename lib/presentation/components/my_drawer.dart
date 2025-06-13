import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: MediaQuery.of(context).size.width * 0.7,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Row(
              spacing: 30,
              children: [
                Material(
                  color: Colors.transparent,
                  shape: CircleBorder(),

                  child: Image.asset('assets/images/user.png'),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good morning',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      'Mark Novak',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
            TextButton(
              onPressed: () {},
              child: Text(
                'Payment History',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Ride History',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '2',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Invite Friends',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Promo Codes',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Support',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            Spacer(),
            Divider(
              color: Colors.grey.withValues(alpha: 0.2),
              thickness: 1,
            ),

            Text(
              'Do More',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: Text(
                'Get Food Delivery',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black26,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Make Money Driving',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black26,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Rate Us',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black26,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
