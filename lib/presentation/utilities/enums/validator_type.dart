enum ValidatorType {
  userName,
  email,
  password,
}

String? validateEmail(String? email) {
  if (email == null || email.isEmpty) {
    return 'Yêu cầu nhập email';
  }
  const String regex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  final RegExp regExp = RegExp(regex);
  if (!regExp.hasMatch(email)) {
    return 'Email không hợp lệ';
  }
  return null;
}

String? validateUserName(String? userName) {
  if (userName == null || userName.isEmpty) {
    return 'Yêu cầu nhập tên đăng nhập';
  }
  if (userName.length < 6) {
    return 'Tên đăng nhập phải có ít nhất 6 ký tự';
  }
  if (userName.length > 20) {
    return 'Tên đăng nhập không được vượt quá 20 ký tự';
  }
  return null;
}

String? validatePassword(String? password) {
  if (password == null || password.isEmpty) {
    return 'Yêu cầu nhập mật khẩu';
  }
  if (password.length < 6) {
    return 'Mật khẩu phải có ít nhất 6 ký tự';
  }
  return null;
}
