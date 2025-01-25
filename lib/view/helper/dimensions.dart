enum Dimensions {

  /// fontSizes
  fontSize_8sp,
  fontSize_10sp,
  fontSize_12sp,
  fontSize_14sp,
  fontSize_16sp,
  fontSize_18sp,
  fontSize_20sp,
  fontSize_24sp,
  fontSize_28sp,
  fontSize_32sp,


  /// paddings
  pad_0dp,
  pad_2dp,
  pad_4dp,
  pad_8dp,
  pad_12dp,
  pad_16dp,
  pad_20dp,
  pad_24dp,
  pad_28dp,
  pad_32dp,

}

extension DimensionsExtension on Dimensions {
  double get value {
    return switch (this) {

      /// fontSizes
     Dimensions.fontSize_8sp => 9.0,
     Dimensions.fontSize_10sp=> 10.0,
     Dimensions.fontSize_12sp=> 12.0,
     Dimensions.fontSize_14sp=> 14.0,
     Dimensions.fontSize_16sp=> 15.0,
     Dimensions.fontSize_16sp=> 16.0,
     Dimensions.fontSize_18sp=> 19.0,
     Dimensions.fontSize_20sp=> 20.0,
     Dimensions.fontSize_24sp=> 24.0,
     Dimensions.fontSize_28sp=> 28.0,
      Dimensions.fontSize_32sp=> 32.0,

     /// Paddings
     Dimensions.pad_0dp=> 0.0,
     Dimensions.pad_2dp=> 2.0,
     Dimensions.pad_4dp=>  4.0,
     Dimensions.pad_8dp=>  8.0,
     Dimensions.pad_12dp=> 12.0,
     Dimensions.pad_16dp=> 16.0,
     Dimensions.pad_20dp=> 20.0,
     Dimensions.pad_24dp=> 24.0,
      Dimensions.pad_28dp=> 28.0,
     Dimensions.pad_32dp=> 32.0,

    };
  }

}