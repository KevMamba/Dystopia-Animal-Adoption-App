import 'package:dystopia_flutter_app/screens/list_of_pets.dart';
import 'package:dystopia_flutter_app/widgets/platform_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PetCategory extends StatelessWidget {
  final String image;
  final String name;

  final BuildContext context;
  const PetCategory({
    Key key,
    this.context,
    this.image,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(414, 896),
      allowFontScaling: true,
    );
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 70.w,
        child: Material(
          child: InkWell(
            onTap: () {
              PlatformPageRoute.pageRoute(
                  fullScreen: false,
                  widget: ListScreen(),
                  fromRoot: true,
                  context: context);
            },
            child: IgnorePointer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      )),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Material(
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          name,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                              textStyle: TextStyle(fontSize: 20.w)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
