import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/data/models/recipe_response.dart';
import 'package:recipe_app/styles/colors.dart';
import 'package:recipe_app/styles/text_style.dart';
import 'package:shimmer/shimmer.dart';

class DetailRecipePage extends StatefulWidget {
  final RecipeResponse? recipeResponse;
  const DetailRecipePage({super.key, @required this.recipeResponse});

  @override
  State<DetailRecipePage> createState() => _DetailRecipePageState();
}

class _DetailRecipePageState extends State<DetailRecipePage> {
  ScrollController? _scrollController;
  bool lastStatus = true;

  _scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  bool get isShrink {
    return _scrollController!.hasClients &&
        _scrollController!.offset > (160 - kToolbarHeight);
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController!.addListener(() {
      setState(() {
        _scrollListener();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            elevation: 0,
            backgroundColor: kPrussianBlue,
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.23,
            floating: true,
            centerTitle: false,
            title: Text(
              isShrink ? '${widget.recipeResponse!.strMeal}' : '',
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            titleSpacing: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(
                      children: [
                        Center(
                          child: CachedNetworkImage(
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                            imageUrl: widget.recipeResponse!.strMealThumb ?? "",
                            placeholder: (context, url) => Center(
                                child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                color: Colors.white,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            )),
                            errorWidget: (context, url, error) => Image.asset(
                              'assets/images/default_image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SafeArea(
                      child: Container(
                    height: 15,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 25,
                          blurRadius: 30,
                          offset:
                              const Offset(0, 4), // changes position of shadow
                        ),
                      ],
                      // color: ColorPalette.neutral_9054
                    ),
                  )),
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.recipeResponse!.strMeal!,
                    style: kTitleMedium,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/ic_pin.png',
                        width: 15,
                        color: kGreySoft,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        widget.recipeResponse!.strArea!,
                        style: kBodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Category : ${widget.recipeResponse!.strCategory!}",
                    style: kBodySmall,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Instructions',
                    style: kTitleMSmall,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.recipeResponse!.strInstructions!,
                    textAlign: TextAlign.justify,
                    style: kBodySmall,
                  ),
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }
}
