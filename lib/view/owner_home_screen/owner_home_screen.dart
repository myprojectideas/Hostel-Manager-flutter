import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:hostel_management_app/controller/bottomnavbar/bottomnavbar_controller.dart';
import 'package:hostel_management_app/utils/color_constants.dart';
import 'package:hostel_management_app/utils/image_constants.dart';
import 'package:provider/provider.dart';

class OwnerHomeScreen extends StatelessWidget {
  const OwnerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OwnerNavBarController navBarController =
        Provider.of<OwnerNavBarController>(context);
    return Scaffold(
      backgroundColor: ColorConstants.primaryWhiteColor,
      body: Provider.of<OwnerNavBarController>(context).ownerPages[
          Provider.of<OwnerNavBarController>(context).selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: navBarController.selectedIndex,
        onTap: (value) {
          Provider.of<OwnerNavBarController>(context, listen: false)
              .onNavTap(value);
        },
        selectedLabelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: ColorConstants.primaryBlackColor),
        selectedItemColor: ColorConstants.primaryBlackColor,
        unselectedItemColor: ColorConstants.primaryBlackColor,
        unselectedLabelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: ColorConstants.primaryBlackColor),
        unselectedIconTheme:
            IconThemeData(size: 25, color: ColorConstants.primaryBlackColor),
        selectedIconTheme:
            IconThemeData(size: 25, color: ColorConstants.primaryBlackColor),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                navBarController.selectedIndex == 0
                    ? FluentIcons.home_12_filled
                    : FluentIcons.home_12_regular,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                navBarController.selectedIndex == 1
                    ? FluentIcons.door_16_filled
                    : FluentIcons.conference_room_24_regular,
              ),
              label: 'Rooms'),
          BottomNavigationBarItem(
              icon: Icon(
                navBarController.selectedIndex == 2
                    ? FluentIcons.book_contacts_20_filled
                    : FluentIcons.book_contacts_20_regular,
                color: ColorConstants.primaryBlackColor,
                size: 27,
              ),
              label: 'Bookings'),
          BottomNavigationBarItem(
            icon: Icon(
              navBarController.selectedIndex == 3
                  ? FluentIcons.people_12_filled
                  : FluentIcons.people_12_regular,
            ),
            label: 'Residents',
          ),
        ],
      ),
    );
  }
}
