import 'package:crafty_bay/data/models/user_info_model.dart';
import 'package:crafty_bay/presentation/state_holders/complete_profile_controller.dart';
import 'package:crafty_bay/presentation/state_holders/create_review_screen_controller.dart';
import 'package:crafty_bay/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateReviewScreen extends StatefulWidget {
  final int productId;

  const CreateReviewScreen({
    super.key,
    required this.productId,
  });

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _reviewTEController = TextEditingController();

  UserInfoModel userInfoModel = UserInfoModel();

  @override
  void initState() {
    super.initState();
    requestUserData();
  }

  Future<void> requestUserData() async {
    userInfoModel = await Get.find<CompleteProfileController>().getUserData();

    _nameTEController.text = userInfoModel.cusName ?? "Not Specified";
    _emailTEController.text = userInfoModel.user?.email ?? "Not Specified";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Review"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: _buildReviewForm(),
        ),
      ),
    );
  }

  Form _buildReviewForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 60),
            TextFormField(
              controller: _nameTEController,
              decoration: const InputDecoration(
                hintText: "Name",
              ),
              // readOnly: true,
              enabled: false,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailTEController,
              decoration: const InputDecoration(
                hintText: "Email",
              ),
              // readOnly: true,
              enabled: false,
            ),
            const SizedBox(height: 16),
            TextFormField(
              maxLines: 8,
              controller: _reviewTEController,
              decoration: const InputDecoration(
                hintText: "Write Review",
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.maxFinite,
              child: GetBuilder<CreateReviewScreenController>(
                  builder: (createReviewScreenController) {
                return (createReviewScreenController.inProgress)
                    ? const Center(child: CircularProgressIndicator())
                    : FilledButton(
                        onPressed: () async {
                          await createReviewScreenController.submitReview(
                            reviewDescription:
                                _reviewTEController.text.trim().toString(),
                            productId: widget.productId,
                          );
                          Get.snackbar("", "Submitted");
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            AppColors.primaryColor,
                          ),
                        ),
                        child: const Text("Submit"),
                      );
              }),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _nameTEController.dispose();
    _emailTEController.dispose();
    _reviewTEController.dispose();
  }
}
