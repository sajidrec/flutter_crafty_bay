import 'package:crafty_bay/data/models/review_model.dart';
import 'package:crafty_bay/presentation/screens/create_review_screen.dart';
import 'package:crafty_bay/presentation/state_holders/reviews_screen_controller.dart';
import 'package:crafty_bay/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({
    super.key,
    required this.productId,
  });

  final int productId;

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  final _reviewScreenController = Get.find<ReviewsScreenController>();

  List<ReviewModel> _reviewList = [];

  @override
  void initState() {
    super.initState();
    requestReviewList(productId: widget.productId);
  }

  Future<void> requestReviewList({
    required int productId,
  }) async {
    _reviewList = await _reviewScreenController.requestReviewList(
      productId: productId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reviews"),
        elevation: 3,
      ),
      body: Stack(
        children: [
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Column(
                children: [
                  Expanded(child: _buildReviewList()),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildReviewsFloatingButton(context),
          )
        ],
      ),
    );
  }

  Widget _buildReviewsFloatingButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.15),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GetBuilder<ReviewsScreenController>(builder: (_) {
              return Text(
                "Reviews (${_reviewList.length})",
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }),
            IconButton(
              color: AppColors.primaryColor,
              onPressed: () {
                Get.to(
                  () => CreateReviewScreen(
                    productId: widget.productId,
                  ),
                );
              },
              icon: const Icon(
                Icons.add_circle,
                size: 45,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewList() {
    return GetBuilder<ReviewsScreenController>(builder: (_) {
      return _reviewScreenController.inProgress
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              shrinkWrap: true,
              itemCount: _reviewList.length,
              itemBuilder: (context, index) => Column(
                children: [
                  Card(
                    elevation: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: double.maxFinite,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.person,
                                  size: 30,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  _reviewList[index].profile?.cusName ??
                                      "Unkown",
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              _reviewList[index].description ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Colors.grey.shade600,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  (index == _reviewList.length - 1)
                      ? const SizedBox(
                          height: 100,
                        )
                      : const SizedBox.shrink(),
                ],
              ),
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10,
                );
              },
            );
    });
  }
}
