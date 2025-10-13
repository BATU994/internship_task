import 'package:bloc/bloc.dart';
import 'package:internship_project_itemstorage/core/enums/stockOperation.dart';
import 'package:internship_project_itemstorage/data/models/stock.dart';
import 'package:internship_project_itemstorage/domain/usecases/add_amount.dart';
import 'package:internship_project_itemstorage/domain/usecases/add_stock.dart';
import 'package:internship_project_itemstorage/domain/usecases/get_stock.dart';
import 'package:meta/meta.dart';

part 'stock_event.dart';
part 'stock_state.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  final GetStockUseCase getStocks;
  final AddAmountUseCase updateStock;
  final AddStockUseCase addStock;
  StockBloc(this.addStock, this.getStocks, this.updateStock)
    : super(StockInitial()) {
    on<LoadStocks>((event, emit) async {
      try {
        emit(StockLoading());
        final stocks = await getStocks();
        if (stocks.isRight()) {
          emit(StockLoaded(stocks.getOrElse(() => [])));
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
        final result = await updateStock(
          event.gtin,
          event.amount,
          event.operation,
        );
        result.fold(
          (failure) => emit(StockError(failure.toString())),
          (_) => add(LoadStocks()),
        );
      } catch (e) {
        emit(StockError(e.toString()));
      }
    });
  }
}
