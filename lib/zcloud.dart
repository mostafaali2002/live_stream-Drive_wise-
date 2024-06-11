import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

final String userID = Random().nextInt(10000).toString();
jumpToLivePage(BuildContext context, {required bool isHost}) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LivePage(
            isHost: isHost,
            liveID: '1084918026',
          )));
}

class zcloud extends StatefulWidget {
  const zcloud({super.key});

  @override
  State<zcloud> createState() => _zcloudState();
}

class _zcloudState extends State<zcloud> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey ,

      appBar: AppBar(
        backgroundColor: Color(0xff8E0C19),
        title: Text(
          'Live Stream',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
             style: ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(200, 60)),backgroundColor: MaterialStatePropertyAll(Color(0xff8E0C19))),
                onPressed: () => jumpToLivePage(context, isHost: true),
                child: Text('start a live',style: TextStyle(fontSize: 30),)),
          ],
        ),
      ),
    );
  }
}



class LivePage extends StatelessWidget {
  final String liveID;
  final bool isHost;

  const LivePage({Key? key, required this.liveID, this.isHost = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.amber,
      child: ZegoUIKitPrebuiltLiveStreaming(
          appID:
          1084918026,
          // Fill in the appID that you get from ZEGOCLOUD Admin Console.
          appSign:
          'cef4d7a88b67ce3daa8f2cfeb7b6df1fc869640b9226652cb0ec9a14f7a9d81b',
          // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
          userID: userID,
          userName: 'user_$userID',
          liveID: liveID,
          config: isHost
              ? (ZegoUIKitPrebuiltLiveStreamingConfig.host()
            ..layout = ZegoLayout.gallery(
                showNewScreenSharingViewInFullscreenMode:
                false) //  Set the layout to gallery mode. and configure the [showNewScreenSharingViewInFullscreenMode] and [showScreenSharingFullscreenModeToggleButtonRules].
            ..bottomMenuBar =
            ZegoLiveStreamingBottomMenuBarConfig(hostButtons: [
              ZegoMenuBarButtonName.toggleScreenSharingButton,
              ZegoMenuBarButtonName.toggleMicrophoneButton,
              ZegoMenuBarButtonName.toggleCameraButton,
              ZegoMenuBarButtonName.minimizingButton
            ], height: 150) // Add a screen sharing toggle button.
          )
              : (ZegoUIKitPrebuiltLiveStreamingConfig.audience()
              // Set the layout to gallery mode. and configure the [showNewScreenSharingViewInFullscreenMode] and [showScreenSharingFullscreenModeToggleButtonRules].
              // Add a screen sharing toggle button.
          )),
    );
  }}