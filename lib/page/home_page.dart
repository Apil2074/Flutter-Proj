import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thiss/Carousel_page.dart';
import 'package:thiss/provider/google_sign_in.dart';
// import 'package:thiss/widget/background_painter.dart';
// import 'package:thiss/widget/logged_in_widget.dart';
import 'package:thiss/widget/sign_up_widget.dart';
import 'package:provider/provider.dart';

class HomeePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        // appBar: AppBar()
        body: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final provider = Provider.of<GoogleSignInProvider>(context);

              if (provider.isSigningIn) {
                return buildLoading();
              } else if (snapshot.hasData) {
                return CarouselPage();
              } else {
                return SignUpWidget();
              }
            },
          ),
        ),
      );

  Widget buildLoading() => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // CustomPaint(painter: BackgroundPainter()),
              Text("Please Wait!! You are being Logged In"),
              Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      );
}
