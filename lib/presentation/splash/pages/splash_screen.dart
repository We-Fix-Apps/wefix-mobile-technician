import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../../injection_container.dart';
import '../controller/splash_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => sl<SplashProvider>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<SplashProvider>(
          builder: (context, value, child) {
            return Center(
              child:
                  value.controller.value.isInitialized
                      ? AspectRatio(aspectRatio: value.controller.value.aspectRatio, child: VideoPlayer(value.controller))
                      : const CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
