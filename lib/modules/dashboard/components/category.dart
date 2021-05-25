import 'package:flutter/material.dart';
import 'package:salon_booking_app/constants/main_constants.dart';
import 'package:salon_booking_app/modules/dashboard/constants/services.dart';

class DisplayCategories extends StatefulWidget {
  @override
  _DisplayCategoriesState createState() => _DisplayCategoriesState();
}

class _DisplayCategoriesState extends State<DisplayCategories> {
  List<Widget> buildChildren(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double width = (screenWidth - 20 - 3 * 5) / 4;
    List<Widget> list = <Widget>[];
    for (var i = 0; i < 8; i++) {
      if (i == 7) {
        list.add(Container(
          padding: EdgeInsets.symmetric(vertical: 2.5),
          child: CategoryLogo(
            isShowOnlyTitle: true,
            title: 'MORE...',
            width: width,
          ),
        ));
        break;
      }
      list.add(Container(
        padding: EdgeInsets.symmetric(vertical: 2.5),
        child: CategoryLogo(
          image: categories[i].image,
          isShowOnlyTitle: false,
          title: categories[i].name,
          width: width,
          routeName: 'appointment',
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      alignment: WrapAlignment.start,
      children: buildChildren(context),
    );
  }
}

class CategoryLogo extends StatelessWidget {
  final String image;
  final double width;
  final String title;
  final bool isShowOnlyTitle;
  final String routeName;

  const CategoryLogo({
    Key key,
    this.image,
    this.title,
    this.width,
    this.isShowOnlyTitle = false,
    this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isShowOnlyTitle) {
      return Container(
        width: width,
        height: width * 4 / 5,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(MainConstant.black).withOpacity(0.9),
        ),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(color: Color(MainConstant.white)),
        ),
      );
    }
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, routeName, arguments: title),
      child: Stack(
        children: [
          Container(
            width: width,
            height: width * 4 / 5,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(211, 223, 234, 0.9),
                  blurRadius: 16,
                  offset: Offset(1, 4),
                ),
              ],
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 5,
            child: Text(
              title,
              style: TextStyle(color: Color(MainConstant.white), fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
