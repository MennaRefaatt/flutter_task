import '../../../../../core/helpers/safe_print.dart';
import '../../domain/repo_base/pdetails_repo_base.dart';
import '../data_source/ds_product_details_remote.dart';
import '../model/product_details_model.dart';

class PDetailsRepoImpl implements PDetailsRepoBase{
final DSProductDetailsRemote dsProductDetailsRemote;
PDetailsRepoImpl({required this.dsProductDetailsRemote});

  @override
  Future<ProductDetailsModel> getProductDetails({required int productId}) async {
    final response = await dsProductDetailsRemote.getProductDetails(productId: productId);
    if(response.status == true){
      safePrint(response);
      return response;
    } else {
      return response;
    }
  }
}