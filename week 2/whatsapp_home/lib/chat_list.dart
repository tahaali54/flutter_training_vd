import 'package:flutter/material.dart';

final _chatData = List<Map<String, Object>>.generate(10, (int index) {
  return {
    'avatar': Icon(Icons.person),
    'name': 'Contact $index',
    'lastMessage': 'hi there',
    'lastSeen': '2:53 am',
  };
});

class ChatItem {
  final Icon avatar;
  final String name;
  final String lastMessage;
  final String lastSeen;

  ChatItem.fromData(data)
      : this.avatar = data['avatar'],
        this.name = data['name'],
        this.lastMessage = data['lastMessage'],
        this.lastSeen = data['lastSeen'];
}

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemCount: _chatData.length,
      itemBuilder: (BuildContext context, int index) {
        final chatItem = ChatItem.fromData(_chatData[index]);
        final avatarRadius = 25.0;

        return ListTile(
          leading: CircleAvatar(
            radius: avatarRadius,
            child: chatItem.avatar,
          ),
          title: Text(
            chatItem.name,
            style: Theme.of(context).textTheme.subhead,
          ),
          subtitle: Text(
            chatItem.lastMessage,
            style: TextStyle(
              color: Theme.of(context).textTheme.caption.color,
            ),
          ),
          trailing: Text(
            chatItem.lastSeen,
            style: TextStyle(color: Colors.green),
          ),
        );
      },
    );
  }
}
