import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/configs/space_ext.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/data/network/api_provider.dart';
import 'package:ecommerce_app_login/domain/models/event_users.dart';
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
          //  FutureBuilder<List<PhotosModel>>(
          //   future: ApiProvider().getPhotos(),
          //   builder: (
          //     BuildContext context,
          //     AsyncSnapshot<List<PhotosModel>> snapshot,
          //   ) {
          //     if (snapshot.hasData) {
          //       if (snapshot.data != null) {
          //         var data = snapshot.data ?? [];
          //         var trimmedData =
          //             data.length > 10 ? data.sublist(0, 10) : data;
          //         return SizedBox(
          //           height: AppDimensions.height(25),
          //           child: PageView.builder(
          //             itemBuilder: (context, index) {
          //               return AppImage(
          //                 imageUrl: trimmedData[index].url,
          //                 fit: BoxFit.cover,
          //               );
          //             },
          //             itemCount: trimmedData.length,
          //           ),
          //         );
          //       }
          //     }
          Padding(
            padding: Space.all(1, 0.5),
            child: Text(
              "Event Name",
              style: AppText.b1!.w(6).cl(AppColors.grey900),
            ),
          ),
          Padding(
            padding: Space.hf(1).b(1),
            child: Text(
              "56 O'Mally Road, ST LEONARDS, 2065, NSW",
              style: AppText.b3!.w(4).cl(AppColors.grey500).notoSans(),
            ),
          ),

          FutureBuilder<List<EventUsersModel>>(
            future: ApiProvider().getEventUsers(),
            builder: (
              BuildContext context,
              AsyncSnapshot<List<EventUsersModel>> snapshot,
            ) {
              if (snapshot.hasData) {
                if (snapshot.data != null) {
                  return ListView.separated(
                    padding: Space.all(1, 0),
                    separatorBuilder: (context, index) {
                      return Divider(color: AppColors.grey100);
                    },

                    itemCount: snapshot.data!.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var data = snapshot.data![index];
                      return Row(
                        children: [
                          AppImage(
                            imageUrl:
                                'https://ui-avatars.com/api/?name=John+Doe',
                            size: AppDimensions.font(20),
                          ),

                          Space.x1!,
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                text: data.name,
                                children: [
                                  TextSpan(
                                    text: "\n${data.email}",
                                    style: AppText.l1!
                                        .w(4)
                                        .notoSans()
                                        .cl(AppColors.grey500),
                                  ),
                                ],
                                style: AppText.b3!
                                    .w(4)
                                    .notoSans()
                                    .cl(AppColors.grey900),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: AppImage(
                              imageUrl: Assets.messageIcon,
                              size: AppDimensions.font(10),
                            ),
                          ),
                        ],
                      );
                    },
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
