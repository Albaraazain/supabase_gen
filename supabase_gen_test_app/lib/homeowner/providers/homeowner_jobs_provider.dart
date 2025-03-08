import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../generated/repositories/jobs_repository.dart';
import '../../generated/models/jobs_model.dart';
import '../../services/logger_service.dart';

/// Provider for managing homeowner jobs
class HomeownerJobsProvider extends ChangeNotifier {
  final SupabaseClient _client;
  final LoggerService _logger = LoggerService();
  final JobsRepository _repository;
  
  List<JobsModel> _jobs = [];
  bool _isLoading = false;
  String? _error;

  /// Creates a new instance of [HomeownerJobsProvider]
  HomeownerJobsProvider(this._client) 
      : _repository = JobsRepository(_client) {
    _logger.info('HomeownerJobsProvider initialized', tag: 'HomeownerJobsProvider');
  }

  /// The list of jobs for this homeowner
  List<JobsModel> get jobs => _jobs;
  
  /// Whether the provider is currently loading data
  bool get isLoading => _isLoading;
  
  /// The most recent error message, if any
  String? get error => _error;
  
  /// Whether the homeowner has any jobs
  bool get hasJobs => _jobs.isNotEmpty;

  /// Loads jobs for the given homeowner ID
  Future<void> loadJobs(String homeownerId) async {
    if (homeownerId.isEmpty) {
      _logger.warning('Cannot load jobs: homeownerId is empty', tag: 'HomeownerJobsProvider');
      return;
    }
    
    _setLoading(true);

    try {
      _logger.info('Loading jobs for homeowner: $homeownerId', tag: 'HomeownerJobsProvider');
      
      final response = await _client
          .from('jobs')
          .select('*, services(*)')
          .eq('homeowner_id', homeownerId)
          .order('created_at', ascending: false);
      
      _jobs = response.map((job) => JobsModel.fromJson(job)).toList();
      
      _logger.info('Loaded ${_jobs.length} jobs for homeowner', tag: 'HomeownerJobsProvider');
      
      _setLoading(false);
    } catch (e) {
      _handleError('Error loading homeowner jobs', e);
    }
  }

  /// Creates a new job for the homeowner
  Future<JobsModel?> createJob({
    required String homeownerId,
    required String serviceId,
    String? description,
    DateTime? scheduledTime,
    int? estimatedDuration,
  }) async {
    if (homeownerId.isEmpty || serviceId.isEmpty) {
      _logger.warning('Cannot create job: required parameters missing', tag: 'HomeownerJobsProvider');
      return null;
    }
    
    _setLoading(true);

    try {
      _logger.info('Creating new job for homeowner: $homeownerId, service: $serviceId', 
          tag: 'HomeownerJobsProvider');
      
      // Create a new job in broadcast stage
      final newJob = JobsModel(
        jobId: 'job_${DateTime.now().millisecondsSinceEpoch}',
        homeownerId: homeownerId,
        professionalId: '', // Will be assigned when a professional accepts
        serviceId: serviceId,
        currentStage: 'broadcast', // Initial stage
        scheduledTime: scheduledTime,
        estimatedDuration: estimatedDuration,
      );
      
      final createdJob = await _repository.insert(newJob);
      
      // Add to local list
      _jobs.insert(0, createdJob);
      
      _logger.info('Job created successfully: ${createdJob.jobId}', tag: 'HomeownerJobsProvider');
      
      _setLoading(false);
      return createdJob;
    } catch (e) {
      _handleError('Error creating job', e);
      return null;
    }
  }

  /// Cancels a job
  Future<bool> cancelJob(String jobId) async {
    if (jobId.isEmpty) {
      _logger.warning('Cannot cancel job: jobId is empty', tag: 'HomeownerJobsProvider');
      return false;
    }
    
    _setLoading(true);

    try {
      _logger.info('Cancelling job: $jobId', tag: 'HomeownerJobsProvider');
      
      // Find the job
      final jobIndex = _jobs.indexWhere((job) => job.jobId == jobId);
      if (jobIndex == -1) {
        throw Exception('Job not found');
      }
      
      final job = _jobs[jobIndex];
      
      // Update job status
      final updatedJob = job.copyWith(
        currentStage: 'cancelled',
      );
      
      final result = await _repository.update(updatedJob);
      
      if (result != null) {
        // Update local list
        _jobs[jobIndex] = result;
        
        _logger.info('Job cancelled successfully', tag: 'HomeownerJobsProvider');
        
        _setLoading(false);
        return true;
      } else {
        throw Exception('Failed to update job');
      }
    } catch (e) {
      _handleError('Error cancelling job', e);
      return false;
    }
  }

  /// Reschedules a job
  Future<bool> rescheduleJob(String jobId, DateTime newScheduledTime) async {
    if (jobId.isEmpty) {
      _logger.warning('Cannot reschedule job: jobId is empty', tag: 'HomeownerJobsProvider');
      return false;
    }
    
    _setLoading(true);

    try {
      _logger.info('Rescheduling job: $jobId to ${newScheduledTime.toIso8601String()}', 
          tag: 'HomeownerJobsProvider');
      
      // Find the job
      final jobIndex = _jobs.indexWhere((job) => job.jobId == jobId);
      if (jobIndex == -1) {
        throw Exception('Job not found');
      }
      
      final job = _jobs[jobIndex];
      
      // Update job scheduled time
      final updatedJob = job.copyWith(
        scheduledTime: newScheduledTime,
      );
      
      final result = await _repository.update(updatedJob);
      
      if (result != null) {
        // Update local list
        _jobs[jobIndex] = result;
        
        _logger.info('Job rescheduled successfully', tag: 'HomeownerJobsProvider');
        
        _setLoading(false);
        return true;
      } else {
        throw Exception('Failed to update job');
      }
    } catch (e) {
      _handleError('Error rescheduling job', e);
      return false;
    }
  }

  /// Gets a job by ID
  JobsModel? getJobById(String jobId) {
    return _jobs.firstWhere((job) => job.jobId == jobId, orElse: () => null as JobsModel);
  }

  /// Clears any error message
  void clearError() {
    if (_error != null) {
      _error = null;
      notifyListeners();
    }
  }
  
  // Private helper methods
  
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
  
  void _handleError(String message, dynamic error) {
    final errorMessage = error.toString();
    _error = errorMessage;
    _logger.error('$message: $errorMessage', tag: 'HomeownerJobsProvider', error: error);
    _isLoading = false;
    notifyListeners();
  }
} 