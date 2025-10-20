import 'package:flutter_cache_manager/flutter_cache_manager.dart';

final customCacheManager = CacheManager(
  Config(
    'movieImageCache',
    stalePeriod: const Duration(days: 7),
    maxNrOfCacheObjects: 100, // Limit
  ),
);
