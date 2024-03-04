import 'package:app_testing_hhru/repositories/cripto_coin_r/models/cripto_coin.dart';
import 'package:flutter/material.dart';

class CriptoCoinTile extends StatelessWidget {
  const CriptoCoinTile({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Image.network(coin.imageUrl),
      title: Text(
        coin.name,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        '${coin.priceInUSD}\$',
        style: theme.textTheme.labelSmall,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed('/count', arguments: coin);
      },
    );
  }
}
