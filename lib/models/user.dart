class User{

  static final User instance = User(); 

  late String _username;
  late String _email;
  late String _password;

  String getUsername(){
    return _username;
  }

  void setUsername(username){
    _username = username;
  }

  String getEmail(){
    return _email;
  }

  void setEmail(email){
    _email = email;
  }

  String getPassword(){
    return _password;
  }

  void setPassword(password){
    _password = password;
  }

}