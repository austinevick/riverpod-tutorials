import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum City {
  lagos,
  oyo,
  akure,
}

typedef WeatherEmoji = String;
Future<WeatherEmoji> getWeather(City city) {
  return Future.delayed(const Duration(seconds: 2),
      () => {City.lagos: "❄", City.akure: "🌧", City.oyo: "☀"}[city]!);
}

final currentCityWeather = StateProvider<City?>((ref) => null);
final weatherFutureProvider = FutureProvider<String>((ref) {
  final city = ref.watch(currentCityWeather);
  if (city != null) {
    return getWeather(city);
  }
  return '';
});

class FutureProviderDemo extends ConsumerWidget {
  const FutureProviderDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 35),
          ref.watch(weatherFutureProvider).when(
              data: (data) => Center(
                    child: Text(data),
                  ),
              error: (e, t) => Container(),
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  )),
          Expanded(
              child: ListView.builder(
                  itemCount: City.values.length,
                  itemBuilder: (ctx, i) {
                    final city = City.values[i];
                    final isSelected = city == ref.watch(currentCityWeather);
                    return ListTile(
                      leading: const Icon(Icons.place),
                      title: Text(city.name.toUpperCase()),
                      trailing: isSelected ? const Icon(Icons.check) : null,
                      onTap: () =>
                          ref.read(currentCityWeather.notifier).state = city,
                    );
                  }))
        ],
      ),
    );
  }
}
