import 'package:bariy_alshamal/core/utils/app_manger.dart';
import 'package:bariy_alshamal/core/utils/print.dart';
import 'package:bariy_alshamal/features/admin/orders/presntation/data/models/orders_list_model.dart';
import 'package:bariy_alshamal/features/my_orders/data/models/my_orders_list_model.dart';
import 'package:bariy_alshamal/features/my_orders/data/rebo/my_orders_rebo.dart';
import 'package:bariy_alshamal/features/my_orders/data/rebo/rebos/my_orders_remote_rebo.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'my_orders_event.dart';
part 'my_orders_state.dart';

class MyOrdersBloc extends Bloc<MyOrdersEvent, MyOrdersState> {
  MyOrdersRebo rebo = MyOrdersRemoteRebo();
  late MyOrdersListModel orders;
  late OrdersListModel adminOrderModel;
  MyOrdersBloc() : super(MyOrdersInitial()) {
    on<MyOrdersEvent>((event, emit) async {
      switch (event) {
        case MyOrdersInitEvent():
          {
            if (AppManger.isLogin) {
              emit(MyOrdersLoading());
              try {
                List<QueryDocumentSnapshot<Map<String, dynamic>>> data =
                    await rebo.getMyOrders();
                orders = MyOrdersListModel.fromList(data: data);
                adminOrderModel = OrdersListModel.fromList(data: data);
                if (orders.list.isEmpty) {
                  emit(MyOrdersEmpty());
                } else {
                  emit(MyOrdersSeccess());
                }
              } catch (e) {
                emit(MyOrdersFailed());
                DebugPrint.error(e.toString());
              }
            } else {
              emit(MyOrdersNeedLoging());
            }
          }
      }
    });
  }
}
