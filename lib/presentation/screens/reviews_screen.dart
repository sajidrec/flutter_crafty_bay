import 'package:crafty_bay/presentation/screens/create_review_screen.dart';
import 'package:crafty_bay/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({
    super.key,
    required int productId,
  });

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
            Text(
              "Reviews (1000)",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            IconButton(
              color: AppColors.primaryColor,
              onPressed: () {
                Get.to(const CreateReviewScreen());
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
    return ListView.separated(
      shrinkWrap: true,
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
                          "Sajid Hossain",
                          style: Theme.of(context).textTheme.headlineMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "dummy text any thign kca, bealk asdklflskadjfklsdajflksjadfkljsdalkfj asdlkfjkalsdfjlksadjfkl jlkasdjfkl jasdklfj lkasjdflk jaskldfj lkd ",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.grey.shade600,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // TODO: When implementing api must change this hard coded logic
          (index == 9)
              ? const SizedBox(
                  height: 100,
                )
              : const SizedBox.shrink(),
        ],
      ),
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 10,
        );
      },
    );
  }
}
