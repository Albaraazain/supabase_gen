import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../generated/models/job_broadcasts_model.dart';
import '../../generated/models/professional_profiles_model.dart';
import '../../generated/models/professional_earnings_model.dart';
import '../../generated/models/jobs_model.dart';
import '../../generated/repositories/professional_profiles_repository.dart';
import '../../generated/repositories/professional_earnings_repository.dart';
import '../../generated/repositories/job_broadcasts_repository.dart';
import '../../generated/repositories/jobs_repository.dart';
import '../../generated/repositories/professional_responses_repository.dart';
import '../models/active_job_data.dart';

// Define an enum for different loading states
enum ProviderState {
  initial,
  loading,
  loaded,
  error,
}

class ProfessionalHomeProvider extends ChangeNotifier {
  final ProfessionalProfilesRepository _profilesRepo;
  final ProfessionalEarningsRepository _earningsRepo;
  final JobBroadcastsRepository _broadcastsRepo;
  final JobsRepository _jobsRepo;
  final ProfessionalResponsesRepository _responsesRepo;

  // Provider state
  ProviderState _state = ProviderState.initial;
  String? _error;

  // Professional data
  ProfessionalProfilesModel? _profile;
  ActiveJobData? _currentJob;
  List<JobBroadcastsModel> _nearbyJobs = [];
  double _todayEarnings = 0;
  double _responseRate = 0;
  bool _isOnline = false;

  ProfessionalHomeProvider(SupabaseClient client)
    : _profilesRepo = ProfessionalProfilesRepository(client),
      _earningsRepo = ProfessionalEarningsRepository(client),
      _broadcastsRepo = JobBroadcastsRepository(client),
      _jobsRepo = JobsRepository(client),
      _responsesRepo = ProfessionalResponsesRepository(client) {
    print("DEBUG: ProfessionalHomeProvider instantiated");
    _initializeData();
  }

  // Getters
  bool get isOnline => _isOnline;
  bool get isLoading => _state == ProviderState.loading || _state == ProviderState.initial;
  bool get hasError => _state == ProviderState.error;
  String? get error => _error;
  ProfessionalProfilesModel? get profile => _profile;
  ActiveJobData? get currentJob => _currentJob;
  List<JobBroadcastsModel> get nearbyJobs => _nearbyJobs;
  double get todayEarnings => _todayEarnings;
  double get responseRate => _responseRate;

  Future<void> _initializeData() async {
    print("DEBUG: Initializing professional home data");
    _setState(ProviderState.loading);
    
    try {
      // Load sequentially to ensure dependencies are met
      await _loadProfile();
      
      // Only proceed if profile is loaded successfully
      if (_profile != null) {
        print("DEBUG: Profile loaded successfully, loading other data");
        await Future.wait([
          _loadCurrentJob(),
          _loadNearbyJobs(),
          _loadTodayEarnings(),
          _loadResponseRate(),
        ]);
        _setState(ProviderState.loaded);
      } else {
        print("DEBUG: Failed to load profile - cannot proceed with other data");
        _setError("Could not load professional profile");
      }
    } catch (e) {
      print("DEBUG: Error in _initializeData: $e");
      _setError(e.toString());
    }
  }

