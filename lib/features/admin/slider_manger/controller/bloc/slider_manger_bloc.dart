import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'slider_manger_event.dart';
part 'slider_manger_state.dart';

class SliderMangerBloc extends Bloc<SliderMangerEvent, SliderMangerState> {
  SliderMangerBloc() : super(SliderMangerInitial()) {
    on<SliderMangerEvent>(
      (event, emit) {
        switch (event) {
          case AddImage():
            {}
            break;
          case DeleteImage():
            {}
            break;
        }
      },
    );
  }
}
