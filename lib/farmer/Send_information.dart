import 'package:flutter/material.dart';

class FarmingInformationForm extends StatefulWidget {
  @override
  _FarmingInformationFormState createState() => _FarmingInformationFormState();
}

class _FarmingInformationFormState extends State<FarmingInformationForm> {
  // Controller for each TextField
  TextEditingController cropInfoController = TextEditingController();
  TextEditingController landUsageController = TextEditingController();
  TextEditingController farmingPracticesController = TextEditingController();
  TextEditingController livestockManagementController = TextEditingController();
  TextEditingController weatherAndClimateController = TextEditingController();
  TextEditingController marketAndSalesController = TextEditingController();
  TextEditingController financialStatusController = TextEditingController();
  TextEditingController governmentProgramsController = TextEditingController();
  TextEditingController equipmentAndInfrastructureController = TextEditingController();
  TextEditingController trainingAndSupportController = TextEditingController();
  TextEditingController communityEngagementController = TextEditingController();
  TextEditingController sustainabilityPracticesController = TextEditingController();
  TextEditingController futurePlansController = TextEditingController();
  TextEditingController healthAndSafetyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farming Information Form'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField("Crop Information", cropInfoController),
            _buildTextField("Land Usage", landUsageController),
            _buildTextField("Farming Practices", farmingPracticesController),
            _buildTextField("Livestock Management", livestockManagementController),
            _buildTextField("Weather and Climate", weatherAndClimateController),
            _buildTextField("Market and Sales", marketAndSalesController),
            _buildTextField("Financial Status", financialStatusController),
            _buildTextField("Government Programs and Regulations", governmentProgramsController),
            _buildTextField("Equipment and Infrastructure", equipmentAndInfrastructureController),
            _buildTextField("Training and Support", trainingAndSupportController),
            _buildTextField("Community Engagement", communityEngagementController),
            _buildTextField("Sustainability Practices", sustainabilityPracticesController),
            _buildTextField("Future Plans", futurePlansController),
            _buildTextField("Health and Safety", healthAndSafetyController),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Process the entered information here
                // Access the text using controllers, e.g., cropInfoController.text
                // You can send this information to a database or perform any other action
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
        SizedBox(height: 8.0),
        TextField(
          controller: controller,
          maxLines: 3,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter your information here...',
          ),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: FarmingInformationForm(),
  ));
}