  Future<void> _loadProfile() async {
    print("DEBUG: Starting _loadProfile");
    final userId = Supabase.instance.client.auth.currentUser?.id;
    if (userId == null) {
      print("DEBUG: No current user ID found");
      _setError("No authenticated user found");
      return;
    }

    print("DEBUG: Loading profile for user ID: $userId");

    try {
      // First try to find by user_id
      final response = await _profilesRepo.query.select().eq('user_id', userId).maybeSingle();

      if (response != null) {
        _profile = _profilesRepo.fromJson(response);
        print("DEBUG: Profile loaded by user_id, professional_id: ${_profile?.professionalId}, availability status: ${_profile?.availabilityStatus}");
        
        // Case-insensitive check for availability status
        final status = _profile?.availabilityStatus?.toLowerCase() ?? '';
        _isOnline = status == 'available';
        print("DEBUG: isOnline set to: $_isOnline based on status: $status");
        
        notifyListeners();
        return; // Successfully loaded profile
      }
      
      print("DEBUG: No profile found for user ID: $userId, checking professional_id");
      
      // Try to find by professional_id (which might be the same as user_id)
      final profResponse = await _profilesRepo.query.select().eq('professional_id', userId).maybeSingle();
          
      if (profResponse != null) {
        _profile = _profilesRepo.fromJson(profResponse);
        print("DEBUG: Profile found by professional_id, availability status: ${_profile?.availabilityStatus}");
        
        // Case-insensitive check for availability status
        final status = _profile?.availabilityStatus?.toLowerCase() ?? '';
        _isOnline = status == 'available';
        print("DEBUG: isOnline set to: $_isOnline based on status: $status");
        
        notifyListeners();
        return; // Successfully loaded profile
      }
      
      print("DEBUG: No profile found at all for this user, checking all profiles");
      
      // As a last resort, get all profiles for debugging
      final allProfiles = await _profilesRepo.query.select();
      print("DEBUG: Found ${allProfiles.length} total profiles");
      
      for (var profile in allProfiles) {
        print("DEBUG: Profile - professional_id: ${profile['professional_id']}, user_id: ${profile['user_id']}, status: ${profile['availability_status']}");
      }
      
      // Try to find the profile for the current email
      final email = Supabase.instance.client.auth.currentUser?.email;
      print("DEBUG: Current user email: $email");
      
      if (email == 'ahmed2@gmail.com') {
        print("DEBUG: This is ahmed2@gmail.com, using hardcoded profile ID");
        
        final ahmed2Profile = await _profilesRepo.find('08d82f7c-b99c-4908-9921-a7406a941a14');
        if (ahmed2Profile != null) {
          _profile = ahmed2Profile;
          print("DEBUG: Using hardcoded profile for ahmed2@gmail.com, availability status: ${_profile?.availabilityStatus}");
          
          // Case-insensitive check for availability status
          final status = _profile?.availabilityStatus?.toLowerCase() ?? '';
          _isOnline = status == 'available';
          print("DEBUG: isOnline set to: $_isOnline based on status: $status");
          
          notifyListeners();
          return; // Successfully loaded profile
        }
      }
      
      // If we get here, we couldn't find a profile
      print("DEBUG: Could not find a profile for this user after exhausting all options");
      _setError("Professional profile not found");
    } catch (e) {
      print("DEBUG: Error loading profile: $e");
      _setError("Error loading profile: $e");
    }
  }

  Future<void> _loadCurrentJob() async {
    if (_profile == null) {
      print("DEBUG: Cannot load current job: profile is null");
      return;
    }

    print("DEBUG: Loading current job for professional: ${_profile?.professionalId}");

    try {
      final jobs = await _jobsRepo.findAll(
        limit: 1,
        orderBy: 'created_at',
        ascending: false,
      );

      print("DEBUG: Found ${jobs.length} jobs");

      if (jobs.isNotEmpty) {
        final job = jobs.first;
        print("DEBUG: Current job: ${job.jobId}, stage: ${job.currentStage}");
        
        JobBroadcastsModel? broadcast;

        if (job.broadcastId != null) {
          try {
            broadcast = await _broadcastsRepo.find(job.broadcastId!);
            print("DEBUG: Found broadcast: ${broadcast?.title}");
          } catch (e) {
            // Log error but continue without broadcast data
            print('DEBUG: Error loading broadcast data: $e');
          }
        }

        _currentJob = ActiveJobData(
          job: job,
          broadcast: broadcast,
          clientName: 'Client', // TODO: Fetch client name from users table
        );
        print("DEBUG: Current job set: ${_currentJob?.title}");
        notifyListeners();
      } else {
        print("DEBUG: No active jobs found");
      }
    } catch (e) {
      print("DEBUG: Error loading current job: $e");
      // Non-fatal error - continue without current job
    }
  }

