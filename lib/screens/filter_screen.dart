import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dystopia_flutter_app/widgets/helper_buttons.dart';

final myTitle = TextStyle(
  color: Colors.white70,
  fontSize: 18.0,
  fontFamily: 'OpenSans',
);

final mySubTitle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 16.0,
  fontFamily: 'OpenSans',
);

class FilterScreen extends StatefulWidget {
  @override
  State createState() => new FilterScreenState();
}

class FilterScreenState extends State<FilterScreen> {
  Text _buildFilterHeading(String heading) {
    return Text(
      heading,
      style: myTitle,
      textAlign: TextAlign.left,
    );
  }

  Container _buildFilterBoxes(List<String> filters, BuildContext context) {
    return Container(
      height: 120.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: new ScrollController(),
        padding: EdgeInsets.all(5),
        itemBuilder: (context, index) {
          return FilterCategory(filters[index], true);
        },
        itemCount: filters.length,
      ),
    );
  }

  RangeValues _currentRangeValues = const RangeValues(40, 80);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(414, 896),
      allowFontScaling: true,
    );
    return Scaffold(
      backgroundColor: Color(0xFFb9815d),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Filters',
            style: TextStyle(fontSize: 18.0, color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildFilterHeading("Breed"),
                  _buildFilterBoxes(
                      ["Golden Retriever", "Pug", "Beagle"], context),
                  SizedBox(height: 20.h),
                  _buildFilterHeading("Age"),
                  RangeSlider(
                    values: _currentRangeValues,
                    min: 0,
                    max: 100,
                    divisions: 5,
                    labels: RangeLabels(
                      _currentRangeValues.start.round().toString(),
                      _currentRangeValues.end.round().toString(),
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _currentRangeValues = values;
                      });
                    },
                  ),
                  SizedBox(height: 20.h),
                  _buildFilterHeading("Gender"),
                  _buildFilterBoxes(["Male", "Female"], context),
                  SizedBox(height: 20.h),
                  _buildFilterHeading("Gets along with"),
                  _buildFilterBoxes(["Dogs", "Cats", "Birds"], context),
                  SizedBox(height: 20.h),
                  _buildFilterHeading("Nature"),
                  _buildFilterBoxes(["Playful", "Shy", "Naughty"], context),
                  SizedBox(height: 70.h),
                ],
              ))),
      bottomSheet: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
              height: 80.h,
              color: Colors.white,
              child: Center(
                  child: Text("APPLY",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ))))),
    );
  }
}
