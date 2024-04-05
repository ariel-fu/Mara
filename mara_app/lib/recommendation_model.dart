import 'package:flutter/material.dart';

class RecommendationModel {
  static List<String> getRecommendationsBasedOnPregnancyTiming(String timing) {
    //print(timing);
    switch (timing) {
      case 'Now or very soon':
        return [
          'No method, Pills, Condoms',
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
      case 'Not sure':
        return [
          'Condoms, Emergency Pill as needed'
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

  static Q5Recommendation getRecommendationsForQ5(String option) {
    switch (option) {
      case 'The lowest chance of getting pregnant':
        return Q5Recommendation(
          recommendations: ['Depo, Implant, IUD'],
          outroText: 'The lowest chance of getting pregnant with these methods: Depo, Implant, IUCD. Condoms are the best way to prevent HIV and other infections, but rely on your partner to use and must be used every time you have sex to prevent pregnancy.'
        );
      case 'Avoiding changes to my periods':
        return Q5Recommendation(
          recommendations: ['Condoms, Pills'],
          outroText: 'Based on how important it is to you to avoid changes to your periods, the following methods might be a good choice for you: Condoms, Pills. The following methods may cause changes to your bleeding but these changes are not harmful and will not lead to fertility problems: Depo, Implant, IUCD.'
        );
      case 'Keeping my method private':
        return Q5Recommendation(
          recommendations: ['Depo, Implant, IUD'],
          outroText: 'Keeping your method private: Depo, Implant, IUD. The following methods may be less private, but you might also want to consider them: Condoms, Pills.'
        );
      case 'Being able to get pregnant in the future':
        return Q5Recommendation(
          recommendations: ['Condoms, Pills, Depo, Implant, IUD, Emergency Pill'],
          outroText: 'Good news! NONE OF THE METHODS WILL CHANGE YOUR ABILITY TO GET PREGNANT IN THE FUTURE!!! If you want to get pregnant in the next 6 months, we recommend avoiding Depo.'
        );
      default:
        return Q5Recommendation(
          recommendations: [],
          outroText: 'Please select an option to get a recommendation.'
        );
    }
  }

  static List<String> getOutroTextsBasedOnPregnancyTiming(String timing) { // Q2
    switch (timing) {
      case 'More than 1 year':
        return [
          'Condoms are the best way to prevent HIV and other infections, but may not be the best method for preventing pregnancy for a long period of time.'
        ];
      // Add more cases as needed
      case 'In 6-12 months':
        return ['The following method may also be a good option, but there may be a delay of 3-6 months in fertility after stopping: Depo'];
      case 'Now or very soon':
        return ['We also recommend you start a prenatal vitamin for good pregnancy health.'];
      case 'Not sure':
        return ['Condoms are the best way to prevent HIV and other infections, but may not be the best method for preventing pregnancy for a long period of time.'];
      default:
        return [''];
    }
  }

  static List<String> getOutroTextsBasedOnPartner(String privacy){ // Q4
    switch(privacy) {
      case 'Extremely important':
        return ['The following methods may be less private, but you might also want to consider them: Condoms, Pills. Condoms are the best way to prevent HIV and other infections, but rely on your partner to use.'];
      case 'Somewhat important':
        return ['The following methods may be less private, but you might also want to consider them: Condoms, Pills. Condoms are the best way to prevent HIV and other infections, but rely on your partner to use.'];
      case 'Not important':
        return ['Condoms are the best way to prevent HIV and other infections, but rely on your partner to use.'];
      default:
        return [''];
    }
  }

  static List<String> getOutroTextsBasedOnLightIrregular(String oktype){
    switch(oktype){
      case 'Could be OK':
        return ['Your periods might be light and irregular or stop when using Depo or the implant, but this is not bad and does not lead to fertility problems.You might also consider the following methods, which do not lead to periods stopping:Pills, Condoms, IUCD'];
      case 'Not OK':
        return ['Your periods might be light and irregular or stop when using the following methods, but this is not bad and does not lead to fertility problems: Depo, Implant'];
      case 'Not sure':
        return ['Your periods might be light and irregular or stop when using Depo or the implant, but this is not bad and does not lead to fertility problems.You might also consider the following methods, which do not lead to periods stopping:Pills, Condoms, IUCD'];
      default:
        return [''];
    }
  }

  static List<String> getOutroTextsBasedOnPeriodsStop(String oktype){
    switch(oktype){
      case 'Could be OK':
        return ['Your periods might be light and irregular or stop when using Depo or the implant, but this is not bad and does not lead to fertility problems.You might also consider the following methods, which do not lead to periods stopping:Pills, Condoms, IUCD'];
      case 'Not OK':
        return ['Your periods might be light and irregular or stop when using the following methods, but this is not bad and does not lead to fertility problems: Depo, Implant'];
      case 'Not sure':
        return ['Your periods might be light and irregular or stop when using Depo or the implant, but this is not bad and does not lead to fertility problems.You might also consider the following methods, which do not lead to periods stopping:Pills, Condoms, IUCD'];
      default:
        return [''];
    }
  }

  static List<String> getOutroTextsBasedOnPeriodsHeavier(String oktype){
    switch(oktype){
      case 'Could be OK':
        return ['Your periods might be heavier using the following method:IUCD'];
      case 'Not OK':
        return ['Your periods might be heavier using the following method:IUCD'];
      case 'Not sure':
        return ['Your periods might be heavier using the following method:IUCD'];
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
        return ['Condoms are the best way to prevent HIV and other infections, but must be used every time you have sex to prevent pregnancy. The Emergency Pill can help prevent pregnancy after sex but is not as effective.'];
      case 'Not OK':
        return ['Condoms are the best way to prevent HIV and other infections, but must be used every time you have sex to prevent pregnancy. The Emergency Pill can help prevent pregnancy after sex but is not as effective.'];
      case 'Not sure':
        return ['Condoms are the best way to prevent HIV and other infections, but must be used every time you have sex to prevent pregnancy. The Emergency Pill can help prevent pregnancy after sex but is not as effective.'];
      default:
        return [''];
    }
  }

  static List<String> getOutroTextsBasedOnLast3Months(String oktype){
    switch(oktype){
      case 'Could be OK':
        return ['The following methods last longer than 3 months but you might also want to use them:Implant, IUCD'];
      case 'Not OK':
        return ['The following methods last 3 months or less but you might also want to use them: Condoms, Pills, Depo'];
      case 'Not sure':
        return ['The following methods last 3 months or less but you might also want to use them: Condoms, Pills, Depo'];
      default:
        return [''];
    }
  }

  static List<String> getOutroTextsBasedOnMoreThan1Yr(String oktype){
    switch(oktype){
      case 'Could be OK':
        return ['The following methods last less than a year but you might also want to use them: Condoms, PIlls, Depo'];
      case 'Not OK':
        return ['The following methods last 3 or more years but you might also want to use them:Implant, IUCD'];
      case 'Not sure':
        return ['The following methods last less than a year but you might also want to use them: Condoms, PIlls, Depo'];
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
        return ['Condoms are the best way to prevent HIV and other infections, but rely on your partner to use and must be used every time you have sex to prevent pregnancy.'];
      case 'Avoiding changes to my periods':
        return ['The following methods may cause changes to your bleeding but these changes are not harmful and will not lead to fertility problems:Depo, Implant, IUCD'];
      case 'Keeping my method private':
        return ['The following methods may be less private, but you might also want to consider them: Condoms, Pills. Condoms are the best way to prevent HIV and other infections, but rely on your partner to use.'];
      case 'Being able to get pregnant in the future':
        return ['Good news! NONE OF THE METHODS WILL CHANGE YOUR ABILITY TO GET PREGNANT IN THE FUTURE!!! If you want to get pregnant in the next 6 months, we recommend avoiding Depo'];
      default:
        return [''];
    }
  }

   static String getImageForRecommendation(String recommendation) {
    Map<String, String> recommendationImages = {
      'Implant': './assets/implant.png',
      'Pills': './assets/pills.png',
      'Condoms': './assets/condom.png',
      'IUD': './assets/IUD.png',
      'Emergency Pill': './assets/emergency.png',
      'Depo': './assets/depo.png',
      'IUCD': './assets/IUD.png',
    };

    return recommendationImages[recommendation] ?? './assets/method_6.png'; // default image if no match found
  }
}

class Q5Recommendation {
  final List<String> recommendations;
  final String outroText;

  Q5Recommendation({required this.recommendations, required this.outroText});
}


