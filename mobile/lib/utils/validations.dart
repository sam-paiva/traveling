class Validations {
  static String validateTextField(String text) {
    if (text.isEmpty)
      return 'Campo obrigatório';
    else
      return null;
  }
}
