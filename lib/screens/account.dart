import 'package:dystopia_flutter_app/widgets/account_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../theme.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(414, 896), allowFontScaling: true);
    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: kSpacingUnit.w * 10,
            width: kSpacingUnit.w * 10,
            margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: kSpacingUnit.w * 5,
                  backgroundImage: AssetImage('assets/images/user.png'),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: kSpacingUnit.w * 2.5,
                    width: kSpacingUnit.w * 2.5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      heightFactor: kSpacingUnit.w * 1.5,
                      widthFactor: kSpacingUnit.w * 1.5,
                      child: Icon(
                        LineAwesomeIcons.pen,
                        color: kDarkPrimaryColor,
                        size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 2),
          Text(
            'XYZ',
            style: kTitleTextStyle,
          ),
          SizedBox(height: kSpacingUnit.w * 0.5),
          Text(
            'XYZ@gmail.com',
            style: kCaptionTextStyle,
          ),
        ],
      ),
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: kSpacingUnit.w * 3),
        profileInfo,
        SizedBox(width: kSpacingUnit.w * 3),
      ],
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: kSpacingUnit.w * 5),
            header,
            Expanded(
              child: ListView(
                children: <Widget>[
                  ProfileListItem(
                    icon: LineAwesomeIcons.user_shield,
                    text: 'Privacy',
                  ),
                  ProfileListItem(
                    icon: LineAwesomeIcons.history,
                    text: 'History',
                  ),
                  ProfileListItem(
                    icon: LineAwesomeIcons.question_circle,
                    text: 'Help & Support',
                  ),
                  ProfileListItem(
                    icon: LineAwesomeIcons.cog,
                    text: 'Settings',
                  ),
                  ProfileListItem(
                    icon: LineAwesomeIcons.user_plus,
                    text: 'Invite a Friend',
                  ),
                  ProfileListItem(
                    icon: LineAwesomeIcons.alternate_sign_out,
                    text: 'Logout',
                    hasNavigation: false,
                  ),
                  ProfileListItem(
                    icon: LineAwesomeIcons.money_check,
                    text: 'Donate',
                    hasNavigation: false,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
