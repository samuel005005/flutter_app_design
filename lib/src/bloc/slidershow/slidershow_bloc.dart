import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'slidershow_event.dart';
part 'slidershow_state.dart';

class SlidershowBloc extends Bloc<SlidershowEvent, SlidershowState> {
  SlidershowBloc() : super(SlidershowInitial()) {
    on<GetCurrentPage>(_onGetCurrentPage);
  }

  void _onGetCurrentPage(
      GetCurrentPage event, Emitter<SlidershowState> emit) async {
    emit(SlidershowGetPage(event.currentPage));
  }
}