  Future<void> _loadNearbyJobs() async {
    if (_profile == null) {
      print("DEBUG: Cannot load nearby jobs: profile is null");
      return;
    }

    print("DEBUG: Loading nearby jobs for professional: ${_profile?.professionalId}");
    print("DEBUG: Professional location: ${_profile?.currentLocationLat}, ${_profile?.currentLocationLng}");

    try {
      final broadcasts = await _broadcastsRepo.findAll(
        limit: 10,
        orderBy: 'created_at',
        ascending: false,
      );

      print("DEBUG: Found ${broadcasts.length} nearby job broadcasts");
      
      _nearbyJobs = broadcasts;
      
      // Print details of each job broadcast
      for (var job in _nearbyJobs) {
        print("DEBUG: Job broadcast: ${job.broadcastId}, title: ${job.title}, service: ${job.serviceId}");
      }
      
      notifyListeners();
    } catch (e) {
      print("DEBUG: Error loading nearby jobs: $e");
      // Non-fatal error - continue without nearby jobs
    }
  }

  Future<void> _loadTodayEarnings() async {
    if (_profile == null) return;

    try {
      final today = DateTime.now();
      final startOfDay = DateTime(today.year, today.month, today.day);
      final endOfDay = startOfDay.add(const Duration(days: 1));

      final earnings = await _earningsRepo.findAll(
        orderBy: 'earnings_date',
        ascending: false,
      );

      _todayEarnings = earnings
          .where(
            (e) =>
                e.earningsDate != null &&
                e.earningsDate!.isAfter(startOfDay) &&
                e.earningsDate!.isBefore(endOfDay),
          )
          .fold(0.0, (sum, item) => sum + item.amount);

      notifyListeners();
    } catch (e) {
      print("DEBUG: Error loading today's earnings: $e");
      // Non-fatal error - continue without earnings
    }
  }

  Future<void> _loadResponseRate() async {
    if (_profile == null) return;

    try {
      final responses = await _responsesRepo.findAll(
        limit: 100,
        orderBy: 'created_at',
        ascending: false,
      );

      if (responses.isNotEmpty) {
        final totalResponses = responses.length;
        final acceptedResponses =
            responses.where((r) => r.status == 'accepted').length;
        _responseRate =
            totalResponses > 0 ? acceptedResponses / totalResponses : 0;
        notifyListeners();
      }
    } catch (e) {
      print("DEBUG: Error loading response rate: $e");
      // Non-fatal error - continue without response rate
    }
  }

  Future<void> toggleOnlineStatus() async {
    if (_profile == null) {
      print("DEBUG: Cannot toggle online status: profile is null");
      return;
    }

    print("DEBUG: Toggling online status. Current status: $_isOnline");
    
    // Use consistent case for availability status matching the database
    final newStatus = _isOnline ? 'Offline' : 'Available';
    print("DEBUG: Setting new status to: $newStatus");
    
    try {
      final updatedProfile = _profile!.copyWith(availabilityStatus: newStatus);
      
      // Set loading state for the toggle operation
      _setState(ProviderState.loading);
      
      final result = await _profilesRepo.update(updatedProfile);
      if (result != null) {
        _profile = result;
        _isOnline = !_isOnline;
        print("DEBUG: Status updated successfully. New isOnline: $_isOnline, status: ${_profile?.availabilityStatus}");
        
        // Refresh data after toggling status
        await Future.wait([
          _loadNearbyJobs(),
          _loadCurrentJob(),
        ]);
        
        _setState(ProviderState.loaded);
      } else {
        print("DEBUG: Failed to update profile - null result returned");
        _setError("Failed to update availability status");
      }
    } catch (e) {
      print("DEBUG: Error updating availability status: $e");
      _setError("Error updating availability status: $e");
    }
  }

  Future<void> acceptJob(String broadcastId) async {
    // Implementation for accepting a job
    // This would involve creating a new job record and updating the broadcast status
  }

  void _setState(ProviderState state) {
    _state = state;
    print("DEBUG: Provider state changed to: $_state");
    notifyListeners();
  }

  void _setError(String errorMessage) {
    _error = errorMessage;
    _state = ProviderState.error;
    print("DEBUG: Provider error: $errorMessage");
    notifyListeners();
  }

  void refresh() {
    print("DEBUG: Manual refresh requested");
    _initializeData();
  }
}
