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

  RangeValues _currentRangeValues = const RangeValues(0, 100);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(414, 896),
      allowFontScaling: true,
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(), child: Icon(Icons.close)),
        title: Text(
          "Filters",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: Divider(
            thickness: 2,
          ),
        ),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 25.w,
                  vertical: 25.h,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildFilterHeading("Breed"),
                    SizedBox(
                      height: 10.h,
                    ),
                    _buildFilterBoxes(
                        ["Golden Retriever", "Pug", "Beagle"], context),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: SizedBox(
                        height: 20.h,
                        child: Divider(),
                      ),
                    ),
                    _buildFilterHeading("Age"),
                    SizedBox(
                      height: 10.h,
                    ),
                    RangeSlider(
                      values: _currentRangeValues,
                      min: 0,
                      max: 100,
                      divisions: 5,
                      activeColor:
                          Theme.of(context).colorScheme.secondaryVariant,
                      inactiveColor:
                          Theme.of(context).colorScheme.primaryVariant,
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
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: SizedBox(
                        height: 20.h,
                        child: Divider(),
                      ),
                    ),
                    _buildFilterHeading("Gender"),
                    SizedBox(
                      height: 10.h,
                    ),
                    _buildFilterBoxes(["Male", "Female"], context),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: SizedBox(
                        height: 20.h,
                        child: Divider(),
                      ),
                    ),
                    _buildFilterHeading("Gets along with"),
                    SizedBox(
                      height: 10.h,
                    ),
                    _buildFilterBoxes(["Dogs", "Cats", "Birds"], context),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: SizedBox(
                        height: 20.h,
                        child: Divider(),
                      ),
                    ),
                    _buildFilterHeading("Nature"),
                    SizedBox(
                      height: 10.h,
                    ),
                    _buildFilterBoxes(["Playful", "Shy", "Naughty"], context),
                    SizedBox(
                      height: 50.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border(
            top: BorderSide(
              color: Theme.of(context).dividerColor,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        height: 80.h,
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
        ),
      ),
    );
  }
}
