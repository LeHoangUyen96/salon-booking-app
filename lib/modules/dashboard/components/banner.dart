import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:salon_booking_app/constants/main_constants.dart';
import 'package:salon_booking_app/modules/dashboard/constants/banner_list.dart';

class DisplayBanner extends StatefulWidget {
  @override
  _DisplayBannerState createState() => _DisplayBannerState();
}

class _DisplayBannerState extends State<DisplayBanner> {
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (int index, CarouselPageChangedReason reason) {},
            autoPlayCurve: Curves.easeInOutQuad,
            initialPage: 0,
            enlargeCenterPage: false,
            autoPlay: false,
            pageSnapping: true,
            viewportFraction: 1,
            reverse: false,
            aspectRatio: 2.15,
            enableInfiniteScroll: true,
            autoPlayInterval: Duration(seconds: 3),
            pauseAutoPlayInFiniteScroll: false,
            autoPlayAnimationDuration: Duration(seconds: 2),
          ),
          carouselController: carouselController,
          items: bannerList.map((banner) {
            return HairBanner(
              discount: banner['discount'],
              image: banner['image'],
              nextRoute: 'my_offers',
              title: banner['title'],
            );
          }).toList(),
        ),
      ],
    );
  }
}

class HairBanner extends StatefulWidget {
  final String image;
  final String title;
  final int discount;
  final String nextRoute;

  const HairBanner(
      {Key key, this.title, this.discount, this.nextRoute, this.image})
      : super(key: key);

  @override
  _HairBannerState createState() => _HairBannerState();
}

class _HairBannerState extends State<HairBanner> {
  void nextPage() {
    Navigator.of(context).pushNamed(
      widget.nextRoute,
      arguments: {
        'image': widget.image,
        'title': widget.title,
        'discount': widget.discount,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 20;
    return GestureDetector(
      onTap: () => nextPage(),
      child: Container(
        width: width,
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(MainConstant.grey),
              blurRadius: 5,
              offset: Offset(1, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(widget.image),
            fit: BoxFit.fitWidth,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.8),
              BlendMode.darken,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width / 2,
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 20,
                  color: Color(MainConstant.white),
                  height: 1,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => nextPage(),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                decoration: BoxDecoration(
                  color: Color(MainConstant.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'GET UPTO ${widget.discount}% OFF',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
