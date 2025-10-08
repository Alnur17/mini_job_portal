import 'dart:convert';
import 'package:get/get.dart';
import 'package:mini_job_portal/app/modules/home/model/products_model.dart';

import '../../../../common/helper/local_store.dart';

class SavedJobsController extends GetxController {
  RxList<Product> savedJobs = <Product>[].obs;
  final String storageKey = 'saved_jobs';

  @override
  void onInit() {
    super.onInit();
    loadSavedJobs(); // ✅ Load on app start
  }

  void addJob(Product job) {
    if (!savedJobs.any((j) => j.id == job.id)) {
      savedJobs.add(job);
      saveJobsToLocal();
      Get.snackbar('Saved', '${job.title} added to Saved Jobs');
    } else {
      Get.snackbar('Already Saved', '${job.title} is already in Saved Jobs');
    }
  }

  void removeJob(Product job) {
    savedJobs.removeWhere((j) => j.id == job.id);
    saveJobsToLocal();
    Get.snackbar('Removed', '${job.title} removed from Saved Jobs');
  }

  // ✅ Save list locally
  void saveJobsToLocal() {
    final List<Map<String, dynamic>> jsonList =
    savedJobs.map((job) => job.toJson()).toList();
    LocalStorage.saveData(key: storageKey, data: jsonEncode(jsonList));
  }

  // ✅ Load list from local
  void loadSavedJobs() {
    final savedData = LocalStorage.getData(key: storageKey);
    if (savedData != null) {
      final List<dynamic> decodedList = jsonDecode(savedData);
      savedJobs.assignAll(decodedList.map((e) => Product.fromJson(e)).toList());
    }
  }

  // Optional: clear all saved jobs
  void clearAllJobs() {
    savedJobs.clear();
    LocalStorage.removeData(key: storageKey);
  }
}
