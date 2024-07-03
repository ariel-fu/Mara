
import 'package:flutter/material.dart';
import 'package:mara_app/icons/mara_icons_icons.dart' show MaraIcons;

class RecommendationModel {
  

  static List<String> getRecommendationsBasedOnPregnancyTiming(String timing) {
    //print(timing);
    switch (timing) {
      case 'Now or very soon':
        return [
          'Pills, Condoms',
          // 'Start a prenatal vitamin for good pregnancy health.'
        ];
      case 'In 6-12 months':
        return [
          'Pills, Condoms, Implant, IUD',
          // 'Note: Depo may cause a delay of 3-6 months in fertility after stopping.'
        ];
      case 'More than 1 year':
        return [
          'Implant, IUD, Depo, Pills',
          // 'Note: Condoms are the best way to prevent HIV and other infections.'
        ];
      case 'I\'m not sure':
        return [
          'Condoms, Emergency Pill'
        ];
      default:
        return ['Please select when you think you might want a pregnancy to get a recommendation.'];
    }
  }

  static List<String> getRecommendationsBasedOnPrivacyImportance(String importance) {
    switch (importance) {
      case 'o1': // Extremely important
        return [
          // 'Depo',
          // 'Implant',
          // 'IUCD'
          'Depo, Implant, IUD'
        ];
      case 'o2': // Somewhat important
        return [
          // 'Depo',
          // 'Implant',
          // 'IUCD',
          // 'Condoms',
          // 'Pills'
          'Depo, Implant, IUD, Condoms, Pills'
        ];
      case 'o3': // Not important
        return [
          // 'Depo',
          // 'Implant',
          // 'IUCD',
          // 'Condoms',
          // 'Pills'
          'Depo, Implant, IUD, Condoms, Pills'
        ];
      default:
        return ['Please select how important it is for you to keep your method private to get a recommendation.'];
    }
  }



  static List<String> getOutroTextsBasedOnPregnancyTiming(String timing) { // Q2
    switch (timing) {
      case 'More than 1 year':
        // return [
        //   'Condoms are the best way to prevent HIV and other infections, but may not be the best method for preventing pregnancy for a long period of time.'
        // ];
        return ['outroText1'];
      case 'In 6-12 months':
        // return ['The following method may also be a good option, but there may be a delay of 3-6 months in fertility after stopping: Depo'];
        return ['outroText2'];
      case 'Now or very soon':
        // return ['We also recommend you start a prenatal vitamin for good pregnancy health.'];
        return ['outroText3'];
      case 'I\'m not sure':
        // return ['Condoms are the best way to prevent HIV and other infections, but may not be the best method for preventing pregnancy for a long period of time.'];
        return ['outroText1'];
      default:
        return [''];
    }
  }

  static List<String> getOutroTextsBasedOnPartner(String privacy){ // Q4
    switch(privacy) {
      case 'Extremely important':
        // return ['The following methods may be less private, but you might also want to consider them: Condoms, Pills. Condoms are the best way to prevent HIV and other infections, but rely on your partner to use.'];
        return ['outroText17'];
      case 'Somewhat important':
        // return ['The following methods may be less private, but you might also want to consider them: Condoms, Pills. Condoms are the best way to prevent HIV and other infections, but rely on your partner to use.'];
        return ['outroText17'];
      case 'Not important':
        // return ['Condoms are the best way to prevent HIV and other infections, but rely on your partner to use.'];
        return ['outroText5'];
      default:
        return [''];
    }
  }

  static List<String> getOutroTextsBasedOnLightIrregular(String oktype){
    switch(oktype){
      case 'Could be OK':
        // return ['Your periods might be light and irregular or stop when using Depo or the implant, but this is not bad and does not lead to fertility problems.You might also consider the following methods, which do not lead to periods stopping:Pills, Condoms, IUCD'];
        return ['outroText8'];
      case 'Not OK':
        // return ['Your periods might be light and irregular or stop when using the following methods, but this is not bad and does not lead to fertility problems: Depo, Implant'];
        return ['outroText18'];
      case 'Not sure':
        // return ['Your periods might be light and irregular or stop when using Depo or the implant, but this is not bad and does not lead to fertility problems.You might also consider the following methods, which do not lead to periods stopping:Pills, Condoms, IUCD'];
        return ['outroText8'];
      default:
        return [''];
    }
  }

