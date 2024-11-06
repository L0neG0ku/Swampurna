import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; // Import the carousel package

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false, // Disable the debug banner
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0), // Height to accommodate title and nav bar
        child: Column(
          children: [
            // Title bar with "SWAMPURNA" and "Hackathon"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SWAMPURNA',
                    style: TextStyle(
                      color: Colors.blue[900], // Dark blue color
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DropdownButton<String>(
                    value: 'Hackathon',
                    items: <String>['Hackathon', 'Event 1', 'Event 2'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {},
                    iconEnabledColor: Colors.blue[900],
                    underline: SizedBox(),
                    style: TextStyle(
                      color: Colors.blue[900],
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            // Navigation Bar
            Container(
              color: Color(0xFFB3E5FC), // Light blue color
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildNavLink('Home'),
                  _buildNavLink('About Us'),
                  _buildNavLink('Our Work'),
                  _buildNavLink('Resources'),
                  _buildNavLink('Get Involved'),
                  _buildNavLink('News & Updates'),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Left-side placeholder for the image
            Expanded(
              flex: 1,
              child: Container(
                height: 400,
                color: Colors.grey[300], // Placeholder for image
                child: Center(
                  child: Text(
                    'Image Placeholder',
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                ),
              ),
            ),

            SizedBox(width: 16.0), // Space between image and carousel

            // Right-side for Carousel
            Expanded(
              flex: 1,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 400.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlayInterval: Duration(seconds: 3),
                ),
                items: [
                  'assets/image1.jpg',
                  'assets/image2.jpg',
                  'assets/image3.jpg'
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                        ),
                        child: Image.asset(
                          i,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build navigation links
  Widget _buildNavLink(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            color: Colors.blue[900],
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
