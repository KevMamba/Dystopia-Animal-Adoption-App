import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dystopia_flutter_app/widgets/helper_buttons.dart';

final myTitle = TextStyle(
  color: Colors.black,
  fontSize: 18.0,
  fontFamily: 'OpenSans',
);

final mySubTitle = TextStyle(
  color: Colors.grey,
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

  Widget _buildFilterBoxes(List<String> filters, BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(5),
      itemBuilder: (context, index) {
        return FilterCategory(filters[index], true);
      },
      itemCount: filters.length,
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        leadingWidth: 0,
        leading: Opacity(
          opacity: 0,
        ),
        centerTitle: false,
        title: Text(
          "Filters",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.close_rounded),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(left: 20.w, top: 30.h),
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
                    activeColor: Theme.of(context).colorScheme.secondaryVariant,
                    inactiveColor: Theme.of(context).colorScheme.primaryVariant,
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
      bottomSheet: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          height: 80.h,
          color: Theme.of(context).colorScheme.surface,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: Text(
                  "Reset",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                onTap: () {
                  setState(() {
                    _currentRangeValues = RangeValues(0, 0);
                  });
                },
              ),
              GestureDetector(
                child: Text(
                  "Apply",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          )),
    );
  }
}
