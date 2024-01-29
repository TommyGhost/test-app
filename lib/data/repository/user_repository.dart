import 'package:consultations_project/domain/models/consultation_response.dart';

abstract class UserRepository {
  Future<ConsultationResponse?> getConsultation();
}
