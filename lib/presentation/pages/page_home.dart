import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/presentation/bloc/recipe-bloc/recipe_bloc.dart';
import 'package:recipe_app/presentation/widgets/loading_widget.dart';
import 'package:recipe_app/styles/colors.dart';
import 'package:recipe_app/styles/text_style.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingNameRecipe = TextEditingController();
  @override
  void initState() {
    Future.microtask(() => BlocProvider.of<RecipeBloc>(context, listen: false)
        .add(GetEventRecipe('a')));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrussianBlue,
        title: Text(
          'Recipe App',
          style: kHeading,
        ),
      ),
      body: BlocBuilder<RecipeBloc, RecipeState>(
        builder: (context, state) {
          if (state is RecipeLoading) {
            return const LoadingWidget();
          }
          if (state is RecipeLoaded) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  StaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    children: [
                      ...state.recipeModel.meals!
                          .map((recipe) => Card(
                                elevation: 4,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(8),
                                  onTap: () {},
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: recipe.strMealThumb ?? "",
                                        width: double.infinity,
                                        height: 140,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) => Center(
                                            child: Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[100]!,
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(8),
                                                  topRight: Radius.circular(8)),
                                            ),
                                            width: double.infinity,
                                            height: 140,
                                          ),
                                        )),
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft: Radius.circular(8),
                                                    topRight:
                                                        Radius.circular(8)),
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(8),
                                                        topRight:
                                                            Radius.circular(8)),
                                                child: Image.asset(
                                                  "assets/images/default_image.png",
                                                  fit: BoxFit.cover,
                                                  width: double.infinity,
                                                  height: 140,
                                                )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              recipe.strMeal!,
                                              style: kTitleMedium,
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.location_on,
                                                  color: kGreySoft,
                                                  size: 15,
                                                ),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  recipe.strArea!,
                                                  style: kBodySmall,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              recipe.strInstructions!,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: kBodySmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                          .toList()
                    ],
                  ),
                ],
              ),
            );
          }
          if (state is RecipeError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
