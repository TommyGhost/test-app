import 'package:consultations_project/data/repository/user_repository.dart';
import 'package:consultations_project/domain/models/consultation_response.dart';

import '../remote/user_remote.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemote userRemote;
  UserRepositoryImpl(this.userRemote);

  @override
  Future<ConsultationResponse?> getConsultation() async {
    final response = await userRemote.getConsultation();
    return response;
  }
}
