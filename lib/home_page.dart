import 'package:encrypted_storage_flutter/shared_prefs_keys.dart';
import 'package:encrypted_storage_flutter/storage_service.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final StorageService service = StorageService();

  final TextEditingController name = TextEditingController();

  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  String showName = "", showEmail = "", showPassword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Encrypted Storage"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 8,
              ),
              child: Column(
                children: [
                  TextField(
                    controller: name,
                    decoration: const InputDecoration(
                      hintText: "Enter name",
                    ),
                  ),
                  TextField(
                    controller: email,
                    decoration: const InputDecoration(
                      hintText: "Enter email",
                    ),
                  ),
                  TextField(
                    controller: password,
                    decoration: const InputDecoration(
                      hintText: "Enter password",
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                service.saveValue(nameKey, name.text);
                service.saveValue(emailKey, email.text);
                service.saveValue(passwordKey, password.text);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Data Saved Successfully"),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              child: const Text("Save to storage"),
            ),
            const SizedBox(height: 45),
            Container(
              height: 100,
              width: 300,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: const BorderRadius.all(Radius.circular(18)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name: $showName"),
                  const SizedBox(height: 5),
                  Text("Email: $showEmail"),
                  const SizedBox(height: 5),
                  Text("Password: $showPassword"),
                ],
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async {
                showName = await service.fetchValue(nameKey);
                showEmail = await service.fetchValue(emailKey);
                showPassword = await service.fetchValue(passwordKey);
                setState(() {});
              },
              child: const Text("Fetch Saved Data"),
            ),
          ],
        ),
      ),
    );
  }
}
