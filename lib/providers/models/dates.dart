import 'package:acar/services/dates.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateApiProvider = Provider<DatesApiService>((ref) => DatesApiService());
