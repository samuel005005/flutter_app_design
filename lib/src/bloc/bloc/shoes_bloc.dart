import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shoes_event.dart';
part 'shoes_state.dart';

class ShoesBloc extends Bloc<ShoesEvent, ShoesState> {
  ShoesBloc() : super(const ShoesInitial()) {
    on<ChangeShoeSize>(onChangeSizeShoes);
  }

  onChangeSizeShoes(ChangeShoeSize event, Emitter<ShoesState> emit) {
    emit(ShoeSizeChanged(size: event.size));
  }
}
