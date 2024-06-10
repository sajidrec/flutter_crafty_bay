import 'package:crafty_bay/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _reviewTEController = TextEditingController();

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
              controller: _firstNameTEController,
              decoration: const InputDecoration(
                hintText: "First Name",
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _lastNameTEController,
              decoration: const InputDecoration(
                hintText: "Last Name",
              ),
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
              child: FilledButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    AppColors.primaryColor,
                  ),
                ),
                child: const Text("Submit"),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _reviewTEController.dispose();
  }
}
