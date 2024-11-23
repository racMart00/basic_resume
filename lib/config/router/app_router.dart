import "package:go_router/go_router.dart";

import "package:basic_resume/presentation/presentation.dart";

final appRouter = GoRouter(
  initialLocation: '/0', // default: /0
  routes: [

    GoRoute(
      path: '/',
      redirect: ( _ , __ ) => '/0', // default: /0
    ),

    GoRoute(
      path: '/:page',
      builder: (context, state) {
        final pageIndex = int.parse( state.pathParameters['page'] ?? '0' );

        return LayoutTemplate( pageIndex: pageIndex );
      },
      routes: [

      ]
    ),

  ]
);