import 'package:bloc/bloc.dart';
import 'package:internship_project_itemstorage/src/data/models/product.dart';
import 'package:internship_project_itemstorage/src/data/models/stock.dart';
import 'package:internship_project_itemstorage/src/domain/usecases/add_amount.dart';
import 'package:internship_project_itemstorage/src/domain/usecases/add_stock.dart';
import 'package:internship_project_itemstorage/src/domain/usecases/get_matched_products.dart';
import 'package:internship_project_itemstorage/src/domain/usecases/get_stock.dart';
import 'package:meta/meta.dart';

part 'stock_event.dart';
part 'stock_state.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  final GetStockUseCase getStocks;
  final AddAmountUseCase updateStock;
  final AddStockUseCase addStock;
  final GetMatchedProductsUseCase getNames;
  StockBloc(this.addStock, this.getStocks, this.updateStock, this.getNames)
    : super(StockInitial()) {
    on<LoadStocks>((event, emit) async {
      try {
        emit(StockLoading());
        final stocks = await getStocks();
        final products = await getNames();
        if (stocks.isRight()) {
          emit(
            StockLoaded(
              stocks.getOrElse(() => []),
              products.getOrElse(() => []),
            ),
          );
        }
      } catch (e) {
        emit(StockError(e.toString()));
      }
    });
    on<AddStock>((event, emit) async {
      try {
        emit(StockLoading());
        final result = await addStock(event.stock);
        result.fold(
          (failure) => emit(StockError(failure.toString())),
          (_) => add(LoadStocks()),
        );
      } catch (e) {
        emit(StockError(e.toString()));
      }
    });
    on<AmountStock>((event, emit) async {
      try {
        emit(StockLoading());
        final result = await updateStock(event.gtin, event.newQuantity);
        result.fold((failure) => emit(StockError(failure.toString())), (
          _,
        ) async {
          await Future.delayed(const Duration(milliseconds: 300));
          add(LoadStocks());
        });
      } catch (e) {
        emit(StockError(e.toString()));
      }
    });
  }
}
