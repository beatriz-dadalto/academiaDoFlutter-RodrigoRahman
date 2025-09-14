part of 'contact_list_cubit.dart';


@freezed
class ContactListCubitState with _$ContactListCubitState {
  factory ContactListCubitState.initial() = _ContactListCubitStateInitial;
  factory ContactListCubitState.loading() = _ContactListCubitStateLoading;
  factory ContactListCubitState.success() = _ContactListCubitStateSuccess;
  factory ContactListCubitState.error({required String error}) = _ContactListCubitStateError;
  factory ContactListCubitState.data({required List<ContactModel> contacts}) = _ContactListCubitStateData;
}
