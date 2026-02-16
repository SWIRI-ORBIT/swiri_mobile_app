import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:swiri/core/helpers/shared_pref_helper.dart';
import 'package:swiri/core/helpers/consts.dart';
import 'package:swiri/core/networking/service_locator.dart';
import 'package:swiri/features/auth/data/api/auth_api_service.dart';
import 'package:swiri/features/auth/data/models/user.dart';
import 'package:swiri/theme/app_colors.dart';
import 'package:swiri/widgets/default_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userName = '';
  late GoogleMapController mapController;
  bool isLoadingLocation = false;
  late LatLng childLocation;
  final Set<Marker> markers = {};
  BitmapDescriptor? customMarkerIcon;

  // Default location (Cairo, Egypt)
  static const LatLng _defaultLocation = LatLng(31.0460748, 31.3619195);

  @override
  void initState() {
    super.initState();
    childLocation = _defaultLocation;
    _loadCustomMarkerIcon();
    _loadUserName();
  }

  Future<void> _loadCustomMarkerIcon() async {
    try {
      customMarkerIcon = await BitmapDescriptor.asset(
        const ImageConfiguration(size: Size(65, 65)),
        'assets/child_marker.png',
      );
    } catch (e) {
      debugPrint('Error loading custom marker icon: $e');
      // Fallback to default marker with custom color
      customMarkerIcon = BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueBlue,
      );
    }
  }

  Future<void> _loadUserName() async {
    final userJson = await SharedPrefHelper.getString(SharedPrefKeys.userData);
    if (userJson.isNotEmpty) {
      try {
        final userMap = jsonDecode(userJson) as Map<String, dynamic>;
        final user = User.fromJson(userMap);
        setState(() {
          userName = user.name;
        });
        // Load child's location after loading user data
        if (user.children.isNotEmpty) {
          await _loadChildLocation(user.children[0].id);
        }
      } catch (e) {
        debugPrint('Error parsing user data: $e');
      }
    }
  }

  Future<void> _loadChildLocation(String childId) async {
    setState(() {
      isLoadingLocation = true;
    });
    try {
      final apiService = getIt<AuthApiService>();
      final locationResponse = await apiService.getChildLatestLocation(childId);
      setState(() {
        childLocation = LatLng(
          locationResponse.location.coordinates.latitude,
          locationResponse.location.coordinates.longitude,
        );
        _addChildMarker();
      });
      // Animate camera to child's location
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: childLocation, zoom: 17.0),
        ),
      );
    } catch (e) {
      debugPrint('Error loading child location: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load child location')),
        );
      }
    } finally {
      setState(() {
        isLoadingLocation = false;
      });
    }
  }

  void _addChildMarker() {
    markers.clear();
    markers.add(
      Marker(
        markerId: const MarkerId('child_location'),
        position: childLocation,
        icon: customMarkerIcon ?? BitmapDescriptor.defaultMarker,
        infoWindow: const InfoWindow(title: 'Child Location'),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 24, left: 24, top: 65),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello 👋',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        userName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_none_rounded,
                      size: 30,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  width: double.infinity,
                  height: (281 / 852) * 1.sh,
                  child: Stack(
                    children: [
                      GoogleMap(
                        onMapCreated: _onMapCreated,
                        initialCameraPosition: const CameraPosition(
                          target: _defaultLocation,
                          zoom: 16.0,
                        ),
                        markers: markers,
                        myLocationButtonEnabled: true,
                        myLocationEnabled: true,
                        zoomControlsEnabled: false,
                      ),
                      if (isLoadingLocation)
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const CircularProgressIndicator(),
                          ),
                        ),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xff9D9D9D).withAlpha(200),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.2),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  mapController.animateCamera(
                                    CameraUpdate.zoomIn(),
                                  );
                                },
                                iconSize: 24,
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(
                                  minWidth: 40,
                                  minHeight: 40,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xff9D9D9D).withAlpha(200),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.2),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  mapController.animateCamera(
                                    CameraUpdate.zoomOut(),
                                  );
                                },
                                iconSize: 24,
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(
                                  minWidth: 40,
                                  minHeight: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Image.asset('assets/safe_icon.png', height: 44, width: 44),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your child is safe ❤️',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Inside the club • 2 minutes ago',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Image.asset('assets/sound_icon.png', height: 44, width: 44),
                  SizedBox(width: 12),
                  Text(
                    'Environment sound status',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  DefaultButton(
                    text: 'Check',
                    textStyle: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                    onPressed: () {},
                    height: 34,
                    width: 92.w,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
