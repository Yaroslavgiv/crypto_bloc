part of 'cpypto_list_bloc.dart';

abstract class CryptoListState {}

class CryptoListInitial extends CryptoListState {}

class CryptoListLoading extends CryptoListState {}

class CryptoListLoaded extends CryptoListState {
  CryptoListLoaded({required this.coinsList});

  final List<CryptoCoin> coinsList;
}

class CryptoListLoadingFalure extends CryptoListState {
  CryptoListLoadingFalure({this.exception});

  final Object? exception;

  
}
