class Login_verify {
  //code here
  String verify_login(String username, String password) {
    if (username == "admin" && password == "admin") {
      return "true";
    } else {
      return "false";
    }
    //code here
  }
}
