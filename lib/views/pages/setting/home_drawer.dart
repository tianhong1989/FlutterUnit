import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_unit/app/router.dart';
import 'package:flutter_unit/app/style/TolyIcon.dart';
import 'package:flutter_unit/blocs/collect/collect_bloc.dart';
import 'package:flutter_unit/blocs/collect/collect_event.dart';
import 'package:flutter_unit/blocs/global/global_bloc.dart';
import 'package:flutter_unit/blocs/global/global_state.dart';
import 'package:flutter_unit/blocs/widgets/home_bloc.dart';
import 'package:flutter_unit/blocs/widgets/home_state.dart';

/// create by 张风捷特烈 on 2020-03-26
/// contact me by email 1981462002@qq.com
/// 说明:

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 3,
      child: _buildChild(context),
    );
  }

  Widget _buildChild(BuildContext context) =>
      BlocBuilder<HomeBloc,HomeState>(
          builder: (_, state) => Container(
                color: state.homeColor.withAlpha(33),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    _buildDrawerHeader(state.homeColor),
                    ListTile(
                      leading: Icon(
                        TolyIcon.icon_them,
                        color: Theme.of(context).primaryColor,
                      ),
                      trailing: _nextIcon(context),
                      title: Text('我的主题'),
                      onTap: () {
                        Navigator.of(context).pushNamed(Router.setting);
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        TolyIcon.icon_star,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Text('我的收藏'),
                      trailing: _nextIcon(context),
                      onTap: () {
                        Navigator.of(context).pushNamed(Router.collect);
                      },
                    ),
                    Divider(
                      height: 1,
                    ),
                    _buildFlutterUnit(context),
                    ListTile(
                      leading: Icon(
                        TolyIcon.icon_code,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Text('Dart 手册'),
                      trailing: _nextIcon(context),
                      onTap: () {},
                    ),
                    Divider(
                      height: 1,
                    ),
                    ListTile(
                      leading: Icon(
                        TolyIcon.icon_layout,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Text('数据统计'),
                      trailing: _nextIcon(context),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.info,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Text('关于应用'),
                      trailing: _nextIcon(context),
                      onTap: () => Navigator.of(context).pushNamed(Router.about_app),
                    ),
                    ListTile(
                      leading: Icon(
                        TolyIcon.icon_kafei,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Text('联系本王'),
                      trailing: _nextIcon(context),
                      onTap: () => Navigator.of(context).pushNamed(Router.about_me),
                    ),
                  ],
                ),
              ));

  Widget _buildFlutterUnit(BuildContext context) => ExpansionTile(
        backgroundColor: Colors.white70,
        leading: Icon(
          Icons.extension,
          color: Theme.of(context).primaryColor,
        ),
        title: Text('Flutter 集录'),
        children: <Widget>[
          ListTile(
            leading: Icon(
              TolyIcon.icon_tag,
              color: Theme.of(context).primaryColor,
            ),
            title: Text('属性集录'),
            trailing: _nextIcon(context),
            onTap: () {
              Navigator.of(context).pushNamed(Router.attr);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.palette,
              color: Theme.of(context).primaryColor,
            ),
            title: Text('绘画集录'),
            trailing: _nextIcon(context),
            onTap: () => Navigator.of(context).pushNamed(Router.paint),
          ),
          ListTile(
            leading: Icon(
              Icons.widgets,
              color: Theme.of(context).primaryColor,
            ),
            title: Text('布局集录'),
            trailing: _nextIcon(context),
            onTap: () {
              Navigator.of(context).pushNamed(Router.layout);
            },
          ),
          ListTile(
            leading: Icon(
              TolyIcon.icon_bug,
              color: Theme.of(context).primaryColor,
            ),
            trailing: _nextIcon(context),
            title: Text('bug/feature 集录'),
            onTap: () {
              Navigator.of(context).pushNamed(Router.bug);
            },
          ),
        ],
      );

  Widget _buildDrawerHeader(Color color) => DrawerHeader(
        padding: EdgeInsets.only(top: 10, left: 15),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/wy_300x200_filter.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Wrap(
              spacing: 10,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                FlutterLogo(
                  colors: Colors.orange,
                  size: 35,
                ),
                Text(
                  'Flutter Unit',
                  style: TextStyle(fontSize: 24, color: Colors.white, shadows: [
                    Shadow(
                        color: Colors.black,
                        offset: Offset(1, 1),
                        blurRadius: 3)
                  ]),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'The Unity Of Flutter, The Unity Of Coder.',
              style: TextStyle(fontSize: 15, color: Colors.white, shadows: [
                Shadow(
                    color: color, offset: Offset(.5, .5), blurRadius: 1)
              ]),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Flutter的联合，编程者的联合。',
              style: TextStyle(fontSize: 15, color: Colors.white, shadows: [
                Shadow(
                    color: color, offset: Offset(.5, .5), blurRadius: 1)
              ]),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Spacer(
                  flex: 5,
                ),
                Text(
                  '—— 张风捷特烈',
                  style: TextStyle(fontSize: 15, color: Colors.white, shadows: [
                    Shadow(
                        color: Colors.orangeAccent,
                        offset: Offset(.5, .5),
                        blurRadius: 1)
                  ]),
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
          ],
        ),
      );

  Widget _nextIcon(BuildContext context) =>
      Icon(Icons.chevron_right, color: Theme.of(context).primaryColor);
}
