import 'package:bariy_alshamal/features/admin/users/presntation/data/models/users_list_model.dart';
import 'package:bariy_alshamal/features/admin/users/presntation/data/rebos/rebos/users_remote_rebo.dart';
import 'package:bariy_alshamal/features/admin/users/presntation/data/rebos/users_rebo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersRebo usersRebo = UsersRemoteRebo();
  late UsersListModel users;
  UsersBloc() : super(UsersInitial()) {
    on<UsersEvent>((event, emit) async {
      switch (event) {
        case UsersInitEvent():
          {
            emit(UsersLoading());
            try {
              users = UsersListModel.fromList(data: await usersRebo.getUsers());
              if (users.list.isEmpty) {
                emit(UsersEmpty());
              } else {
                emit(UsersSuccess());
              }
            } catch (e) {
              emit(UsersFailed());
            }
          }
          break;
      }
    });
  }
}
