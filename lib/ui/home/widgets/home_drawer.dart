import 'package:flutter/material.dart';
import 'package:test1/ui/home/home_viewmodel.dart';
import 'package:test1/utils/image_constants.dart';
import 'package:test1/widgets/color_constants.dart';

homeDrawer(HomeViewModel viewModel) {
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(child: Image.asset(ImageConstants.logo)),
        const Divider(color: ColorConstants.black, thickness: 1),
        ListTile(
          title: const Text("Logout", style: TextStyle(fontSize: 20)),
          leading: const Icon(Icons.logout),
          onTap: viewModel.logout,
        ),
      ],
    ),
  );
}
