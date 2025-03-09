import '../../generated/models/jobs_model.dart';
import '../../generated/models/job_broadcasts_model.dart';

class ActiveJobData {
  final JobsModel job;
  final JobBroadcastsModel? broadcast;
  final String? clientName;

  const ActiveJobData({required this.job, this.broadcast, this.clientName});

  String get title => broadcast?.title ?? 'Job ${job.jobId}';
  String get location => broadcast?.locationAddress ?? 'No location provided';
  String get stage => job.currentStage;
  bool get isStarted => job.workStartedAt != null;
}
