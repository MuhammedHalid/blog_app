import 'package:blog_app/core/error/exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpwithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<String> loginwithEmailAndPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImp(this.supabaseClient);

  @override
  Future<String> loginwithEmailAndPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement loginwithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<String> signUpwithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth
          .signUp(password: password, email: email, data: {
        'name': name,
      });
      if (response.user == null) {
        throw const ServerException("user is Null");
      }
      return response.user!.id;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
