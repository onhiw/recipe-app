import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/presentation/bloc/recipe-bloc/recipe_bloc.dart';
import 'package:recipe_app/presentation/pages/page_detail_recipe.dart';
import 'package:recipe_app/presentation/widgets/flushbar_widget.dart';
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
        .add(GetEventRecipe()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrussianBlue,
        title: Text(
          'Recipe App',
          style: kHeading,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          return Future.microtask(() =>
              BlocProvider.of<RecipeBloc>(context, listen: false)
                  .add(GetEventRecipe()));
        },
        child: BlocListener<RecipeBloc, RecipeState>(
          listener: (context, state) {
            if (state is RecipeError) {
              flushbarError(state.message).show(context);
            }
          },
          child: BlocBuilder<RecipeBloc, RecipeState>(
            builder: (context, state) {
              if (state is RecipeLoading) {
                return const LoadingWidget();
              }
              if (state is RecipeLoaded) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(8),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      StaggeredGrid.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        children: [
                          ...state.recipeModel.data!
                              .map((recipe) => Card(
                                    elevation: 4,
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(8),
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return DetailRecipePage(
                                              recipeResponse: recipe);
                                        }));
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: recipe.thumb ?? "",
                                            width: double.infinity,
                                            height: 140,
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                Center(
                                                    child: Shimmer.fromColors(
                                              baseColor: Colors.grey[300]!,
                                              highlightColor: Colors.grey[100]!,
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft: Radius
                                                              .circular(8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8)),
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
                                                        topLeft:
                                                            Radius.circular(8),
                                                        topRight:
                                                            Radius.circular(8)),
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            errorWidget: (context, url,
                                                    error) =>
                                                ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    8),
                                                            topRight:
                                                                Radius.circular(
                                                                    8)),
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
                                                  recipe.name!,
                                                  style: kTitleMedium,
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/icons/ic_time.png',
                                                      width: 15,
                                                      color: kGreySoft,
                                                    ),
                                                    const SizedBox(
                                                      width: 4,
                                                    ),
                                                    Text(
                                                      recipe.time!,
                                                      style: kBodySmall,
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                  recipe.description!,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/error_state.jpg',
                        width: 250,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        state.message,
                        style: kError,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          Future.microtask(() => BlocProvider.of<RecipeBloc>(
                                  context,
                                  listen: false)
                              .add(GetEventRecipe()));
                        },
                        child: Container(
                          width: 150,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: kPrussianBlue,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                              'Refresh',
                              style: kButtonSmall,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
