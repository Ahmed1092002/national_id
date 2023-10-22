part of 'national_id_cubit.dart';

@immutable
abstract class NationalIdState {}

class NationalIdInitial extends NationalIdState {}
class GetYearOfBirthState extends NationalIdState {}
class GetDayOfBirthState extends NationalIdState {}
class GetMonthOfBirthState extends NationalIdState {}
class GetgovernorateOfBirthState extends NationalIdState {}
class GetGenderState extends NationalIdState {}

