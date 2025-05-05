import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/configs/space_ext.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/data/network/api_provider.dart';
import 'package:ecommerce_app_login/domain/models/photo_model.dart';
import 'package:ecommerce_app_login/services/auth_services.dart';
import 'package:ecommerce_app_login/widgets/app_column.dart';
import 'package:ecommerce_app_login/widgets/appimage.dart' show AppImage;
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
          // FutureBuilder<List<PhotosModel>>(
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
          //     return SizedBox();
          //   },
          // ),
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

          // FutureBuilder<List<EventUsersModel>>(
          //   future: ApiProvider().getEventUsers(),
          //   builder: (
          //     BuildContext context,
          //     AsyncSnapshot<List<EventUsersModel>> snapshot,
          //   ) {
          //     if (snapshot.hasData) {
          //       if (snapshot.data != null) {
          //         return ListView.separated(
          //           padding: Space.all(1, 0),
          //           separatorBuilder: (context, index) {
          //             return Divider(color: AppColors.grey100);
          //           },

          //           itemCount: snapshot.data!.length,
          //           shrinkWrap: true,
          //           physics: NeverScrollableScrollPhysics(),
          //           itemBuilder: (context, index) {
          //             var data = snapshot.data![index];
          //             return Row(
          //               children: [
          //                 AppImage(
          //                   imageUrl:
          //                       'https://ui-avatars.com/api/?name=John+Doe',
          //                   size: AppDimensions.font(20),
          //                 ),

          //                 Space.x1!,
          //                 Expanded(
          //                   child: Text.rich(
          //                     TextSpan(
          //                       text: data.name,
          //                       children: [
          //                         TextSpan(
          //                           text: "\n${data.email}",
          //                           style: AppText.l1!
          //                               .w(4)
          //                               .notoSans()
          //                               .cl(AppColors.grey500),
          //                         ),
          //                       ],
          //                       style: AppText.b3!
          //                           .w(4)
          //                           .notoSans()
          //                           .cl(AppColors.grey900),
          //                     ),
          //                   ),
          //                 ),
          //                 InkWell(
          //                   onTap: () async {
          //                     try {
          //                       await Tools().sendEmail(
          //                         toEmail: data.email.toLowerCase(),
          //                       );
          //                     } catch (e) {
          //                       Tools.showSnack(e.toString());
          //                     }
          //                   },
          //                   child: AppImage(
          //                     imageUrl: Assets.messageIcon,
          //                     size: AppDimensions.font(10),
          //                   ),
          //                 ),
          //               ],
          //             );
          //           },
          //         );
          //       }
          //     }

          //     return SizedBox();
          //   },
          // ),
          Padding(
            padding: Space.all(1, 0.5),
            child: Row(
              children: [
                Text(S.photos, style: AppText.b1!.w(6).cl(AppColors.grey900)),
                Spacer(),
                Text(
                  S.allPhotos,
                  style: AppText.b3!.w(6).cl(AppColors.primary).notoSans(),
                ),
                Space.x!,
                Icon(
                  Icons.arrow_forward,
                  size: AppDimensions.font(8),
                  color: AppColors.primary,
                ),
              ],
            ),
          ),

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
                    height: AppDimensions.font(85),
                    child: ListView.builder(
                      itemCount: trimmedData.length,
                      padding: Space.h1,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        var item = trimmedData[index];
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.grey500,
                              width: 0.5,
                            ),
                          ),
                          width: AppDimensions.width(60),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: SizedBox(
                                  width: AppDimensions.width(60),
                                  height: AppDimensions.font(30),
                                  child: AppImage(
                                    imageUrl: item.thumbnailUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: Space.all(1, 0.5),
                                child: Text(
                                  'COVID-19 update',
                                  style: AppText.b2!.w(6).cl(AppColors.grey900),
                                ),
                              ),
                              Padding(
                                padding: Space.h1!,
                                child: Text(
                                  item.title,
                                  style:
                                      AppText.b3!
                                          .w(4)
                                          .cl(AppColors.grey500)
                                          .notoSans(),
                                  maxLines: 4,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
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
