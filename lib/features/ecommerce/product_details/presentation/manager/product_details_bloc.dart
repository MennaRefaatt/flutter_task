import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../data/model/product_details_model.dart';
import '../../data/repo_impl/pdetails_repo_impl.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final PDetailsRepoImpl pDetailsRepoImpl;

  ProductDetailsBloc({required this.pDetailsRepoImpl}) : super(ProductDetailsInitial()) {
    on<FetchProductDetailsEvent>((event, emit) async {
      emit(ProductDetailsLoading());
      final response = await pDetailsRepoImpl.getProductDetails(productId: event.productId);
      if (response.status == true) {
        emit(ProductDetailsSuccess(productDetailsModel: response));
      } else {
        emit(ProductDetailsError(error: response.data.toString()));
      }
    });
  }
}
