import 'package:deez_notes/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GoRouter router;

  AppRouter()
      : router = GoRouter(
          initialLocation: '/',
          routes: [
            GoRoute(
              path: '/',
              pageBuilder: (context, state) => AppTransitionPage(
                key: state.pageKey,
                child: const SplashScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(-1, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  );
                },
              ),
            ),
            GoRoute(
              path: '/notes',
              pageBuilder: (context, state) => AppTransitionPage(
                key: state.pageKey,
                child: const HomeScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(-1, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  );
                },
              ),
            ),
            GoRoute(
              path: '/notes/:noteId',
              pageBuilder: (context, state) {
                final noteId = state.pathParameters['noteId'];
                return AppTransitionPage(
                  key: state.pageKey,
                  child: NoteDetailScreen(noteId: noteId!),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(-1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    );
                  },
                );
              },
            ),
            GoRoute(
              path: '/add-update-note',
              pageBuilder: (context, state) => AppTransitionPage(
                key: state.pageKey,
                child: const AddUpdateNoteScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(-1, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  );
                },
              ),
            ),
          ],
        );
}

class AppTransitionPage extends CustomTransitionPage<void> {
  const AppTransitionPage({
    required LocalKey super.key,
    required super.child,
    required super.transitionsBuilder,
  }) : super(
          transitionDuration: const Duration(milliseconds: 200),
        );
}
