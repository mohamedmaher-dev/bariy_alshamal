import 'package:bariy_alshamal/core/utils/popup_loading_manger.dart';
import 'package:bariy_alshamal/core/utils/print.dart';
import 'package:bariy_alshamal/features/admin/orders/presntation/data/models/orders_list_model.dart';
import 'package:bariy_alshamal/features/admin/orders/presntation/data/rebo/orders_rebo.dart';
import 'package:bariy_alshamal/features/admin/orders/presntation/data/rebo/rebos/orders_remote_rebo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrderRebo orderRebo = OrdersRemoteRebo();
  late OrdersListModel orders;
  OrdersBloc() : super(OrdersInitial()) {
    on<OrdersEvent>((event, emit) async {
      switch (event) {
        case OrdersInitEvent():
          {
            await getOrders(emit);
          }
        case DeleteOrderEvent():
          {
            PopUpLoading.loading();
            try {
              await orderRebo.deleteOrder(orderID: event.orderID);
              await getOrders(emit);
              PopUpLoading.success("تم حذف المنتج بنجاح");
            } catch (e) {
              PopUpLoading.error("حدث خطأ ما");
            }
          }
      }
    });
  }

  Future<void> getOrders(Emitter<OrdersState> emit) async {
    emit(OrdersLoading());
    try {
      orders = OrdersListModel.fromList(data: await orderRebo.getOrders());
      if (orders.list.isEmpty) {
        emit(OrdersEmpty());
      } else {
        emit(OrdersSuccess());
      }
    } catch (e) {
      DebugPrint.error(e.toString());
      emit(OrdersFailed());
    }
  }
}
