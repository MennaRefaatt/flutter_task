
import '../../data/model/product_details_model.dart';
abstract class PDetailsRepoBase {
  Future<ProductDetailsModel> getProductDetails({required int productId});
}