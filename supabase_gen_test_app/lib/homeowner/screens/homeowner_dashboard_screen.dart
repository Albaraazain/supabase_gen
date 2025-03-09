import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../generated/repositories/service_categories_repository.dart';
import '../../generated/models/service_categories_model.dart';
import '../../services/logger_service.dart';

class HomeownerDashboardScreen extends StatefulWidget {
  const HomeownerDashboardScreen({super.key});

  @override
  State<HomeownerDashboardScreen> createState() =>
      _HomeownerDashboardScreenState();
}

class _HomeownerDashboardScreenState extends State<HomeownerDashboardScreen> {
  final LoggerService _logger = LoggerService();
  late final ServiceCategoriesRepository _serviceCategoriesRepository;
  List<ServiceCategoriesModel> _categories = [];
  bool _isLoading = true;

  // Map service category names to their corresponding image assets
  String _getCategoryImagePath(String categoryName) {
    final name = categoryName.toLowerCase();
    switch (name) {
      case 'appliance repair':
        return 'assets/images/appliance_repair_services.png';
      case 'carpentry':
        return 'assets/images/carbentry_services.png';
      case 'cleaning':
        return 'assets/images/home_cleaning_services.png';
      case 'electrical':
        return 'assets/images/electrical_services.png';
      case 'hvac':
        return 'assets/images/hvac_services.png';
      case 'landscaping':
        return 'assets/images/landscaping_services.png';
      case 'painting':
        return 'assets/images/painting_services.png';
      case 'plumbing':
        return 'assets/images/plumbing_services.png';
      default:
        return 'assets/images/home_cleaning_services.png';
    }
  }

  @override
  void initState() {
    super.initState();
    _serviceCategoriesRepository = ServiceCategoriesRepository(
      Supabase.instance.client,
    );
    _loadServiceCategories();
  }

  Future<void> _loadServiceCategories() async {
    try {
      _logger.info(
        'Loading service categories',
        tag: 'HomeownerDashboardScreen',
      );

      _categories = await _serviceCategoriesRepository.findAll(
        orderBy: 'name',
        ascending: true,
      );

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      _logger.error(
        'Error loading service categories: $e',
        tag: 'HomeownerDashboardScreen',
      );
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget _buildServiceCard(
    String title,
    String imagePath, {
    VoidCallback? onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                height: 80,
                width: 80,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 16),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            // TODO: Implement menu
          },
        ),
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: const Row(
              children: [
                Icon(Icons.notifications, color: Colors.white, size: 20),
                SizedBox(width: 4),
                Text(
                  '27',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Service Location Card
                      Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFC107),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              // TODO: Handle location tap
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: const Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Service Location Set',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Your service area is ready',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Icon(
                                    Icons.chevron_right,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Service Categories Grid
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 1,
                        children:
                            _categories.map((category) {
                              return _buildServiceCard(
                                category.name,
                                _getCategoryImagePath(category.name),
                                onTap: () {
                                  // TODO: Navigate to service category details
                                  _logger.info(
                                    'Selected service category: ${category.name}',
                                    tag: 'HomeownerDashboardScreen',
                                  );
                                },
                              );
                            }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
    );
  }
}
