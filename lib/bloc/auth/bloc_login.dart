import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/api.dart';
import '../../config/path/api_path.dart';

import '../event_bloc.dart';
import '../state_bloc.dart';

class BlocLogin extends Bloc<EventBloc, StateBloc> {
  BlocLogin() : super(StateBloc());

  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is LoginApp) {
      yield Loading();
      try {
        Map<String, dynamic> req = {};
        req['id'] = event.id;
        req['password'] = event.password;
        var res = await Api.postAsync(
          endPoint: ApiPath.login,
          req: req,
          isToken: false,
        );
        print(res);
        if (res['status'] == 1) {
        } else if (res['status'] == 0) {
          yield LoadFail(error: res['errors']['login'] ?? "Lỗi kết nối");
        }
      } on DioError catch (e) {
        yield LoadFail(error: e.error.error);
      } catch (e) {
        print(e);
        yield LoadFail(error: e.toString());
      }
    }
  }
}
