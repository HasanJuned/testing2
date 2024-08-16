import 'package:crafty_bay/data/models/create_profile_model.dart';
import 'package:crafty_bay/presentation/screens/home_screen.dart';
import 'package:crafty_bay/presentation/state_holders/create_profile_controller.dart';
import 'package:crafty_bay/presentation/widgets/app_logo.dart';
import 'package:crafty_bay/presentation/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/presentation/widgets/snack_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _userIdTEController = TextEditingController();
  final TextEditingController _idTEController = TextEditingController();
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _stateTEController = TextEditingController();
  final TextEditingController _postcodeTEController = TextEditingController();
  final TextEditingController _countryTEController = TextEditingController();
  final TextEditingController _faxTEController = TextEditingController();
  final TextEditingController _shippingNameTEController =
      TextEditingController();
  final TextEditingController _shippingAddressTEController =
      TextEditingController();
  final TextEditingController _shippingCityTEController =
      TextEditingController();
  final TextEditingController _shippingStateTEController =
      TextEditingController();
  final TextEditingController _shippingPostcodeTEController =
      TextEditingController();
  final TextEditingController _shippingCountryTEController =
      TextEditingController();
  final TextEditingController _shippingPhoneTEController =
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
                GetBuilder<CreateProfileController>(
                  builder: (createProfileController) {
                    if (createProfileController.inProgress) {
                      return const CenteredCircularProgressIndicator();
                    }

                    return ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          CreateProfileModel createProfileModel =
                              CreateProfileModel(
                            userId: _userIdTEController.text,
                            cusName: _nameTEController.text,
                            cusAdd: _cityTEController.text,
                            cusCity: _cityTEController.text,
                            cusState: _stateTEController.text,
                            cusPostcode: _postcodeTEController.text,
                            cusCountry: _countryTEController.text,
                            cusPhone: _mobileTEController.text,
                            cusFax: _faxTEController.text,
                            shipName: _shippingNameTEController.text,
                            shipAdd: _shippingAddressTEController.text,
                            shipCity: _shippingCityTEController.text,
                            shipState: _shippingStateTEController.text,
                            shipPostcode: _shippingPostcodeTEController.text,
                            shipCountry: _shippingCountryTEController.text,
                            shipPhone: _shippingPhoneTEController.text,
                            updatedAt: DateTime.now().toString(),
                            createdAt: DateTime.now().toString(),
                            id: int.tryParse(_idTEController.text) ?? 0,
                          );

                          bool isSuccess = await createProfileController
                              .createProfile(createProfileModel);

                          if (isSuccess) {
                            if (mounted) {
                              showSnackMessage(
                                  context, "Profile Created successfully");
                            }
                            Get.offAll(() => const HomeScreen());
                          } else {
                            if (mounted) {
                              showSnackMessage(context,
                                  createProfileController.errorMessage);
                            }
                          }
                        }
                      },
                      child: const Text('Complete'),
                    );
                  },
                ),
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
            controller: _userIdTEController,
            decoration: const InputDecoration(hintText: 'User ID'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your User ID';
              }
              if (int.tryParse(value) == null) {
                return 'User ID must be a number';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _idTEController,
            decoration: const InputDecoration(hintText: 'ID'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your ID';
              }
              if (int.tryParse(value) == null) {
                return 'ID must be a number';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _nameTEController,
            decoration: const InputDecoration(hintText: 'Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _mobileTEController,
            decoration: const InputDecoration(hintText: 'Mobile'),
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your mobile number';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _cityTEController,
            decoration: const InputDecoration(hintText: 'City'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your city';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _stateTEController,
            decoration: const InputDecoration(hintText: 'State'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your state';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _postcodeTEController,
            decoration: const InputDecoration(hintText: 'Postcode'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your postcode';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _countryTEController,
            decoration: const InputDecoration(hintText: 'Country'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your country';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _faxTEController,
            decoration: const InputDecoration(hintText: 'Fax'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your fax';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _shippingNameTEController,
            decoration: const InputDecoration(hintText: 'Shipping name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the shipping name';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _shippingAddressTEController,
            maxLines: 3,
            decoration: const InputDecoration(hintText: 'Shipping address'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the shipping address';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _shippingCityTEController,
            decoration: const InputDecoration(hintText: 'Shipping city'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the shipping city';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _shippingStateTEController,
            decoration: const InputDecoration(hintText: 'Shipping state'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the shipping state';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _shippingPostcodeTEController,
            decoration: const InputDecoration(hintText: 'Shipping postcode'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the shipping postcode';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _shippingCountryTEController,
            decoration: const InputDecoration(hintText: 'Shipping country'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the shipping country';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _shippingPhoneTEController,
            decoration: const InputDecoration(hintText: 'Shipping phone'),
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the shipping phone number';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _userIdTEController.dispose();
    _idTEController.dispose();
    _nameTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    _stateTEController.dispose();
    _postcodeTEController.dispose();
    _countryTEController.dispose();
    _faxTEController.dispose();
    _shippingNameTEController.dispose();
    _shippingAddressTEController.dispose();
    _shippingCityTEController.dispose();
    _shippingStateTEController.dispose();
    _shippingPostcodeTEController.dispose();
    _shippingCountryTEController.dispose();
    _shippingPhoneTEController.dispose();
    super.dispose();
  }
}
