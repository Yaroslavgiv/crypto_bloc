
import 'package:dio/dio.dart';

import 'cripto_coin_r.dart';

class CriptoCoinsRepository implements AbstractCoinsRepository{  
  CriptoCoinsRepository({required this.dio});
  
  final Dio dio;

  
  
  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,BOLT,CANDY,CCRB,DAOC,EDU,FLOT&tsyms=USD');

    // получаем ответ в переменную data приводим в String, dynamic
    final data = response.data as Map<String, dynamic>;
    // достаним данные из RAW
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    // переводим Map в List вызвав entries(значения) и приводим к списку
    final criptoCoinsList = dataRaw.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      // теперь можем обратится к полям
      final price = usdData['PRICE'];
      final imageUrl = usdData['IMAGEURL'];
      return CryptoCoin(
        name: e.key,
        priceInUSD: price,
        imageUrl: 'https://www.cryptocompare.com/$imageUrl',
      );
    }).toList();
    return criptoCoinsList;
  }
}
