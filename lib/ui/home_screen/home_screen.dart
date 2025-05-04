import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/data/network/api_provider.dart';
import 'package:ecommerce_app_login/domain/models/photo_model.dart';
import 'package:ecommerce_app_login/services/auth_services.dart';
import 'package:ecommerce_app_login/widgets/app_column.dart';
import 'package:ecommerce_app_login/widgets/appimage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () async {
            AuthService().resetAll();
          },
          child: Text("Home"),
        ),
      ),
      body: AppColumn(
        padding: Space.z,
        children: [
          FutureBuilder<List<PhotosModel>>(
            future: ApiProvider().getPhotos(),
            builder: (
              BuildContext context,
              AsyncSnapshot<List<PhotosModel>> snapshot,
            ) {
              if (snapshot.hasData) {
                if (snapshot.data != null) {
                  var data = snapshot.data ?? [];
                  var trimmedData =
                      data.length > 10 ? data.sublist(0, 10) : data;
                  return SizedBox(
                    height: AppDimensions.height(25),
                    child: PageView.builder(
                      itemBuilder: (context, index) {
                        return AppImage(
                          imageUrl: trimmedData[index].url,
                          fit: BoxFit.cover,
                        );
                      },
                      itemCount: trimmedData.length,
                    ),
                  );
                }
              }
              return SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
