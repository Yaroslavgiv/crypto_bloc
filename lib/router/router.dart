import '../features/cripto_coin/cripto_coin.dart';
import '../features/cripto_list/cripto_list.dart';

final routes =  {
        '/': (context) => const CriptoListScreen(),
        '/count': (context) => const CryptoCoinScreen(),
      };