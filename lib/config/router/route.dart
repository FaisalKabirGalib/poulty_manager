import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poulty_manager/feature/amar_taka/ui/pages/bank_hishab/bank_hishab_screen.dart';
import 'package:poulty_manager/feature/amar_taka/ui/pages/joma_uttolon/joma_uttolon_screen.dart';
import 'package:poulty_manager/feature/amar_taka/ui/pages/payment_receive/payment_receive_screen.dart';
import 'package:poulty_manager/feature/amar_taka/ui/pages/recent_transaction/recent_transaction.dart';
import 'package:poulty_manager/feature/intro_screens/onboarding_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../feature/amar_taka/ui/my_account_home.dart';
import '/config/router/router_refresh_stream.dart';
import '/feature/InfoUpdate/ui/pages/form.dart';
import '/feature/Medicine/presentation/page/page.dart';
import '/feature/auth/data/remote/remote.dart';
import '/feature/auth/pages/pages.dart';
import '/feature/auth/pages/registation/account_complete_form.dart';
import '/feature/daily_advice/presentation/pages/daily_advice.dart';
import '/feature/doctor_visit/presentation/pages/pages.dart';
import '/feature/firm/ui/page/add_firm_page.dart';
import '/feature/home/fragment.dart';
import '/feature/report/ui/page/report.dart';
import '/feature/vaccine/presentation/pages/pages.dart';
import '../../feature/batch/presentation/page/Home/home.dart';
import '../../feature/batch/presentation/page/page.dart';

part 'route.g.dart';

enum AppRouteName {
  onboarding,
  intro,

  main,
  home,
  market,
  report,
  settings,
  allComponents,
  batch,
  newBatch,
  batchList,
  myAccount,

  // Auth
  login,
  register,
  otp,
  accountComplete,

  // Amar Taka Routes
  recentTransactions,
  jomaUttolon,
  paymentReceive,
  bankHishab,
}

@Riverpod(keepAlive: true)
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = ref.watch(authRepositoryProvider).currentUser != null;
      final path = state.uri.path;
      if (isLoggedIn) {
        if (path.contains("auth")) {
          return '/';
        }
        return null;
      } else {
        if (!path.contains("auth")) {
          return '/auth/login';
        }

        return null;
      }
    },
    refreshListenable: GoRouterRefreshStream(
      ref.read(authRepositoryProvider).authStateChanges(),
    ),
    routes: [
      GoRoute(
        path: '/',

        builder: (context, state) => const HomeFragments(),
        routes: [
          // Authentication Routes
          GoRoute(
            path: 'auth',
            builder: (context, state) => Container(),
            routes: [
              GoRoute(
                name: AppRouteName.login.name,
                path: 'login',
                builder: (context, state) => const SignInPage(),
              ),
              GoRoute(
                path: 'register',
                name: AppRouteName.register.name,
                builder: (context, state) => const RegistrationPhonePage(),
              ),
              GoRoute(
                path: 'otp',
                name: AppRouteName.otp.name,
                builder: (context, state) {
                  final uri = state.uri;
                  final phone = uri.queryParameters['phone'] ?? "no phone";
                  final otp = uri.queryParameters['otp'] ?? "no otp";
                  debugPrint("Phone:$phone OTP:$otp, path:${state.fullPath}");
                  return OTPEnterScreen(
                    phone: phone,
                    otp: otp,
                  );
                },
              ),
              GoRoute(
                name: AppRouteName.accountComplete.name,
                path: 'account-complete',
                builder: (context, state) {
                  final uri = state.uri;
                  final phone = uri.queryParameters['phone'] ?? "no phone";
                  final otp = uri.queryParameters['otp'] ?? "no otp";
                  return AccountCompleteForm(
                    phone: phone,
                    otp: otp,
                  );
                },
              ),
            ],
          ),

          // Batch Routes
          GoRoute(
            path: 'firm',
            builder: (context, state) => const AddNewFirmPage(),
            routes: [
              GoRoute(
                path: ':id',
                builder: (context, state) {
                  final id = state.pathParameters['id'] ?? "0";
                  debugPrint("Firm ID: $id");
                  return const HomeFragments();
                },
                routes: [
                  GoRoute(
                    path: 'batch',
                    name: AppRouteName.batchList.name,
                    builder: (context, state) {
                      return BatchMainHome(
                        firmId: state.pathParameters['id'] ?? "0",
                      );
                    },
                    routes: [
                      GoRoute(
                        path: 'new',
                        builder: (context, state) {
                          return NewBatchForm(
                            firmId: state.pathParameters['id'] ?? "0",
                          );
                        },
                      ),
                      GoRoute(
                        path: 'show',
                        builder: (context, state) => const NewBatchShow(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: 'info-update/:id',
            builder: (context, state) {
              final id = state.pathParameters['id'] ?? "0";
              return BatchInfoUpdateFormPage(batchId: id);
            },
          ),

          // Vaccine Routes
          GoRoute(
            path: 'vaccine/:id',
            builder: (context, state) => const VaccineHomePage(),
            routes: const [],
          ),
          GoRoute(
            path: 'medicine/:id',
            builder: (context, state) => const MedicineShow(),
            routes: [
              GoRoute(
                path: 'new',
                builder: (context, state) => const MedicineDetails(),
              ),
            ],
          ),
          GoRoute(
            path: 'doctor-visit/:id',
            builder: (context, state) =>
                DoctorVisitShow(state.pathParameters['id'] ?? "0"),
            routes: [
              GoRoute(
                path: 'new',
                builder: (context, state) => DoctorVisitForm(
                  batchId: state.pathParameters['id'] ?? "0",
                ),
              ),
            ],
          ),
          GoRoute(
            path: 'daily-advice/:id',
            builder: (context, state) => const DailyAdvice(),
          ),
          GoRoute(
            path: 'report/:id',
            builder: (context, state) =>
                ReportGeneration(state.pathParameters['id'] ?? "0"),
          ),

          // My Account - Amar Taka
          GoRoute(
            name: AppRouteName.myAccount.name,
            path: 'my-account',
            builder: (context, state) => const MyAccountHomePage(),
            routes: [
              GoRoute(
                name: AppRouteName.recentTransactions.name,
                path: 'recent-transactions',
                builder: (context, state) => const RecentTransactionScreen(),
              ),
              GoRoute(
                name: AppRouteName.jomaUttolon.name,
                path: 'joma-uttolon',
                builder: (context, state) => const JomaUttolonScreen(),
              ),
              GoRoute(
                name: AppRouteName.paymentReceive.name,
                path: 'payment-receive',
                builder: (context, state) => const PaymentReceiveScreen(),
              ),
              GoRoute(
                name: AppRouteName.bankHishab.name,
                path: 'bank_hishab',
                builder: (context, state) => const BankHishabScreen(),
              ),
            ],
          ),
        ],
        // builder: (context, state) => const DailyAdvicePage(),
      ),
    ],
  );
}
