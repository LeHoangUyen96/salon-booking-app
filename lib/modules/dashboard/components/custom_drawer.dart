import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:salon_booking_app/constants/main_constants.dart';
import 'package:salon_booking_app/modules/auth/redux/reducer.dart';
import 'package:salon_booking_app/modules/dashboard/constants/drawer.dart';
import 'package:salon_booking_app/redux/IStore.dart';
import 'package:redux/redux.dart';
import 'package:salon_booking_app/redux/store.dart';

class ViewModel extends Equatable {
  final String fullName;
  final String image;
  final String email;
  ViewModel({
    this.fullName,
    this.image,
    this.email,
  });
  @override
  List<Object> get props => [
        fullName,
        image,
        email,
      ];
}

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  Future<void> onInit(Store<AppState> store) async {}
  ViewModel converter(Store<AppState> store) {
    return ViewModel(
      fullName: store?.state?.userInfo?.fullName,
      email: store?.state?.userInfo?.email,
      image: store?.state?.userInfo?.image,
    );
  }

  void onTap(String nextRoute, BuildContext context) async {
    if (nextRoute == 'logout') {
      await store.dispatch(logoutAction(context));
      return;
    }
    Navigator.of(context)
      ..pop()
      ..pushNamed(nextRoute);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return StoreConnector<AppState, ViewModel>(
        onInit: (Store<AppState> store) async => await onInit(store),
        converter: (Store<AppState> store) => converter(store),
        builder: (context, viewModel) {
          return Container(
            width: screenWidth * 2 / 3,
            child: Drawer(
              child: Column(
                children: [
                  Container(
                    height: 80,
                    padding: EdgeInsets.only(top: 15),
                    alignment: Alignment.center,
                    width: screenWidth,
                    color: Color(MainConstant.black),
                    child: Image.asset(
                      'assets/images/white-logo.png',
                      height: 80,
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('profile');
                      },
                      child: Container(
                        width: screenWidth,
                        color: Color(MainConstant.lightBlack),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: [
                            SizedBox(width: 10.0),
                            CircleAvatar(
                              radius: 24.0,
                              backgroundImage: AssetImage(viewModel.image),
                            ),
                            Container(width: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  viewModel.fullName,
                                  style: TextStyle(
                                    color: Color(
                                      MainConstant.white,
                                    ),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                Container(
                                  height: 5,
                                ),
                                Text(
                                  viewModel.email,
                                  style: TextStyle(
                                    color: Color(
                                      MainConstant.white,
                                    ),
                                    fontWeight: FontWeight.w100,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: drawer.length,
                      itemBuilder: (context, index) {
                        final row = drawer[index];

                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () => onTap(row['nextRoute'], context),
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 20, bottom: 8, left: 20),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      row['icon'],
                                      width: 20,
                                      height: 20,
                                    ),
                                    Container(
                                      width: 15,
                                    ),
                                    Text(
                                      row['title'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            (index != drawer.length - 1)
                                ? Container(
                                    width: screenWidth * 2 / 3 - 25,
                                    height: 1,
                                    color: Color(MainConstant.grey),
                                  )
                                : Container(),
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
