import 'package:crafty_bay/data/models/create_profile_model.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:crafty_bay/presentation/screens/main_bottom_nav_bar_screen.dart';
import 'package:crafty_bay/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({
    super.key,
  });

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _shippingAddressTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 24),
                const AppLogo(),
                const SizedBox(height: 16),
                Text('Complete Profile', style: textTheme.headlineLarge),
                const SizedBox(height: 4),
                Text('Get started with us by providing your details',
                    style: textTheme.headlineSmall),
                const SizedBox(height: 24),
                _buildCompleteProfileForm(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCompleteProfileForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if ((value?.length ?? 0) < 3) {
                return "Must be at least 3 letters long";
              }
              return null;
            },
            controller: _firstNameTEController,
            decoration: const InputDecoration(hintText: 'First name'),
          ),
          const SizedBox(height: 8),
          TextFormField(
            validator: (value) {
              if ((value?.length ?? 0) < 3) {
                return "Must be at least 3 letters long";
              }
              return null;
            },
            controller: _lastNameTEController,
            decoration: const InputDecoration(hintText: 'Last name'),
          ),
          const SizedBox(height: 8),
          TextFormField(
            validator: (value) {
              if ((value?.length ?? 0) != 11) {
                return "Must be 11 digits";
              }
              return null;
            },
            controller: _mobileTEController,
            decoration: const InputDecoration(hintText: 'Mobile'),
          ),
          const SizedBox(height: 8),
          TextFormField(
            validator: (value) {
              if ((value?.length ?? 0) < 2) {
                return "Must be at least 2 letters long";
              }
              return null;
            },
            controller: _cityTEController,
            decoration: const InputDecoration(hintText: 'City'),
          ),
          const SizedBox(height: 8),
          TextFormField(
            validator: (value) {
              if ((value?.length ?? 0) < 1) {
                return "Can't be empty";
              }
              return null;
            },
            controller: _shippingAddressTEController,
            maxLines: 3,
            decoration: const InputDecoration(hintText: 'Shipping address'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                final customerDetails = CreateProfileModel(
                  cusName:
                      "${_firstNameTEController.text} ${_lastNameTEController.text}",
                  cusPhone: _mobileTEController.text,
                  cusCity: _cityTEController.text,
                  shipAdd: _shippingAddressTEController.text,
                );

                try {
                  await NetworkCaller.postRequest(
                    url: Urls.createProfileUrl,
                    body: customerDetails.toJson(),
                  );
                  Get.off(
                    () => const MainBottomNavBarScreen(
                      fromOtp: true,
                    ),
                  );
                } catch (e) {}
              }
            },
            child: const Text('Complete'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    _shippingAddressTEController.dispose();
  }
}
