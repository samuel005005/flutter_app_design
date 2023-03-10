import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

const listrProducts = <String>['Microfono', 'Partalnte', 'Teclado', 'Camara'];

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<GetProducts>(_onGetProducts);
  }

  void _onGetProducts(GetProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(const LoadedProducts(products: listrProducts));
  }
}
