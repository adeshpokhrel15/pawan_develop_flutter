import 'dart:io';

import 'package:go_router/go_router.dart';
import 'package:mechanic_baato/src/features/auth/presentation/login/login_screen.dart';
import 'package:mechanic_baato/src/features/repair_progress/repair_progress_screen.dart';
import 'package:mechanic_baato/src/features/review/review_mechanic_screen.dart';
import 'package:mechanic_baato/src/utils/data_types/string_or_audio.dart';

enum appRoute {
  categories,
  vehicles,
  parts,
  requestMechanic,
  auth,
  feedback,
  history,
  payment,
  mechanicProfile,
  reviewsAndRating,
  splash,
  trackMechanic,
  supportChat,
  repairProgress,
  recentRepairs,
  home,
  login,
  signup,
  ReviewMechanic,
}

final repairSteps = [
  RepairStep(
      name: 'Inception',
      detail: AudioData(File('audio/sample_audio.mp3')),
      status: 'Completed',
      report: RepairStepReport(reportFields: [])),
  RepairStep(
      name: 'Step 2 details',
      detail: StringData("Did the inception"),
      status: 'In Progress'),
  // Add more steps as needed
];

GoRouter goRouter() {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        // path: '/splash',
        path: '/',
        name: appRoute.splash.name,
        // builder: (context, state) => const SplashScreen(),
        // builder: (context, state) => RepairProgressScreen(
        //   repairSteps: repairSteps,
        // ),
        builder: (context, state) => LoginScreen(),
        // builder: (context, state) => const TrackMechanicScreen(),

        // builder: (context, state) => VehicleCategoryScreen(),
      ),
      GoRoute(
        path: '/login',
        name: appRoute.login.name,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: '/review_mechanic',
        name: appRoute.ReviewMechanic.name,
        builder: (context, state) => ReviewMechanicScreen(),
      ),
    ],
  );
}
