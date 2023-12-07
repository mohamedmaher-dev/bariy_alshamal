import 'package:bariy_alshamal/core/utils/app_manger.dart';
import 'package:bariy_alshamal/features/my_orders/data/models/my_orders_list_model.dart';
import 'package:bariy_alshamal/features/my_orders/data/rebo/my_orders_rebo.dart';
import 'package:bariy_alshamal/features/my_orders/data/rebo/rebos/my_orders_remote_rebo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_orders_event.dart';
part 'my_orders_state.dart';

class MyOrdersBloc extends Bloc<MyOrdersEvent, MyOrdersState> {
  MyOrdersRebo rebo = MyOrdersRemoteRebo();
  late MyOrdersListModel orders;
  MyOrdersBloc() : super(MyOrdersInitial()) {
    on<MyOrdersEvent>((event, emit) async {
      switch (event) {
        case MyOrdersInitEvent():
          {
            if (AppManger.isLogin) {
              emit(MyOrdersLoading());
              try {
                orders = MyOrdersListModel.fromList(
                  data: await rebo.getMyOrders(),
                );
                if (orders.list.isEmpty) {
                  emit(MyOrdersEmpty());
                } else {
                  emit(MyOrdersSeccess());
                }
              } catch (e) {
                emit(MyOrdersFailed());
              }
            } else {
              emit(MyOrdersNeedLoging());
            }
          }
      }
    });
  }
}
