import 'package:flutter/material.dart';
import 'call.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new IndexState();
  }
}

class IndexState extends State<IndexPage> {
  final _channelController = TextEditingController();

  bool _validateError = false;
  bool _video = true;
  bool _audio = true;
  bool _screen = false;
  String _profile = "480p";
  final String _appId = "<Your AppId>";

  final _widthController = TextEditingController();
  final _heightController = TextEditingController();
  final _frameRateController = TextEditingController();

  String _codec = "h264";
  String _mode = "live";

  @override
  void dispose() {
    // dispose input controller
    _channelController.dispose();
    _widthController.dispose();
    _heightController.dispose();
    _frameRateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Agora&Flutter'),
      ),
      body: Center(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            // height: 400,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 50),
                      child: Text(
                        "Agora",
                        style: TextStyle(
                          fontSize: 74.0,
                          fontWeight: FontWeight.w900,
                          // fontFamily: "Georgia",
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    TextField(
                      controller: _channelController,
                      decoration: InputDecoration(
                          errorText: _validateError
                              ? "Channel name is mandatory"
                              : null,
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(width: 1)),
                          hintText: 'Channel name'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: RaisedButton(
                              onPressed: () => onJoin(),
                              child: Text("Join"),
                              color: Colors.blueAccent,
                              textColor: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            CheckboxListTile(
                                title: Text("video"),
                                value: _video,
                                activeColor: Colors.blue, //选中时的颜色
                                onChanged: (value) {
                                  setState(() {
                                    _video = value;
                                  });
                                },
                                controlAffinity:
                                    ListTileControlAffinity.leading),
                            CheckboxListTile(
                                title: Text("audio"),
                                value: _audio,
                                activeColor: Colors.blue, //选中时的颜色
                                onChanged: (value) {
                                  setState(() {
                                    _audio = value;
                                  });
                                },
                                controlAffinity:
                                    ListTileControlAffinity.leading),
                            // CheckboxListTile(
                            //     title: Text("screen"),
                            //     value: _screen,
                            //     activeColor: Colors.blue, //选中时的颜色
                            //     onChanged: (value) {
                            //       setState(() {
                            //         _screen = value;
                            //       });
                            //     },
                            //     controlAffinity:
                            //         ListTileControlAffinity.leading)
                          ],
                        ),
                      ),
                      Expanded(
                          child: Column(children: <Widget>[
                        RadioListTile(
                          title: const Text('240p'),
                          value: "240p",
                          groupValue: _profile,
                          onChanged: (String value) {
                            setState(() {
                              _profile = value;
                            });
                          },
                        ),
                        RadioListTile(
                          title: const Text('360p'),
                          value: "360p",
                          groupValue: _profile,
                          onChanged: (String value) {
                            setState(() {
                              _profile = value;
                            });
                          },
                        ),
                        RadioListTile(
                          title: const Text('480p'),
                          value: "480p",
                          groupValue: _profile,
                          onChanged: (String value) {
                            setState(() {
                              _profile = value;
                            });
                          },
                        ),
                        RadioListTile(
                          title: const Text('720p'),
                          value: "720p",
                          groupValue: _profile,
                          onChanged: (String value) {
                            setState(() {
                              _profile = value;
                            });
                          },
                        ),
                      ])),
                    ],
                  ),
                ),
              ],
            )),
      ),
      drawer: Drawer(
          child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
            child: Text(
              "Setting",
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: TextField(
                          controller: _widthController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: 'Width', labelText: "width"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: TextField(
                          controller: _heightController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: 'Height', labelText: "height"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: TextField(
                          controller: _frameRateController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: 'FrameRate', labelText: "FrameRate"),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    RadioListTile(
                      title: Text("h264"),
                      value: "h264",
                      groupValue: _codec,
                      onChanged: (String value) {
                        setState(() {
                          _codec = value;
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("vp8"),
                      value: "vp8",
                      groupValue: _codec,
                      onChanged: (String value) {
                        setState(() {
                          _codec = value;
                        });
                      },
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    RadioListTile(
                      title: Text("live"),
                      value: "live",
                      groupValue: _mode,
                      onChanged: (String value) {
                        setState(() {
                          _mode = value;
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("rtc"),
                      value: "rtc",
                      groupValue: _mode,
                      onChanged: (String value) {
                        setState(() {
                          _mode = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      )),
    );
  }

  onJoin() {
    setState(() {
      _channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });

    if (_channelController.text.isNotEmpty) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => new CallPage(
                    appId: _appId,
                    channel: _channelController.text,
                    video: _video,
                    audio: _audio,
                    screen: _screen,
                    profile: _profile,
                    width: _widthController.text,
                    height: _heightController.text,
                    framerate: _frameRateController.text,
                    codec: _codec,
                    mode: _mode,
                  )));
    }
  }
}
