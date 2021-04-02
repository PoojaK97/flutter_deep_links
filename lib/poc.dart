import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import 'bloc.dart';

class PocWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DeepLinkBloc _bloc = Provider.of<DeepLinkBloc>(context);
    return StreamBuilder<String>(
      stream: _bloc.state,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
              child: FlatButton(
            color: Colors.amber,
            onPressed: () => Share.share('poc://deeplink.flutter.dev'),
            child: Text('Share'),
          ));
        } else {
          return Container(
              child: Center(
                  child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text('Redirected: ${snapshot.data}',
                          style: Theme.of(context).textTheme.title))));
        }
      },
    );
  }
}
