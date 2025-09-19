import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../widgets/custom_bottom_navbar.dart';
import '../../main.dart'; // Ensure this path is correct

class SprintTestPage extends StatefulWidget {
  const SprintTestPage({super.key});

  @override
  State<SprintTestPage> createState() => _SprintTestPageState();
}

class _SprintTestPageState extends State<SprintTestPage> {
  int _currentIndex = 1;
  CameraController? _cameraController;
  late List<CameraDescription> _cameras;
  bool _isCameraInitialized = false;
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras.isEmpty) {
        print('No cameras found.');
        return;
      }
      _cameraController = CameraController(
        _cameras.first,
        ResolutionPreset.high,
        enableAudio: false,
      );
      await _cameraController!.initialize();
      if (mounted) {
        setState(() {
          _isCameraInitialized = true;
        });
      }
    } on CameraException catch (e) {
      print("Camera initialization error: $e");
    }
  }

  Future<void> _startVideoRecording() async {
    if (!_cameraController!.value.isInitialized || _cameraController!.value.isRecordingVideo) {
      return;
    }
    try {
      setState(() {
        _isRecording = true;
      });
      await _cameraController!.startVideoRecording();
    } on CameraException catch (e) {
      print("Error starting video recording: $e");
      setState(() {
        _isRecording = false;
      });
    }
  }

  Future<void> _stopVideoRecording() async {
    if (!_cameraController!.value.isRecordingVideo) {
      return;
    }
    try {
      final XFile file = await _cameraController!.stopVideoRecording();
      setState(() {
        _isRecording = false;
      });

      final String videoPath = file.path;
      final String fileName = '${DateTime.now().millisecondsSinceEpoch}.mp4';
      final storageRef = FirebaseStorage.instance.ref().child('sprint_tests/$fileName');

      // Upload the video file to Firebase Storage
      await storageRef.putFile(File(videoPath));

      // Get the download URL
      final downloadUrl = await storageRef.getDownloadURL();
      print("Video uploaded to Firebase Storage. URL: $downloadUrl");

      // Save the video data to Firestore
      final firestore = FirebaseFirestore.instance;
      await firestore.collection('sprint_tests').add({
        'url': downloadUrl,
        'timestamp': FieldValue.serverTimestamp(),
        'userId': 'your_user_id', // You should replace this with a real user ID
      });

      print("Video metadata saved to Firestore.");
    } on CameraException catch (e) {
      print("Error stopping video recording: $e");
      setState(() {
        _isRecording = false;
      });
    } catch (e) {
      print("Error uploading video or saving to Firebase: $e");
    }
  }

  void _onNavTap(int index) {
    if (index == _currentIndex) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => MainPage(
          username: "User",
          initialIndex: index,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isCameraReady = _cameraController != null && _cameraController!.value.isInitialized;
    final screenWidth = MediaQuery.of(context).size.width;
    final cameraWidth = screenWidth * 0.9;
    final cameraHeight = cameraWidth * 1.33;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gradient Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green, Colors.lightGreen],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sprint Test",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Measure your speed and acceleration",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Camera Preview Box
              Center(
                child: Container(
                  width: cameraWidth,
                  height: cameraHeight,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C2230),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: isCameraReady
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: CameraPreview(_cameraController!),
                          )
                        : const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 100),
                              Icon(Icons.camera_alt, color: Colors.white54, size: 40),
                              SizedBox(height: 8),
                              Text(
                                "Camera preview will appear here",
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 100),
                            ],
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Instructions Card
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 6,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Instructions",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildInstructionItem(1, "Position yourself at the start line"),
                    const SizedBox(height: 12),
                    _buildInstructionItem(2, "Sprint at maximum speed"),
                    const SizedBox(height: 12),
                    _buildInstructionItem(3, "Run through the finish line"),
                    const SizedBox(height: 12),
                    _buildInstructionItem(4, "Maintain form throughout"),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Start/Stop Recording Button
              Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  icon: Icon(_isRecording ? Icons.stop : Icons.play_arrow, color: Colors.white),
                  label: Text(
                    _isRecording ? "Stop Recording" : "Start Recording",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    if (_isRecording) {
                      _stopVideoRecording();
                    } else {
                      _startVideoRecording();
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),

              // Tip Box
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.orange.shade100),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.lightbulb, color: Colors.orange, size: 20),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "Tip: Make sure you're in good lighting and the camera can see your full body movement.",
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }

  Widget _buildInstructionItem(int number, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: Colors.blue.shade50,
          child: Text(
            number.toString(),
            style: const TextStyle(
              fontSize: 14,
              color: Colors.blue,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ),
      ],
    );
  }
}