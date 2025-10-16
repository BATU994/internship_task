import 'package:bloc/bloc.dart';
import 'package:internship_project_itemstorage/src/data/models/product.dart';
import 'package:internship_project_itemstorage/src/domain/usecases/add_product.dart';
import 'package:internship_project_itemstorage/src/domain/usecases/delete_product.dart';
import 'package:internship_project_itemstorage/src/domain/usecases/get_products.dart';
import 'package:internship_project_itemstorage/src/domain/usecases/update_product.dart';
import 'package:internship_project_itemstorage/src/presentation/blocs/storageBloc/stock_bloc.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final AddProductUseCase addProduct;
  final GetProductsUseCase getProducts;
  final UpdateProductUseCase updateProduct;
  final DeleteProductUseCase deleteProduct;
  final StockBloc stockBloc;
  ProductBloc(
    this.addProduct,
    this.getProducts,
    this.updateProduct,
    this.deleteProduct,
    this.stockBloc,
  ) : super(ProductInitial()) {
    on<LoadProducts>((event, emit) async {
      emit(ProductLoading());
      final result = await getProducts();
      result.fold(
        (failure) => emit(ProductError(failure.toString())),
        (products) => emit(ProductLoaded(products)),
      );
    });
    on<AddProduct>((event, emit) async {
      emit(ProductLoading());
      final result = await addProduct(event.product);
      result.fold((failure) => emit(ProductError(failure.toString())), (_) {
        emit(ProductAdded());
        add(LoadProducts());
        stockBloc.add(LoadStocks());
      });
    });
    on<UpdateProduct>((event, emit) async {
      emit(ProductLoading());
      final result = await updateProduct(event.product);
      result.fold(
        (failure) => emit(ProductError(failure.toString())),
        (_) => add(LoadProducts()),
      );
    });
    on<DeleteProduct>((event, emit) async {
      emit(ProductLoading());
      final result = await deleteProduct(event.gtin);
      result.fold(
        (failure) => emit(ProductError(failure.toString())),
        (_) => add(LoadProducts()),
      );
    });
  }
}
