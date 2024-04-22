// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travel_buddy/providers/airport_provider.dart';
import 'package:travel_buddy/providers/post_provider.dart';
import 'package:travel_buddy/models/post.dart';
import 'package:travel_buddy/utils/colors.dart';
import 'package:travel_buddy/utils/common.dart';
import 'package:travel_buddy/utils/widgets/appbar.dart';
import 'package:travel_buddy/utils/widgets/primary_header_container.dart';

class CreatePostScreen extends StatelessWidget {
  static const routeName = "CreatePostScreen";
  final TextEditingController _originController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final DateTime _selectedDate = DateTime.now();

  CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final airportProvider = Provider.of<AirportProvider>(context);

    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
                height: size.height * 0.17,
                child: const Column(
                  children: [
                    TAppBar(
                      showBackArrow: true,
                      title: Text("Share Your Travel Plans", style: TextStyle(fontSize: 22, color: AppColors.textWhite, fontWeight: FontWeight.bold),),
                      centerTitle: true,
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  airportTextMethod(airportProvider, _originController, true),
                  airportTextMethod(airportProvider, _destinationController, false),
                  TextField(
                    readOnly: true,
                    controller: _dateController,
                    decoration: InputDecoration(
                      labelText: 'Travel Date',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () => _selectDate(context),
                      ),
                    ),
                    onTap: () => _selectDate(context),
                  ),
                  TextField(
                    controller: _weightController,
                    onChanged: (value) {
                      // No need to use setState here
                    },
                    decoration: const InputDecoration(
                      labelText: 'Weight Allowance',
                      hintText: 'e.g., 5 kg available',
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.06),
                    height: size.height * 0.06,
                    width: size.width * 0.3,
                    decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () {
                        SystemChannels.textInput
                                .invokeMethod('TextInput.hide');
                        _submitPost(context);
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 18, color: AppColors.textPrimaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (pickedDate != null) {
      _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      // Update the selected date in the provider
      Provider.of<AirportProvider>(context, listen: false)
          .setSelectedDate(pickedDate);
    }
  }

  void _submitPost(BuildContext context) {
    final String origin = _originController.text.trim();
    final String destination = _destinationController.text.trim();
    final String weightAllowance = _weightController.text.trim();

    if (origin.isNotEmpty &&
        destination.isNotEmpty &&
        weightAllowance.isNotEmpty) {
      final newPost = Post(
        origin: origin,
        destination: destination,
        travelDate: DateFormat('yyyy-MM-dd').format(
            Provider.of<AirportProvider>(context, listen: false).selectedDate),
        availableWeight: weightAllowance,
      );

      // Add the new post using the post provider
      Provider.of<PostProvider>(context, listen: false).addPost(newPost);

      // Navigate back to the previous screen
      Navigator.of(context).pop();
    } else {
      // Show a snackbar if any of the fields are empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all the fields.'),
        ),
      );
    }
  }

  String _extractWeight(String input) {
    final RegExp regex = RegExp(r'(\d+)kg');
    final match = regex.firstMatch(input);
    if (match != null && match.groupCount >= 1) {
      return match.group(1)!;
    } else {
      return '0';
    }
  }
}
