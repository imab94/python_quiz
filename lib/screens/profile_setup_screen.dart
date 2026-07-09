import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:python_quiz/widgets/app_background.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:country_picker/country_picker.dart';
import 'package:python_quiz/models/user_profile.dart';
import 'package:python_quiz/services/profile_service.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({
    super.key,
    this.isFirstLaunch = false,
    this.profile,
  });

  final bool isFirstLaunch;
  final UserProfile? profile;

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final ImagePicker _picker = ImagePicker();
  String? _photoPath;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  Country? _selectedCountry;
  bool _saving = false;

  @override
  void initState() {
    super.initState();

    if (widget.profile != null) {

      _nameController.text = widget.profile!.name;

      _photoPath = widget.profile!.photoPath;

      _selectedCountry = Country.tryParse(
        widget.profile!.countryCode,
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_selectedCountry == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select your country.")),
      );
      return;
    }

    setState(() {
      _saving = true;
    });

    final profile = UserProfile(
      profileId: widget.profile?.profileId ??
          ProfileService.generateProfileId(),

      name: _nameController.text.trim(),

      country: _selectedCountry!.name,
      countryCode: _selectedCountry!.countryCode,
      countryFlag: _selectedCountry!.flagEmoji,
      photoPath: _photoPath,

      createdAt: widget.profile?.createdAt ??
          DateTime.now(),
    );

    await ProfileService.saveProfile(profile);

    if (!mounted) return;

    Navigator.pop(context, true);
  }

  Future<void> _pickImage(ImageSource source) async {
    final file = await _picker.pickImage(source: source, imageQuality: 85);

    if (file == null) return;

    setState(() {
      _photoPath = file.path;
    });
  }

  void _selectCountry() {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (Country country) {
        setState(() {
          _selectedCountry = country;
        });
      },
    );
  }

  Future<void> _showPhotoPicker() async {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF252B42),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.photo_camera_outlined),
                  title: const Text("Camera"),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.camera);
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.photo_library_outlined),
                  title: const Text("Gallery"),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (!widget.isFirstLaunch)
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                const SizedBox(height: 24),
                Center(
                  child: GestureDetector(
                    onTap: _showPhotoPicker,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [Color(0xff7B5CFA), Color(0xff9F6BFF)],
                            ),
                            border: Border.all(color: Colors.white24, width: 2),
                          ),
                          child: CircleAvatar(
                            radius: 46,
                            backgroundColor: Colors.white12,
                            backgroundImage: _photoPath == null
                                ? null
                                : FileImage(File(_photoPath!)),
                            child: _photoPath == null
                                ? const Icon(
                                    Icons.person_rounded,
                                    size: 60,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.all(7),
                          decoration: const BoxDecoration(
                            color: Colors.deepPurpleAccent,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                Text(
                  "Create Your Learner Profile",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "Personalize your certificates and showcase your achievements.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    color: Colors.white70,
                    fontSize: 15,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 36),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        textCapitalization: TextCapitalization.words,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Full Name",
                          labelStyle: GoogleFonts.lato(
                            color: Colors.white70,
                            fontSize: 15,
                          ),

                          prefixIcon: const Icon(
                            Icons.person_outline,
                            color: Colors.white70,
                          ),

                          filled: true,
                          fillColor: Colors.white.withValues(alpha: .05),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Colors.white.withValues(alpha: .15),
                            ),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Colors.deepPurpleAccent,
                              width: 2,
                            ),
                          ),

                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Colors.redAccent,
                            ),
                          ),

                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Colors.redAccent,
                              width: 2,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your name.";
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 18),

                      InkWell(
                        borderRadius: BorderRadius.circular(14),
                        onTap: _selectCountry,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 18,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: Colors.white24),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.public, color: Colors.white70),

                              const SizedBox(width: 14),

                              Expanded(
                                child: Text(
                                  _selectedCountry == null
                                      ? "Select Country"
                                      : "${_selectedCountry!.flagEmoji} ${_selectedCountry!.name}",
                                  style: GoogleFonts.lato(
                                    color: _selectedCountry == null
                                        ? Colors.white54
                                        : Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),

                              const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white70,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black87,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      elevation: 0,
                    ),
                    onPressed: _saving ? null : _saveProfile,
                    child: _saving
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text("Save Profile"),
                  ),
                ),

                const SizedBox(height: 14),

                TextButton(
                  onPressed: _saving
                      ? null
                      : () {
                          Navigator.pop(context);
                        },
                  child: Text(
                    "Maybe Later",
                    style: GoogleFonts.lato(
                      color: Colors.white60,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
