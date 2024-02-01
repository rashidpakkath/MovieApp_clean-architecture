import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/login_constans.dart';
import 'package:movie_app/feature/featue_api/presentation/provaider/movie_provaider.dart';
import 'package:movie_app/feature/featue_api/presentation/widgets/gridview_widget.dart';
import 'package:movie_app/feature/featue_api/presentation/widgets/searchview_widget.dart';
import 'package:movie_app/feature/feature_create/presentation/widgets/textfield_widget.dart';

class SearchPage extends ConsumerWidget {
  static const routePath = '/search';
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(loginConstansProvider);
    final searchController =
        ref.read(movieProvaiderProvider.notifier).searchController;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text('Search Movie'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFieldWidget(
              labelText: data.search,
              iconData: Icon(Icons.search),
              controller: searchController,
            ),
            ElevatedButton(
              onPressed: () async {
                await ref
                    .read(movieProvaiderProvider.notifier)
                    .searchMovie(searchController.text, context);
              },
              child: Text("Search"),
            ),
            Builder(
              builder: (context) {
                return ref.watch(movieProvaiderProvider).when(data: (data) {
                  return data.searchMovie == null
                      ? Center(
                          child: TextButton(
                              onPressed: () {
                                ref
                                    .read(movieProvaiderProvider.notifier)
                                    .searchMovie(
                                        searchController.text, context);
                              },
                              child: const Text(
                                "No data available",
                                style: TextStyle(color: Colors.white),
                              )),
                        )
                      : Column(
                          children: [
                            Column(
                              children: [
                                SearchViewWidget(entity: data.searchMovie!),
                              ],
                            ),
                          ],
                        );
                }, error: (error, stackTrace) {
                  return Center(
                    child: Text("NO DATA"),
                  );
                }, loading: () {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
