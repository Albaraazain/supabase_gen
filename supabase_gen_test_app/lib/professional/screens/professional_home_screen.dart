import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/professional_home_provider.dart';
import '../widgets/metric_card.dart';
import '../widgets/online_toggle.dart';
import '../widgets/job_request_card.dart';
import '../widgets/active_job_card.dart';

class ProfessionalHomeScreen extends StatefulWidget {
  const ProfessionalHomeScreen({Key? key}) : super(key: key);

  @override
  _ProfessionalHomeScreenState createState() => _ProfessionalHomeScreenState();
}

class _ProfessionalHomeScreenState extends State<ProfessionalHomeScreen> {
  @override
  void initState() {
    super.initState();
    // Ensure data is refreshed when the screen is first loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print("DEBUG: ProfessionalHomeScreen initialized, triggering refresh");
      Provider.of<ProfessionalHomeProvider>(context, listen: false).refresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Consumer<ProfessionalHomeProvider>(
        builder: (context, provider, _) {
          // Handle loading state
          if (provider.isLoading) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text("Loading professional data..."),
                ],
              ),
            );
          }

          // Handle error state
          if (provider.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, color: Colors.red, size: 48),
                  SizedBox(height: 16),
                  Text("Error: ${provider.error ?? 'Unknown error'}"),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      print("DEBUG: Retry button pressed");
                      provider.refresh();
                    },
                    child: Text("Retry"),
                  ),
                ],
              ),
            );
          }

          // Handle loaded state
          return SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 24,
                              height: 4,
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.refresh),
                                  onPressed: () {
                                    print("DEBUG: Manual refresh triggered");
                                    provider.refresh();
                                  },
                                ),
                                const SizedBox(width: 8),
                                OnlineToggle(
                                  isOnline: provider.isOnline,
                                  isLoading: provider.isLoading,
                                  onToggle: () {
                                    print("DEBUG: Toggle button pressed, current status: ${provider.isOnline}");
                                    provider.toggleOnlineStatus();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Welcome Text
                        Text(
                          'Welcome back, ${provider.profile?.businessName ?? "Professional"}!',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          provider.isOnline
                              ? 'You have ${provider.nearbyJobs.length} new requests nearby'
                              : 'You are currently offline',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        const SizedBox(height: 32),

                        // Quick Stats
                        GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            MetricCard(
                              title: "Today's Earnings",
                              value:
                                  '\$${provider.todayEarnings.toStringAsFixed(2)}',
                              trend: '15% increase',
                              icon: Icons.attach_money,
                              backgroundColor: Colors.pink.shade100,
                            ),
                            MetricCard(
                              title: 'Response Rate',
                              value:
                                  '${(provider.responseRate * 100).toStringAsFixed(0)}%',
                              trend: 'Last 7 days',
                              icon: Icons.thumb_up,
                              backgroundColor: Colors.blue.shade100,
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),

                        if (provider.isOnline) ...[
                          // Active Job Section
                          if (provider.currentJob != null) ...[
                            const Text(
                              'Active Job',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ActiveJobCard(
                              title: provider.currentJob!.title,
                              client:
                                  provider.currentJob!.clientName ?? 'Client',
                              status: provider.currentJob!.stage,
                              location: provider.currentJob!.location,
                              onViewDetails: () {
                                // Navigate to job details
                              },
                            ),
                            const SizedBox(height: 32),
                          ],

                          // New Requests Section
                          const Text(
                            'New Requests',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: provider.nearbyJobs.length,
                            separatorBuilder:
                                (context, index) => const SizedBox(height: 16),
                            itemBuilder: (context, index) {
                              final job = provider.nearbyJobs[index];
                              return JobRequestCard(
                                title: job.title,
                                distance:
                                    '2.5 miles', // TODO: Calculate from location
                                eta: '15',
                                location:
                                    job.locationAddress ??
                                    'No location provided',
                                isUrgent: job.urgencyLevel == 'high',
                                onAccept:
                                    () => provider.acceptJob(job.broadcastId),
                              );
                            },
                          ),
                        ] else ...[
                          // Offline State
                          Container(
                            padding: const EdgeInsets.all(32),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(color: Colors.grey.shade200),
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.bolt,
                                  size: 64,
                                  color: Colors.grey[300],
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  "You're currently offline",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Go online to start receiving job requests in your area',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                                const SizedBox(height: 24),
                                ElevatedButton(
                                  onPressed:
                                      () => provider.toggleOnlineStatus(),
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 32,
                                      vertical: 12,
                                    ),
                                    backgroundColor: Colors.pink.shade400,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  child: const Text('Go Online'),
                                ),
                              ],
                            ),
                          ),
                        ],
                        const SizedBox(
                          height: 80,
                        ), // Bottom padding for navigation bar
                      ],
                    ),
                  ),
                ),
                // Bottom Navigation Bar
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top: BorderSide(color: Colors.grey.shade200, width: 1),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.home, color: Colors.pink.shade400, size: 24),
                        Icon(
                          Icons.message_rounded,
                          color: Colors.grey[400],
                          size: 24,
                        ),
                        Icon(
                          Icons.show_chart,
                          color: Colors.grey[400],
                          size: 24,
                        ),
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
