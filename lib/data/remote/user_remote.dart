import 'package:consultations_project/domain/models/consultation_response.dart';

abstract class UserRemote {
  Future<ConsultationResponse?> getConsultation();
}