  static List<String> getOutroTextsBasedOnPeriodsStop(String oktype){
    switch(oktype){
      case 'Could be OK':
        // return ['Your periods might be light and irregular or stop when using Depo or the implant, but this is not bad and does not lead to fertility problems.You might also consider the following methods, which do not lead to periods stopping:Pills, Condoms, IUCD'];
        return ['outroText10'];
      case 'Not OK':
        // return ['Your periods might be light and irregular or stop when using the following methods, but this is not bad and does not lead to fertility problems: Depo, Implant'];
        return ['outroText8'];
      case 'Not sure':
        // return ['Your periods might be light and irregular or stop when using Depo or the implant, but this is not bad and does not lead to fertility problems.You might also consider the following methods, which do not lead to periods stopping:Pills, Condoms, IUCD'];
        return ['outroText10'];
      default:
        return [''];
    }
  }

  static List<String> getOutroTextsBasedOnPeriodsHeavier(String oktype){
    switch(oktype){
      case 'Could be OK':
        // return ['Your periods might be heavier using the following method:IUCD'];
        return ['outroText9'];
      case 'Not OK':
        // return ['Your periods might be heavier using the following method:IUCD'];
        return ['outroText9'];
      case 'Not sure':
        // return ['Your periods might be heavier using the following method:IUCD'];
        return ['outroText9'];
      default:
        return [''];
    }
  }

  static String getMethodSummary(String methodName) {
    Map<String, String> methodSummaries = {
      'Implant': 'Summary of Implant...',
      'Pills': 'Summary of Pills...',
      'Condoms': 'Summary of Condoms...',
      'IUD': 'Summary of IUD...',
      'Emergency Pill': 'Summary of Emergency Pill...',
      'Depo': 'Summary of Depo...',
    };

    return methodSummaries[methodName] ?? 'No summary available for this method.';
  }

  static List<String> getOutroTextsBasedOnLastEverytimeSex(String oktype){
    switch(oktype){
      case 'Could be OK':
        // return ['Condoms are the best way to prevent HIV and other infections, but must be used every time you have sex to prevent pregnancy. The Emergency Pill can help prevent pregnancy after sex but is not as effective.'];
        return ['outroText19'];
      case 'Not OK':
        // return ['Condoms are the best way to prevent HIV and other infections, but must be used every time you have sex to prevent pregnancy. The Emergency Pill can help prevent pregnancy after sex but is not as effective.'];
        return ['outroText19'];
      case 'Not sure':
        // return ['Condoms are the best way to prevent HIV and other infections, but must be used every time you have sex to prevent pregnancy. The Emergency Pill can help prevent pregnancy after sex but is not as effective.'];
        return ['outroText19'];
      default:
        return [''];
    }
  }

  static List<String> getOutroTextsBasedOnLast3Months(String oktype){
    switch(oktype){
      case 'Could be OK':
        // return ['The following methods last longer than 3 months but you might also want to use them:Implant, IUCD'];
        return ['outroText14'];
      case 'Not OK':
        // return ['The following methods last 3 months or less but you might also want to use them: Condoms, Pills, Depo'];
        return ['outroText13'];
      case 'Not sure':
        // return ['The following methods last 3 months or less but you might also want to use them: Condoms, Pills, Depo'];
        return ['outroText13'];
      default:
        return [''];
    }
  }

  static List<String> getOutroTextsBasedOnMoreThan1Yr(String oktype){
    switch(oktype){
      case 'Could be OK':
        // return ['The following methods last less than a year but you might also want to use them: Condoms, PIlls, Depo'];
        return ['outroText16'];
      case 'Not OK':
        // return ['The following methods last 1 or more years but you might also want to use them:Implant, IUCD'];
        return ['outroText15'];
      case 'Not sure':
        // return ['The following methods last less than a year but you might also want to use them: Condoms, PIlls, Depo'];
        return ['outroText16'];
      default:
        return [''];
    }
  }


