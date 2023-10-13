import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(
          'Search',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Twitter',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            // Search results (Example)
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.pinkAccent,
                radius: 24,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              title: Text('User Name'),
              subtitle: Text('@username'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.pinkAccent,
                radius: 24,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              title: Text('User Name'),
              subtitle: Text('@username'),
            ),
            // Add more search results as needed...
          ],
        ),
      ),
    );
  }
}