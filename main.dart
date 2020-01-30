import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lorem_cutesum/lorem_cutesum.dart';
import 'package:flash/flash.dart';

void main() {
  runApp(AppBuilder());
}

class AppBuilder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppBuilderState();
  }
}

class _AppBuilderState extends State<AppBuilder> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.red, accentColor: Colors.red),
      title: "Seks",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Seks'),
        ),
        body: RefreshIndicator(
          onRefresh: _refreshLocalGallery,
          backgroundColor: Colors.white,
          child: ListView.builder(
            itemCount: 50,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 2,
                margin: EdgeInsets.all(20.0),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20)),
                ),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Container(
                        child: Image.network(
                          Cutesum.randomImageUrl(),
                          alignment: Alignment.centerLeft,
                          fit: BoxFit.cover,
                          width: 150,
                          height: 250,
                        ),
                      ),
                      title: Text('Hello $index'),
                      subtitle: Text.rich(
                        TextSpan(
                          text: "$index --> ",
                          children: <TextSpan>[
                            TextSpan(
                                text: "${Cutesum.loremCutesum()}",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: "<==}",
                                style:
                                    TextStyle(fontWeight: FontWeight.normal)),
                          ],
                        ),
                      ),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        OutlineButton(
                          onPressed: () {
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'My index is $index',
                                  style: TextStyle(color: Colors.white),
                                ),
                                duration: Duration(milliseconds: 600),
                                backgroundColor: Colors.red,
                                action: SnackBarAction(
                                  label: "Undo",
                                  textColor: Colors.white,
                                  onPressed: () {
                                    Scaffold.of(context)
                                        .removeCurrentSnackBar();
                                  },
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Text('No'),
                        ),
                        FlatButton(
                          color: Colors.red,
                          child: Text('Yes'),
                          onPressed: () {
                            showFlash(
                              context: context,
                              duration: Duration(milliseconds: 2000),
                              builder: (_, FlashController controller) {
                                return Flash(
                                  backgroundColor: Colors.red,
                                  margin: EdgeInsets.all(10),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                  controller: controller,
                                  child: FlashBar(
                                    padding: EdgeInsets.all(20),
                                    icon: Icon(
                                      Icons.build,
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                    title: Text("Title $index",
                                        style: TextStyle(color: Colors.white)),
                                    message: Text("Message $index",
                                        style: TextStyle(color: Colors.white)),
                                    primaryAction: FlatButton(
                                      child: Text(
                                        'Close',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () => controller.dismiss(),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<Null> _refreshLocalGallery() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
    return null;
  }
}
