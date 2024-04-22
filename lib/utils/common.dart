import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travel_buddy/providers/airport_provider.dart';

Autocomplete<String> airportTextMethod(AirportProvider airportProvider,
    TextEditingController textEditingController, bool isOrigin) {
      
  return Autocomplete<String>(
    optionsBuilder: (TextEditingValue textEditingValue) {
      if (textEditingValue.text.isEmpty) {
        return const Iterable<String>.empty();
      }
      return airportProvider.filteredAirportList.where((String option) {
        return option
            .toLowerCase()
            .contains(textEditingValue.text.toLowerCase());
      });
    },
    onSelected: (String selected) {
      textEditingController.text = selected;
    },
    fieldViewBuilder: (BuildContext context,
        TextEditingController fieldController,
        FocusNode fieldFocusNode,
        VoidCallback onFieldSubmitted) {
      return TextField(
        controller: fieldController,
        focusNode: fieldFocusNode,
        decoration: InputDecoration(
          labelText: isOrigin ? 'Origin Airport' : "Destination Airport",
          hintText:
              isOrigin ? 'Enter origin airport' : "Enter destination airport",
        ),
        onChanged: (String value) {
          textEditingController.text = value;
          airportProvider.filterAirports(value);
        },
      );
    },
    optionsViewBuilder: (BuildContext context,
        AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
      return Align(
        alignment: Alignment.topLeft,
        child: Material(
          elevation: 4.0,
          child: SizedBox(
            // height: 200.0,
            child: ListView(
              shrinkWrap: true,
              children: options.map((String option) {
                return ListTile(
                  title: Text(option),
                  onTap: () {
                    onSelected(option);
                  },
                );
              }).toList(),
            ),
          ),
        ),
      );
    },
  );
}

Widget shimmerEffect(Widget child) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: child,
  );
}
