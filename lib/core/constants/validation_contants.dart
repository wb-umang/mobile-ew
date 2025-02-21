class ValidationConstants {
  static const String emailPattern =
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";

  static const String namePattern = r"^[a-zA-Z]+$";

  static const int passwordMinLength = 6;
}
