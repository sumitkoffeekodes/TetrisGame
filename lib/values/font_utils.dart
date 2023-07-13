import 'package:flutter/cupertino.dart';
import 'package:tetris/values/appColors.dart';

enum FWT { light, regular, medium, bold, semiBold }

class FontTextStyleUtilities {
  static FontWeight getFontWeights({FWT fontweight = FWT.regular}) {
    switch (fontweight) {
      case FWT.bold:
        return FontWeight.w700;
      case FWT.semiBold:
        return FontWeight.w600;
      case FWT.medium:
        return FontWeight.w500;
      case FWT.regular:
        return FontWeight.w400;
      case FWT.light:
        return FontWeight.w300;
    }
  }



  static TextStyle textStyle22 =  const TextStyle(
      fontSize: 22,
      fontFamily: 'Montserrat-Regular',
      color: AppColors.textColor39,
      fontWeight: FontWeight.normal
  );
  static TextStyle textStyleB28 =  const TextStyle(
      fontSize: 28,
      fontFamily: 'Montserrat-Bold',
      color: AppColors.textColor39,
      fontWeight: FontWeight.normal
  );

  static TextStyle textStyleB24 =  const TextStyle(
      fontSize: 28,
      fontFamily: 'Montserrat-Bold',
      color: AppColors.textColor39,
      fontWeight: FontWeight.normal
  );

  static TextStyle textStyleB22 =  const TextStyle(
      fontSize: 22,
      fontFamily: 'Montserrat-Bold',
      color: AppColors.textColor39,
      fontWeight: FontWeight.w700
  );

  static TextStyle textStyleB20 =  const TextStyle(
      fontSize: 20,
      fontFamily: 'Montserrat-Bold',
      color: AppColors.textColor39,
      fontWeight: FontWeight.w700
  );



  static TextStyle textStyle20 =  const TextStyle(
      fontSize: 20,
      fontFamily: 'Montserrat-Regular',
      color: AppColors.textColor39,
      fontWeight: FontWeight.normal
  );


  static TextStyle textStyle16 =  const TextStyle(
      fontSize: 16,
      fontFamily: 'Montserrat',
      color: AppColors.textColor39,
      fontWeight: FontWeight.normal
  );

  static TextStyle textStyleB25 =  const TextStyle(
      fontSize: 25,
      fontFamily: 'Montserrat-Bold',
      color: AppColors.textColor39,
      fontWeight: FontWeight.normal
  );


  static TextStyle textStyleB26 =  const TextStyle(
      fontSize: 26,
      fontFamily: 'Montserrat-Bold',
      color: AppColors.textColor39,
      fontWeight: FontWeight.normal
  );





  static TextStyle textStyle30 =  const TextStyle(
      fontSize: 30,
      fontFamily: 'Montserrat-Regular',
      color: AppColors.textColor39,
      fontWeight: FontWeight.normal
  );


  static TextStyle textStyle15 =  const TextStyle(
      fontSize: 15,
      fontFamily: 'Montserrat-Regular',
      color: AppColors.textColor39,
      fontWeight: FontWeight.normal
  );

  static TextStyle textStyleB15 =  const TextStyle(
      fontSize: 15,
      fontFamily: 'Montserrat-Bold',
      color: AppColors.textColor39,
      fontWeight: FontWeight.normal
  );

  static TextStyle textStyleB12 =  const TextStyle(
      fontSize: 12,
      fontFamily: 'Montserrat-Bold',
      color: AppColors.textColor39,
      fontWeight: FontWeight.normal
  );

  static TextStyle textStyleB13 =  const TextStyle(
      fontSize: 13,
      fontFamily: 'Montserrat-Bold',
      color: AppColors.textColor39,
      fontWeight: FontWeight.normal
  );

  static TextStyle textStyle11 =  const TextStyle(
      fontSize: 11,
      fontFamily: 'Montserrat-Regular',
      color: AppColors.textColor39,
      fontWeight: FontWeight.normal
  );

  static TextStyle textStyles11 =  const TextStyle(
      fontSize: 11,
      fontFamily: 'Montserrat-SemiBold',
      color: AppColors.textColor39,
      fontWeight: FontWeight.normal
  );

  static TextStyle textStyles12 =  const TextStyle(
      fontSize: 12,
      fontFamily: 'Montserrat-SemiBold',
      color: AppColors.textColor39,
      fontWeight: FontWeight.normal
  );
  static TextStyle textStyle10 =  const TextStyle(
      fontSize: 11,
      fontFamily: 'Montserrat-Regular',
      color: AppColors.textColor39,
      fontWeight: FontWeight.normal
  );

  static TextStyle textStyleB10 =  const TextStyle(
      fontSize: 11,
      fontFamily: 'Montserrat-Bold',
      color: AppColors.textColor39,
      fontWeight: FontWeight.normal
  );



  static TextStyle textStyle12 =  const TextStyle(
      fontSize: 12,
      fontFamily: 'Montserrat-Regular',
      color: AppColors.textColor39,
      fontWeight: FontWeight.normal
  );



  static TextStyle textStyle14 =  const TextStyle(
      fontSize: 14,
      fontFamily: 'Montserrat-Regular',
      color: AppColors.textColor39,
      fontWeight: FontWeight.normal
  );

  static TextStyle textStyleB14 =  const TextStyle(
      fontSize: 14,
      fontFamily: 'Montserrat-Bold',
      color: AppColors.textColor39,
      fontWeight: FontWeight.normal
  );

  static TextStyle textStyle13=  const TextStyle(
      fontSize: 13,
      fontFamily: 'Montserrat-Regular',
      color: AppColors.textColor39,
      fontWeight: FontWeight.normal
  );




}