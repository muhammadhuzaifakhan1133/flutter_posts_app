import 'package:flutter/material.dart';
import 'package:test1/models/user_model.dart';

class ProfileView extends StatelessWidget {
  final UserModel user;
  const ProfileView({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        attributeRow(title: "Name", value: user.name),
        const Divider(),
        attributeRow(title: "Username", value: user.username),
        const Divider(),
        attributeRow(
            title: "Address",
            value:
                "${user.address!.street} ${user.address!.suite} ${user.address!.city}"),
        const Divider(),
        attributeRow(title: "Zipcode", value: user.address!.zipcode),
        const Divider(),
      ],
    );
  }

  attributeRow({
    required String title,
    required String? value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            width: 250,
            child: Text(
              value ?? '-',
              textDirection: TextDirection.rtl,
              style: const TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
