import 'package:firebase_core/firebase_core.dart';
import 'package:intera/core/consts.dart';

abstract class FirebaseBaseError extends Error {
  FirebaseBaseError({required this.type, this.message});

  final FirebaseErrorType type;
  final String? message;

  // email-already-in-use:
  // Thrown if there already exists an account with the given email address.
  // invalid-email:
  // Thrown if the email address is not valid.
  // operation-not-allowed:
  // Thrown if email/password accounts are not enabled. Enable email/password accounts in the Firebase Console, under the Auth tab.
  // weak-password:
  // Thrown if the password is not strong enough.
}

class FirebaseError extends FirebaseBaseError {
  FirebaseError(String message, FirebaseErrorType type)
      : super(type: type, message: message);

  factory FirebaseError.codeToError(String code, [String? message]) {
    switch (code) {
      case 'email-already-in-use':
        return FirebaseError.emailAlreadyInUse(message);
      case 'invalid-email':
        return FirebaseError.invalidEmail(message);
      case 'operation-not-allowed':
        return FirebaseError.operationNotAllowed(message);
      case 'weak-password':
        return FirebaseError.weakPassword(message);
      case 'user-disabled':
        return FirebaseError.userDisabled(message);
      case 'user-not-found':
        return FirebaseError.userNotFound(message ?? Consts.USER_NOTFOUND);
      case 'wrong-password':
        return FirebaseError.wrongPassword(
            message ?? Consts.INCORRECT_PASSWORD);
      default:
        return FirebaseError.internal(message);
    }
  }

  FirebaseError.emailAlreadyInUse(String? message)
      : super(type: FirebaseErrorType.emailAlreadyInUse, message: message);

  FirebaseError.invalidEmail(String? message)
      : super(type: FirebaseErrorType.invalidEmail, message: message);

  FirebaseError.operationNotAllowed(String? message)
      : super(type: FirebaseErrorType.operationNotAllowed, message: message);

  FirebaseError.weakPassword(String? message)
      : super(type: FirebaseErrorType.weakPassword, message: message);

  FirebaseError.userNotFound(String? message)
      : super(type: FirebaseErrorType.userNotFound, message: message);

  FirebaseError.userDisabled(String? message)
      : super(type: FirebaseErrorType.userDisabled, message: message);

  FirebaseError.wrongPassword(String? message)
      : super(type: FirebaseErrorType.wrongPassword, message: message);

  FirebaseError.internal(String? message)
      : super(type: FirebaseErrorType.internal, message: message);
}

extension FirebaseErrorExtension on FirebaseError {
  FirebaseError codeToError(String code, [String? message]) {
    switch (code) {
      case 'email-already-in-use':
        return FirebaseError.emailAlreadyInUse(message ?? Consts.EMAIL_IN_USE);
      case 'invalid-email':
        return FirebaseError.invalidEmail(message ?? Consts.INVALID_EMAIL);
      case 'operation-not-allowed':
        return FirebaseError.operationNotAllowed(message);
      case 'weak-password':
        return FirebaseError.weakPassword(message ?? Consts.WEAK_PASSWORD);
      case 'user-disabled':
        return FirebaseError.userDisabled(message?? Consts.USER_DISABLED);
      case 'user-not-found':
        return FirebaseError.userNotFound(message ?? Consts.USER_NOTFOUND);
      case 'wrong-password':
        return FirebaseError.wrongPassword(
            message ?? Consts.INCORRECT_PASSWORD);
      default:
        return FirebaseError.internal(message);
    }
  }
}

enum FirebaseErrorType {
  emailAlreadyInUse,
  invalidEmail,
  operationNotAllowed,
  weakPassword,
  userDisabled,
  userNotFound,
  wrongPassword,
  internal,
}
