import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:projects/constants/Colors.dart';
import 'package:projects/functions/Capitalize_String.dart';
import 'package:projects/models/photo.dart';
import 'package:projects/models/property.dart';
import 'package:projects/screens/details_page.dart';
import 'package:projects/utils/app_text_style.dart';

class CardProperty extends StatelessWidget {
  CardProperty({
    super.key, required this.property, required this.photos,
  });
final Property property;
final List<Photo> photos;
  final isclicked = false.obs;

  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(DetailsPage(
          property: property,
          photo: photos,
        ));
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width >= 700 ? 400 : 300,
        ),
        child: SizedBox(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[80],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                              photos[0].url!,
                                  height: MediaQuery.sizeOf(context).height * 0.23,
                                width: MediaQuery.sizeOf(context).width,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 11,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 9,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.house,
                                          size: 13,
                                          color: Colors_app.orange_color,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          property.type?? "",
                                          style: AppStyles.styleBoldOrange15(
                                            context,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Obx(() {
                                    return Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: Colors_app.white_color,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: IconButton(
                                        iconSize: 20,
                                        onPressed: () {
                                          isclicked.value = !isclicked.value;
                                        },
                                        icon: Icon(
                                          isclicked.value
                                              ? FontAwesomeIcons.solidHeart
                                              : FontAwesomeIcons.heart,
                                        ),
                                        color: Colors_app.orange_color,
                                      ),
                                    );
                                  }),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 11,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 5,
                                        horizontal: 9,
                                      ),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                              0.3,
                                            ), // Shadow color
                                            spreadRadius: 2, // Spread radius
                                            blurRadius: 5, // Blur radius
                                            offset: Offset(
                                              2,
                                              3,
                                            ), // Shadow position (x, y)
                                          ),
                                        ],
                                        color: Colors_app.orange_color,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            property.price ?? "" + ' ' + 'EGP',
                                            style: AppStyles.styleBoldwhite20(
                                              context,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            child: Text(
                              property.title?? "".toTitleCase,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textAlign: TextAlign.left,
                              style: AppStyles.styleBoldBlack19(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.locationDot,
                                  color: Colors.grey[400],
                                  size: 20,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "${property.location??""} Egypt".toUpperCase(),
                                  textAlign: TextAlign.left,
                                  style: AppStyles.styleRegularGray15(context),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 20,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.bed,
                                      size:
                                          MediaQuery.sizeOf(context).width > 800
                                              ? 25
                                              : 15,
                                    ),
                                    Text(
                                      '${property.bedroom}',
                                      style: AppStyles.styleBoldBlack20(
                                        context,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  spacing: 10,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.sink,
                                      size:
                                          MediaQuery.sizeOf(context).width > 800
                                              ? 25
                                              : 15,
                                    ),

                                    Text(
                                      '${property.bathroom}',
                                      style: AppStyles.styleBoldBlack20(
                                        context,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  spacing: 10,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.maximize,
                                      size:
                                          MediaQuery.sizeOf(context).width > 800
                                              ? 25
                                              : 15,
                                    ),

                                    Text(
                                      property.area.toString(),
                                      style: AppStyles.styleBoldBlack20(
                                        context,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
