import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:github_flutter/http/api.dart';
import 'package:github_flutter/http/response_data.dart';
import 'package:github_flutter/models/event_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  EasyRefreshController _refreshController;
  int _count = 20;

  @override
  void initState() {
    super.initState();
    _refreshController = EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return EasyRefresh.custom(
      enableControlFinishRefresh: false,
      enableControlFinishLoad: true,
      controller: _refreshController,
      header: ClassicalHeader(),
      footer: ClassicalFooter(),
      onRefresh: () async {
        ResponseData<EventModel> eventsResponse =
            await Api.fetchReceivedEvents('sunfusheng', 1, 20);

        await Future.delayed(Duration(seconds: 2), () {
          print('onRefresh');
          setState(() {
            _count = 20;
          });
          _refreshController.resetLoadState();
        });
      },
      onLoad: () async {
        await Future.delayed(Duration(seconds: 2), () {
          print('onLoad');
          setState(() {
            _count += 10;
          });
          _refreshController.finishLoad(noMore: _count >= 40);
        });
      },
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                width: 60.0,
                height: 60.0,
                child: Center(
                  child: Text('$index'),
                ),
                color: index % 2 == 0 ? Colors.grey[300] : Colors.transparent,
              );
            },
            childCount: _count,
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}
