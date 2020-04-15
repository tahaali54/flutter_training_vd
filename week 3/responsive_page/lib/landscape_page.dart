import 'package:flutter/material.dart';

class LandscapeViewPage extends StatelessWidget {
  //This page is using constraints received from LayoutBuilder to make page responsive.
  const LandscapeViewPage({
    Key key,
    this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  List<Widget> _buildListView(context) {
    List<Widget> listViewItems = List();
    listViewItems.add(
      Container(
        height: 100,
        color: Theme.of(context).primaryColor,
      ),
    );
    for (int i = 0; i < 6; i++) {
      listViewItems.add(
        ListTile(
          title: Text('List item $i'),
        ),
      );
    }
    return listViewItems;
  }

  @override
  Widget build(BuildContext context) {
    double targetDeviceWidth = 960;
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive UI'),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: ListView(
              children: _buildListView(context),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: (200 / 960) * screenWidth,
                    child: FittedBox(
                      child: CircleAvatar(
                        child: Icon(
                          Icons.person,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: ((300 / targetDeviceWidth) * screenWidth) * 0.2,
                    width: (300 / 960) * screenWidth,
                    color: Theme.of(context).primaryColor,
                    child: FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Venture Dive',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
