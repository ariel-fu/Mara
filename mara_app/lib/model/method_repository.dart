import 'contraceptive_method.dart';

class MethodRepository {
  static Map<int, ContraceptiveMethod> loadMethods() {
  // static List<ContraceptiveMethod> loadMethods() {
    const allMethods = <int, ContraceptiveMethod>{
      0: ContraceptiveMethod(
        ref: 'iud',
        name: 'IUCD',
        description: '"coil"',
      ),
      1: ContraceptiveMethod(
        ref: 'birth_control_pills',
        name: 'Pills',
        description: '"daily pills"',
      ),
      2: ContraceptiveMethod(
        ref: 'condom',
        name: 'Male Condom',
        description: 'condom description'
      ),
      3: ContraceptiveMethod(
        ref: 'implant',
        name: 'the Implant',
        description: 'Nexplanon, Jadelle',
        brands: 'Nexplanon, Jadelle',
      ),
      4: ContraceptiveMethod(
        ref: 'syringe',
        name: 'Injection',
        description: 'Injection description',
        brands: 'Depo',
      ),
      5: ContraceptiveMethod(
        ref: 'female_condom',
        name: 'Female condom',
        description: 'Female condom description',
      ),
      6: ContraceptiveMethod(
        ref: 'double_pills',
        name: 'Emergency pills',
        description: 'Emergency pills description',
        brands: 'P2, E-pill',
      ),
    };
    return allMethods;  // edit return to filter
  }
}