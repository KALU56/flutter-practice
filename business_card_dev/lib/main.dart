import 'package:flutter/material.dart';

void main() {
  runApp(const DeveloperCardApp());
}

class DeveloperCardApp extends StatelessWidget {
  const DeveloperCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Developer Business Card',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UserInputPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class UserInputPage extends StatefulWidget {
  const UserInputPage({super.key});

  @override
  State<UserInputPage> createState() => _UserInputPageState();
}

class _UserInputPageState extends State<UserInputPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController githubController = TextEditingController();
  final TextEditingController linkedinController = TextEditingController();

  String name = 'Your Name';
  String title = 'Your Job Title';
  String email = 'you@example.com';
  String phone = '+251 000 000 0000';
  String github = 'github.com/username';
  String linkedin = 'linkedin.com/in/username';

  bool editing = true;

  void updateCard() {
    setState(() {
      name = nameController.text.isEmpty ? name : nameController.text;
      title = titleController.text.isEmpty ? title : titleController.text;
      email = emailController.text.isEmpty ? email : emailController.text;
      phone = phoneController.text.isEmpty ? phone : phoneController.text;
      github = githubController.text.isEmpty ? github : githubController.text;
      linkedin = linkedinController.text.isEmpty ? linkedin : linkedinController.text;
      editing = false;
    });
  }

  void editInfo() {
    setState(() {
      editing = true;
    });
  }

  void createAnotherCard() {
    setState(() {
      nameController.clear();
      titleController.clear();
      emailController.clear();
      phoneController.clear();
      githubController.clear();
      linkedinController.clear();

      name = 'Your Name';
      title = 'Your Job Title';
      email = 'you@example.com';
      phone = '+251 000 000 0000';
      github = 'github.com/username';
      linkedin = 'linkedin.com/in/username';

      editing = true;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    titleController.dispose();
    emailController.dispose();
    phoneController.dispose();
    githubController.dispose();
    linkedinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Developer Business Card Builder'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (editing) ...[
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Job Title',
                  prefixIcon: Icon(Icons.work),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  prefixIcon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: githubController,
                decoration: const InputDecoration(
                  labelText: 'GitHub',
                  prefixIcon: Icon(Icons.code),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: linkedinController,
                decoration: const InputDecoration(
                  labelText: 'LinkedIn',
                  prefixIcon: Icon(Icons.business),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: updateCard,
                child: const Text('Update Business Card'),
              ),
            ] else ...[
              const SizedBox(height: 36),
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 48,
                        backgroundColor: Colors.deepPurple,
                        child: const Icon(
                          Icons.code,
                          size: 48,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.deepPurpleAccent,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Divider(color: Colors.deepPurple.shade200),
                      const SizedBox(height: 16),
                      InfoRow(icon: Icons.email, text: email),
                      const SizedBox(height: 12),
                      InfoRow(icon: Icons.phone, text: phone),
                      const SizedBox(height: 12),
                      InfoRow(icon: Icons.code, text: github),
                      const SizedBox(height: 12),
                      InfoRow(icon: Icons.business, text: linkedin),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: editInfo,
                            child: const Text('Edit Info'),
                          ),
                          ElevatedButton(
                            onPressed: createAnotherCard,
                            child: const Text('Create Another Card'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.deepPurple),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, color: Colors.deepPurple),
          ),
        ),
      ],
    );
  }
}
