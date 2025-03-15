import 'package:bloc/bloc.dart';
import 'package:first_app_filter/models/product_model.dart';
import 'package:meta/meta.dart';
import '../../dio/api_provider.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial()){
    getPoduct();
  }
  ProductsModel? productsModel;
  getPoduct() async{
    try{
      emit(ProductLoading());
      productsModel = await ApiProvider().getProducts();
      emit(ProductSuccess(productsModel));
    }catch(e){
      emit(ProductError(e.toString()));
    }
  }


}