import 'package:projects/models/photo.dart';
import 'package:projects/models/property.dart';

class PropertyData{
  final Property property;
  final List<Photo> photo;

  PropertyData({required this.property,required this.photo});
}