import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mechanic_baato/src/features/repair_request/data/repair_request_repository/fake_repair_request_repository.dart';

abstract class RepairRequestRepository {
  Future<dynamic> fetchVechicleRepairRequest(String repairRequestId);
  Future<dynamic> requestForVehicleRepair(Map<String, dynamic> requestInfo);
  Future<dynamic> addImagesToRepairRequest(
      String repairRequestId, List<File> images);
  Future<dynamic> fetchUserRepairRequest(String userId);
}

final repairRequestRepositoryProvider =
    Provider((ref) => FakeRepairRequestRepository());
// Provider((ref) => APIRepairRequestRepository());