  static String getTranslatedRecommendation(String recommendation, String language, Map<String, Map<String, String>> translations) {
    return translations[language]?[recommendation] ?? recommendation;
  }

  static List<String> getOutroTextsBasedOnFactorsImp(String factor){ // Q5
    switch(factor) {
      case 'The lowest chance of getting pregnant':
        // return ['Condoms are the best way to prevent HIV and other infections, but rely on your partner to use and must be used every time you have sex to prevent pregnancy.'];
        return ['outroText5'];
      case 'Avoiding changes to my periods':
        // return ['The following methods may cause changes to your bleeding but these changes are not harmful and will not lead to fertility problems:Depo, Implant, IUCD'];
        return ['outroText6'];
      case 'Keeping my method private':
        // return ['The following methods may be less private, but you might also want to consider them: Condoms, Pills. Condoms are the best way to prevent HIV and other infections, but rely on your partner to use.'];
        return ['outroText4'];
      case 'Being able to get pregnant in the future':
        // return ['Good news! NONE OF THE METHODS WILL CHANGE YOUR ABILITY TO GET PREGNANT IN THE FUTURE!!! If you want to get pregnant in the next 6 months, we recommend avoiding Depo'];
        return ['outroText7'];
      default:
        return [''];
    }
  }

   static String getImageForRecommendation(String recommendation) {
    Map<String, String> recommendationImages = {
      'Implant': './assets/implant.png',
      'Pills': './assets/pills.png',
      'Condoms': './assets/condom.png',
      'IUD': './assets/iucd.png',
      'Emergency Pill': './assets/emergency.png',
      'Depo': './assets/depo.png',
      'IUCD': './assets/iucd.png',
    };

    return recommendationImages[recommendation] ?? './assets/method_6.png'; // default image if no match found
  }

  static String getTitleFromJsonRef(String jsonRef) {
    Map<String, String> recommendationTitles = {
      'implant': 'Implant',
      'pills' : 'Pills (daily pills)', 
      'condoms': 'Condom',
      'iud': 'IUCD (coil)', 
      'iucd': 'IUCD (coil)', 
      'emergency': 'Emergency pill (E-pill, P2)', 
      'depo': 'Injection (depo)', 
      'female_condom': 'Female condom'
    };

    return recommendationTitles[jsonRef] ?? 'No title found';
  }

  static String getJsonRefFromName(String name) {
  Map<String, String> recommendationTitles = {
    'Implant': 'implant',
    'Pills': 'pills',
    'Condoms': 'condoms',
    'IUCD': 'iucd',
    'IUD': 'iucd',
    'Emergency Pill': 'emergency',
    'Depo': 'depo',
    'Female condoms': 'female_condom',
  };

  String result = recommendationTitles[name] ?? 'No title found';
  if (result == 'No title found') {
    print("No title found for: $name");  // Debugging line to check input
  }
  return result;
}

  static String getJsonRefFromName_page(String name) {
  Map<String, String> jsonName = {
    'Implant': 'implant',
    'Pills (daily pills)': 'pills',
    'Condom': 'condoms',
    'IUCD (coil)': 'iucd',
    'IUD (coil)': 'iucd',
    'Emergency pill': 'emergency',
    'Injection (depo)': 'depo',
    'Female condom': 'female_condom',
  };

  String result = jsonName[name] ?? 'emergency';
  if (result == 'No title found') {
    print("No title found for: $name");  // Debugging line to check input
  }
  return result;
}

  static IconData getIconForRecommendation(String recommendation) {
    Map<String, IconData> recommendationImages = {
      'implant': MaraIcons.contraceptive_implant,
      'pills': MaraIcons.birth_control_pills,
      'condoms': MaraIcons.condom,
      'iucd': MaraIcons.iud,
      'emergency': MaraIcons.double_pills,
      'depo': MaraIcons.syringe,
      'female_condom': MaraIcons.female_condom,
    };

    return recommendationImages[recommendation] ?? MaraIcons.double_pills; // default image if no match found
  }

}

class Q5Recommendation {
  final List<String> recommendations;
  final String outroText;

  Q5Recommendation({required this.recommendations, required this.outroText});
}
