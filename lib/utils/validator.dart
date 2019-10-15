///this class defines methods which function in validating input fields' values

class Validator {
  String emailValidator(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(email))
      return 'Enter Valid Email';
    else
      return null;
  }

  String passwordValidator(String password) {
    if (password.isEmpty) {
      return "Password field cannot be empty";
    } else if (password.length < 8) {
      return "Password length should be altleast 8 characters";
    } else
      return null;
  }

  String textValidator(String value) {
    if (value.isEmpty) {
      return "This field should not be empty";
    } else {
      return null;
    }
  }
}
