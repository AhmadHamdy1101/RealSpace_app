
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/models/supadart_header.dart';
import 'package:projects/screens/home_page_screen/domain/entity/property_Data.dart';

import '../../../../constants/constatnts.dart';
import '../../../../models/photo.dart';
import '../../../../models/property.dart';


part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());

  List<Property> items = [];
List<PropertyData> propertyWithPhotos = [];

  Future<void> fetchData() async {
    emit(HomePageLoading());
    try {

      final response = await core.property.select().withConverter(
        Property.converter,

      );

      if (response.isNotEmpty) {
        items = response;
        List<Future<PropertyData>> futures = items.map((p) async {
          var photos = await core.photo
              .select()
              .eq('property_id', p.id)
              .withConverter(Photo.converter);

          return PropertyData(property: p, photo: photos);
        }).toList();

        propertyWithPhotos = await Future.wait(futures);
        print("Response length: ${response.length}");
        emit(HomePageSuccess(propertyWithPhotos));
      } else {
        print("Supabase returned an empty list or null!");
      }
    } catch (e) {
      print(e);
      emit(HomePageFailure());
    }
  }
}

