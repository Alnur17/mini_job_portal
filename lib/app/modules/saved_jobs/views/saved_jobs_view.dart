import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/saved_jobs_controller.dart';

class SavedJobsView extends GetView<SavedJobsController> {
  const SavedJobsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SavedJobsView'),
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text(
          'SavedJobsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
