import 'contraceptive_method.dart';

import '../icons/mara_icons_icons.dart' show MaraIcons;

class MethodRepository {
  static Map<int, ContraceptiveMethod> loadMethods() {
  // static List<ContraceptiveMethod> loadMethods() {
    const allMethods = <int, ContraceptiveMethod>{
      0: ContraceptiveMethod(
        ref: 'iud',
        icon: MaraIcons.iud,
        name: 'IUCD',
        description: '"coil"',
        top: 0.61,
        left: 0.03,
        size: 0.2,
        arrowTop: 0.4,
        arrowLeft: 0.02,
        arrowSize: 0.35,
      ),
      1: ContraceptiveMethod(
        ref: 'birth_control_pills',
        icon: MaraIcons.birth_control_pills,
        name: 'Pills',
        description: '"daily pills"',
        top: 0.05,
        left: 0.7,
        size: 0.16,
        arrowTop: 0.05,
        arrowLeft: 0.52,
        arrowSize: 0.15,
      ),
      2: ContraceptiveMethod(
        ref: 'condom',
        icon: MaraIcons.condom,
        name: 'Male Condom',
        description: 'condom description',
        top: 0.5,
        left: 0.7,
        size: 0.18,
        arrowTop: 0.5,
        arrowLeft: 0.68,
        arrowSize: 0.15,
      ),
      3: ContraceptiveMethod(
        ref: 'contraceptive_implant',
        icon: MaraIcons.contraceptive_implant,
        name: 'the Implant',
        description: 'Nexplanon, Jadelle',
        brands: 'Nexplanon, Jadelle',
        top: 0.05,
        left: 0.1,
        size: 0.2,
        arrowTop: 0.05,
        arrowLeft: 0.1,
        arrowSize: 0.2,
      ),
      4: ContraceptiveMethod(
        ref: 'syringe',
        icon: MaraIcons.syringe,
        name: 'Injection',
        description: 'Injection description',
        brands: 'Depo',
        top: 0.3,
        left: 0.05,
        size: 0.18,
        arrowTop: 0.28,
        arrowLeft: 0.04,
        arrowSize: 0.16,
      ),
      5: ContraceptiveMethod(
        ref: 'female_condom',
        icon: MaraIcons.female_condom,
        name: 'Female condom',
        description: 'Female condom description',
        top: 0.7,
        left: 0.65,
        size: 0.25,
        arrowTop: 0.42,
        arrowLeft: 0.55,
        arrowSize: 0.44,
      ),
      6: ContraceptiveMethod(
        ref: 'double_pills',
        icon: MaraIcons.double_pills,
        name: 'Emergency pills',
        description: 'Emergency pills description',
        brands: 'P2, E-pill',
        top: 0.28,
        left: 0.75,
        size: 0.12,
        arrowTop: 0.2,
        arrowLeft: 0.52,
        arrowSize: 0.2,
      ),
    };
    return allMethods;  // edit return to filter
  }
}