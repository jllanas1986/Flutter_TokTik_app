import 'package:flutter/material.dart';
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:toktik/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';
import 'package:provider/provider.dart';
import 'package:toktik/presentation/screens/discover/provider/discover_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final videoPostsRepository = VideoPostsRepositoryImpl(
      videosDatasource: LocalVideoDatasource());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false, create: (_) => DiscoverProvider(videosRepository: videoPostsRepository) ..loadNextPage()
          ),
      ],
      child: MaterialApp(
          title: 'TokTik',
          debugShowCheckedModeBanner: false,
          theme: AppTheme().getTheme(),
          home: const DiscoverScreen()),
    );
  }
}
