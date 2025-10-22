import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI App Prompt Builder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
          fillColor: Colors.grey[800],
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      home: const PromptGeneratorPage(),
    );
  }
}

class PromptGeneratorPage extends StatefulWidget {
  const PromptGeneratorPage({super.key});

  @override
  State<PromptGeneratorPage> createState() => _PromptGeneratorPageState();
}

class _PromptGeneratorPageState extends State<PromptGeneratorPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for each field
  final _appTypeController = TextEditingController(text: 'mobile-responsive dashboard');
  final _corePurposeController = TextEditingController(text: 'manage orders');
  final _contextController = TextEditingController(text: 'weekend food stall in Cebu');
  final _feature1Controller = TextEditingController(text: 'Users can add items to an order, specify quantity, and see a live-updating total. Required fields: item, quantity. Price is auto-filled.');
  final _feature2Controller = TextEditingController(text: 'Track daily revenue and total items sold. Revenue = sum of (item price * quantity) for all orders.');
  final _feature3Controller = TextEditingController(text: 'Data should persist in local storage. Users can view a history of past orders for the current day.');
  final _feature4Controller = TextEditingController(text: 'I need an admin screen to add, edit, or remove menu items and their prices.');
  final _feature5Controller = TextEditingController(text: 'Show a summary of top-selling items for the day.');
  final _platformController = TextEditingController(text: 'mobile web');
  final _styleController = TextEditingController(text: 'clean, minimal, mobile-first');
  final _authController = TextEditingController(text: 'No authentication needed');
  final _uxController = TextEditingController(text: 'Prioritize ease of use and clear feedback.');
  final _frontendController = TextEditingController(text: 'Flutter');
  final _backendController = TextEditingController(text: 'None');
  final _databaseController = TextEditingController(text: 'Local storage');
  final _deploymentController = TextEditingController(text: 'Should run on any static host');
  final _notesController = TextEditingController(text: 'Keep the code modular and editable.');

  void _generatePrompt() {
    if (_formKey.currentState!.validate()) {
      final prompt = """
I want you to build a ${_appTypeController.text} that helps me ${_corePurposeController.text} for my ${_contextController.text}.

🧩 Core Features
[Feature Area 1 – Input & Interaction]
${_feature1Controller.text}

[Feature Area 2 – Data Tracking]
${_feature2Controller.text}

[Feature Area 3 – Data Persistence & History]
${_feature3Controller.text}

[Feature Area 4 – Customization & Admin]
${_feature4Controller.text}

[Feature Area 5 – Insights & Analytics]
${_feature5Controller.text}

🎨 Design & UX Requirements
Platform: ${_platformController.text}
Style: ${_styleController.text}
Authentication: ${_authController.text}
UX: ${_uxController.text}

⚙️ Technical Preferences
Frontend: ${_frontendController.text}
Backend: ${_backendController.text}
Database: ${_databaseController.text}
Deployment: ${_deploymentController.text}

💡 Special Notes:
${_notesController.text}
""";

      _showGeneratedPrompt(prompt);
    }
  }

  void _showGeneratedPrompt(String prompt) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Generated Prompt'),
        content: SingleChildScrollView(
          child: Text(prompt),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: prompt));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Prompt copied to clipboard!')),
              );
              Navigator.of(context).pop();
            },
            child: const Text('Copy to Clipboard'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _appTypeController.dispose();
    _corePurposeController.dispose();
    _contextController.dispose();
    _feature1Controller.dispose();
    _feature2Controller.dispose();
    _feature3Controller.dispose();
    _feature4Controller.dispose();
    _feature5Controller.dispose();
    _platformController.dispose();
    _styleController.dispose();
    _authController.dispose();
    _uxController.dispose();
    _frontendController.dispose();
    _backendController.dispose();
    _databaseController.dispose();
    _deploymentController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI App Prompt Builder'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildSectionHeader('App Overview'),
            _buildTextField(_appTypeController, 'Type of App', 'e.g., single-page web app'),
            _buildTextField(_corePurposeController, 'Core Purpose', 'e.g., manage orders'),
            _buildTextField(_contextController, 'Context', 'e.g., weekend food stall'),
            const SizedBox(height: 24),
            _buildSectionHeader('Core Features'),
            _buildTextField(_feature1Controller, 'Input & Interaction', 'Describe user actions...', maxLines: 3),
            _buildTextField(_feature2Controller, 'Data Tracking', 'Define metrics to track...', maxLines: 3),
            _buildTextField(_feature3Controller, 'Data Persistence & History', 'Should data persist?', maxLines: 3),
            _buildTextField(_feature4Controller, 'Customization & Admin', 'Can I add/remove items?', maxLines: 3),
            _buildTextField(_feature5Controller, 'Insights & Analytics', 'What summaries should be shown?', maxLines: 3),
            const SizedBox(height: 24),
            _buildSectionHeader('Design & UX'),
            _buildTextField(_platformController, 'Platform', 'e.g., web, mobile web'),
            _buildTextField(_styleController, 'Style', 'e.g., clean, minimal'),
            _buildTextField(_authController, 'Authentication', 'e.g., No authentication'),
            _buildTextField(_uxController, 'UX', 'e.g., Prioritize ease of use'),
            const SizedBox(height: 24),
            _buildSectionHeader('Technical Preferences'),
            _buildTextField(_frontendController, 'Frontend', 'e.g., React, Flutter'),
            _buildTextField(_backendController, 'Backend', 'e.g., Node.js, none'),
            _buildTextField(_databaseController, 'Database', 'e.g., local storage, SQLite'),
            _buildTextField(_deploymentController, 'Deployment', 'e.g., should run on Replit'),
            const SizedBox(height: 24),
            _buildSectionHeader('Special Notes'),
            _buildTextField(_notesController, 'Notes', 'e.g., Keep the code modular', maxLines: 3),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _generatePrompt,
              child: const Text('Generate Prompt'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, String hint, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          alignLabelWithHint: true,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a value';
          }
          return null;
        },
      ),
    );
  }
}
