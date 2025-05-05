import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_login/domain/db/database_helper.dart';
import 'package:ecommerce_app_login/domain/models/user_profile.dart';
import 'package:ecommerce_app_login/services/auth_services.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<FetchProfile>(_onFetchProfile);
    on<LogoutProfile>(_onLogoutProfile);
  }

  Future<void> _onFetchProfile(
    FetchProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      var email = await AuthService().getEmail();
      final profile = await DBHelper.getProfile(email);
      if (profile != null) {
        emit(ProfileLoaded(profile));
      } else {
        emit(ProfileError("Profile not found"));
      }
    } catch (e) {
      emit(ProfileError("Failed to load profile: $e"));
    }
  }

  void _onLogoutProfile(LogoutProfile event, Emitter<ProfileState> emit) {
    emit(ProfileInitial());
  }
}
