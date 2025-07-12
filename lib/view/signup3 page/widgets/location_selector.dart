// widgets/location_selector.dart
import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/data/service/static/eygpt_location.dart';

class LocationSelector extends StatefulWidget {
  final Function(String governorate, String city) onLocationSelected;
  final String? initialGovernorate;
  final String? initialCity;

  const LocationSelector({
    Key? key,
    required this.onLocationSelected,
    this.initialGovernorate,
    this.initialCity,
  }) : super(key: key);

  @override
  State<LocationSelector> createState() => _LocationSelectorState();
}

class _LocationSelectorState extends State<LocationSelector> {
  String? selectedGovernorate;
  String? selectedCity;
  List<String> availableCities = [];

  @override
  void initState() {
    super.initState();
    selectedGovernorate = widget.initialGovernorate;
    selectedCity = widget.initialCity;
    
    if (selectedGovernorate != null) {
      availableCities = EgyptLocations.getCitiesForGovernorate(selectedGovernorate!);
    }
  }

  void _onGovernorateChanged(String? governorate) {
    setState(() {
      selectedGovernorate = governorate;
      selectedCity = null; // Reset city when governorate changes
      availableCities = governorate != null 
          ? EgyptLocations.getCitiesForGovernorate(governorate)
          : [];
    });
  }

  void _onCityChanged(String? city) {
    setState(() {
      selectedCity = city;
    });
    
    if (selectedGovernorate != null && city != null) {
      widget.onLocationSelected(selectedGovernorate!, city);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Governorate Selector
        Text(
          "Governorate",
          style: AppStyles.urbanistMedium14(context),
        ),
        const SizedBox(height: 5),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintText: "Select Governorate",
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: ColorsApp.primaryColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(width: 2),
            ),
          ),
          value: selectedGovernorate,
          items: EgyptLocations.getGovernorates()
              .map((governorate) => DropdownMenuItem(
                    value: governorate,
                    child: Text(governorate),
                  ))
              .toList(),
          onChanged: _onGovernorateChanged,
          validator: (value) =>
              value == null ? "Please select your governorate" : null,
        ),
        
        const SizedBox(height: 10),
        
        // City Selector
        Text(
          "City",
          style: AppStyles.urbanistMedium14(context),
        ),
        const SizedBox(height: 5),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintText: selectedGovernorate == null 
                ? "Select governorate first"
                : "Select City",
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: ColorsApp.primaryColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(width: 2),
            ),
          ),
          value: selectedCity,
          items: availableCities
              .map((city) => DropdownMenuItem(
                    value: city,
                    child: Text(city),
                  ))
              .toList(),
          onChanged: selectedGovernorate == null ? null : _onCityChanged,
          validator: (value) =>
              value == null ? "Please select your city" : null,
        ),
      ],
    );
  }
}

// Alternative widget with search functionality
class LocationSelectorWithSearch extends StatefulWidget {
  final Function(String governorate, String city) onLocationSelected;
  final String? initialGovernorate;
  final String? initialCity;

  const LocationSelectorWithSearch({
    Key? key,
    required this.onLocationSelected,
    this.initialGovernorate,
    this.initialCity,
  }) : super(key: key);

  @override
  State<LocationSelectorWithSearch> createState() => _LocationSelectorWithSearchState();
}

class _LocationSelectorWithSearchState extends State<LocationSelectorWithSearch> {
  String? selectedGovernorate;
  String? selectedCity;
  List<String> availableCities = [];
  List<String> filteredCities = [];
  final TextEditingController _citySearchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedGovernorate = widget.initialGovernorate;
    selectedCity = widget.initialCity;
    
    if (selectedGovernorate != null) {
      availableCities = EgyptLocations.getCitiesForGovernorate(selectedGovernorate!);
      filteredCities = availableCities;
    }
    
    _citySearchController.addListener(_filterCities);
  }

  @override
  void dispose() {
    _citySearchController.dispose();
    super.dispose();
  }

  void _filterCities() {
    final query = _citySearchController.text.toLowerCase();
    setState(() {
      filteredCities = availableCities
          .where((city) => city.toLowerCase().contains(query))
          .toList();
    });
  }

  void _onGovernorateChanged(String? governorate) {
    setState(() {
      selectedGovernorate = governorate;
      selectedCity = null;
      _citySearchController.clear();
      availableCities = governorate != null 
          ? EgyptLocations.getCitiesForGovernorate(governorate)
          : [];
      filteredCities = availableCities;
    });
  }

  void _onCityChanged(String? city) {
    setState(() {
      selectedCity = city;
    });
    
    if (selectedGovernorate != null && city != null) {
      widget.onLocationSelected(selectedGovernorate!, city);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Governorate Selector
        Text(
          "Governorate",
          style: AppStyles.urbanistMedium14(context),
        ),
        const SizedBox(height: 5),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintText: "Select Governorate",
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: ColorsApp.primaryColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(width: 2),
            ),
          ),
          value: selectedGovernorate,
          items: EgyptLocations.getGovernorates()
              .map((governorate) => DropdownMenuItem(
                    value: governorate,
                    child: Text(governorate),
                  ))
              .toList(),
          onChanged: _onGovernorateChanged,
          validator: (value) =>
              value == null ? "Please select your governorate" : null,
        ),
        
        const SizedBox(height: 10),
        
        // City Selector with Search
        Text(
          "City",
          style: AppStyles.urbanistMedium14(context),
        ),
        const SizedBox(height: 5),
        
        // Search field for cities
        if (selectedGovernorate != null) ...[
          TextField(
            controller: _citySearchController,
            decoration: InputDecoration(
              hintText: "Search cities...",
              prefixIcon: const Icon(Icons.search),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: ColorsApp.primaryColor),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(width: 2),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
        
        // City dropdown
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintText: selectedGovernorate == null 
                ? "Select governorate first"
                : "Select City",
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: ColorsApp.primaryColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(width: 2),
            ),
          ),
          value: selectedCity,
          items: filteredCities
              .map((city) => DropdownMenuItem(
                    value: city,
                    child: Text(city),
                  ))
              .toList(),
          onChanged: selectedGovernorate == null ? null : _onCityChanged,
          validator: (value) =>
              value == null ? "Please select your city" : null,
        ),
      ],
    );
  }
}