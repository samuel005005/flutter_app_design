import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pinterest_state.dart';
part 'pinterest_event.dart';

class PinterestBloc extends Bloc<PinterestEvent, PinterestState> {
  PinterestBloc() : super(const PinterestInitial()) {
    on<ShowMenu>(_onShowMenu);
  }

  void _onShowMenu(ShowMenu event, emit) {
    emit(IsShowMenu(event.show));
  }
}
