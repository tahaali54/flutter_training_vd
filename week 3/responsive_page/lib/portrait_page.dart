import 'package:flutter/material.dart';

class PortraitViewPage extends StatelessWidget {
  //This page is using MediaQuerry to make page responsive.
  const PortraitViewPage({
    Key key,
  }) : super(key: key);

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
    return Scaffold(
        appBar: AppBar(
          title: Text('Responsive UI'),
        ),
        drawer: Drawer(
          child: ListView(
            children: _buildListView(context),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
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
                  height: (MediaQuery.of(context).size.width / 2) * 0.2,
                  width: (MediaQuery.of(context).size.width / 2),
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
              ),
            ],
          ),
        ));
  }
}
