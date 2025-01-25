import 'package:pet_app/view/helper/dimensions.dart';
import 'package:flutter/material.dart';

class PaddingValues extends EdgeInsets{
  
  PaddingValues.all(Dimensions dimen) : super.all(dimen.value);
  
  PaddingValues.only({
    Dimensions top = Dimensions.pad_0dp,
    Dimensions bottom = Dimensions.pad_0dp,
    Dimensions left = Dimensions.pad_0dp,
    Dimensions right = Dimensions.pad_0dp
  }) : super.only(top: top.value, bottom: bottom.value, left: left.value, right: right.value);

  PaddingValues.symmetric({
    Dimensions vertical = Dimensions.pad_0dp,
    Dimensions horizontal = Dimensions.pad_0dp
  }) : super.symmetric(vertical: vertical.value, horizontal: horizontal.value);
  
  PaddingValues.fromLTRB({
    Dimensions left = Dimensions.pad_0dp,
    Dimensions top = Dimensions.pad_0dp,
    Dimensions right = Dimensions.pad_0dp,
    Dimensions bottom = Dimensions.pad_0dp
  }) : super.fromLTRB(left.value, top.value, right.value, bottom.value);
  
  
}
