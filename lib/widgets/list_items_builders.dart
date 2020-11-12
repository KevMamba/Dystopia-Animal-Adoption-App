import 'package:dystopia_flutter_app/widgets/disable_multi_touch.dart';
import 'package:dystopia_flutter_app/widgets/platform_widgets.dart';
import 'package:flutter/material.dart';

typedef ItemWidgetBuilder<T> = Widget Function(BuildContext context, T item);

class ListItemsBuilder<T> extends StatelessWidget {
  ListItemsBuilder(
      {Key key, @required this.snapshot, @required this.itemBuilder})
      : super(key: key);
  final AsyncSnapshot<List<T>> snapshot;
  final ItemWidgetBuilder<T> itemBuilder;
  @override
  Widget build(BuildContext context) {
    List<T> items = [];
    if (snapshot.hasData) {
      items = snapshot.data;
      if (items.isNotEmpty) {
        return OnlyOnePointerRecognizerWidget(child: _buildList(items));
      } else {
        return EmptyContent();
      }
    } else if (snapshot.hasError) {
      print(snapshot.error.toString());
      return EmptyContent(
        title: 'Something went wrong!',
        message: 'Cannot load desired items ',
      );
    }
    return SliverFillRemaining(
      child: Center(
        child: PlatFormProgressIndicator(),
      ),
    );
  }

  Widget _buildList(List<T> items) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        height: 0.5,
      ),
      itemBuilder: (context, index) {
        if (index == 0 || index == items.length + 1) {
          return Opacity(opacity: 1);
        }
        return itemBuilder(context, items[index - 1]);
      },
      itemCount: items.length + 2,
    );

    // for ListView.Separated
    //separatorBuilder: (context, index) => Divider(
    //height: 0.5,
    //),
  }
}

class EmptyContent extends StatelessWidget {
  final String title;
  final String message;

  const EmptyContent({Key key, this.title, this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(title),
          Text(message),
        ],
      ),
    );
  }
}
