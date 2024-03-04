
import 'package:app_testing_hhru/repositories/cripto_coin_r/cripto_coin_r.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cpypto_list_event.dart';
part 'cpypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsRepository) : super(CryptoListInitial()) {
    on<LosdCryptoList>((event, emit) async {
      try {
        final coinsList = await coinsRepository.getCoinsList();
        emit(CryptoListLoaded(coinsList: coinsList));
      } catch (e) {
        emit(CryptoListLoadingFalure(exception: e));
      }
    });
  }

  final AbstractCoinsRepository coinsRepository;
}
