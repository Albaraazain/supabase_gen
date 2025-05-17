# Database Documentation

## Guides

- [Filter Usage Guide](./filter_usage_guide.dart)
- [UI Rebuilding Guide](./ui_rebuilding_guide.dart)
- [User Feedback Guide](./user_feedback_guide.dart)
- [Database Triggers Guide](./database_triggers.md)

## Database Features

### Database Triggers

Database triggers are special procedures that are automatically executed when specific events occur on a table. Supabase Gen now provides comprehensive documentation of these triggers, including the actual function bodies that get executed.

In your generated codebase, trigger information is documented in several places:

1. **Model Files**: Each model file contains comments listing all triggers associated with the table.
2. **Repository Files**: Repositories include trigger documentation to help you understand the backend operations that might affect your CRUD operations.
3. **Provider Files**: Providers also include trigger information to maintain awareness throughout the stack.

#### Understanding Trigger Documentation

Trigger documentation follows this enhanced format that includes the function body:

```dart
/// Database triggers associated with this table:
/// - trigger_name: EVENT TIMING - EXECUTE FUNCTION function_name()
///   Signature: function_name(parameters) RETURNS return_type
///   Language: plpgsql
///   Description: Function comment if available
///   Body: Function body (simplified version)
```

Where:
- **trigger_name**: The name of the trigger in the database
- **EVENT**: The event that activates the trigger (INSERT, UPDATE, DELETE)
- **TIMING**: When the trigger executes (BEFORE, AFTER)
- **function_name**: The name of the PostgreSQL function called by the trigger
- **parameters**: Function parameters, if any
- **return_type**: The function's return type (typically 'trigger')
- **Language**: The programming language of the function (plpgsql, SQL, etc.)
- **Description**: Any comments that were added to the function in the database
- **Body**: A simplified version of the function's implementation

#### Example

```dart
/// Database triggers associated with this table:
/// - update_timestamp: UPDATE BEFORE - EXECUTE FUNCTION update_timestamp()
///   Signature: update_timestamp() RETURNS trigger
///   Language: plpgsql
///   Description: Updates the updated_at timestamp automatically
///   Body: BEGIN NEW.updated_at := NOW(); RETURN NEW; END;
```

This trigger automatically updates the `updated_at` column with the current timestamp before any UPDATE operation.

#### Advanced Function Introspection

To get the most detailed trigger documentation in your generated code, make sure to deploy the advanced function introspection SQL functions from `lib/generated/docs/advanced_function_introspection.sql` to your Supabase project. These functions provide detailed information about trigger functions including their bodies, improving code documentation.

### How Triggers Affect Your Code

While triggers are implemented at the database level and not directly in the generated Dart code, understanding them is important because:

1. **Data Consistency**: Triggers can automatically maintain fields like timestamps, which means you don't need to set them in your code.
2. **Validation**: Some triggers may enforce business rules that reject operations if certain conditions aren't met.
3. **Cascading Changes**: Triggers might update or delete related records in other tables.
4. **Performance Considerations**: Complex triggers can affect the performance of write operations.

### Working with Tables that Have Triggers

When working with tables that have triggers:

1. Be aware that some fields might be set automatically by triggers.
2. Check the trigger documentation if unexpected behavior occurs during create/update/delete operations.
3. Consider the effects of triggers when planning batch operations or transactions.

## Tables

- [DiagnosisPhaseModel](./tables/diagnosis_phase.md)
- [ConversationsModel](./tables/conversations.md)
- [EnRoutePhaseModel](./tables/en_route_phase.md)
- [ErrorLogsModel](./tables/error_logs.md)
- [HomeownerLocationUpdatesModel](./tables/homeowner_location_updates.md)
- [JobBroadcastsModel](./tables/job_broadcasts.md)
- [JobStageHistoryModel](./tables/job_stage_history.md)
- [LocationMapSettingsModel](./tables/location_map_settings.md)
- [LocationVerificationAttemptsModel](./tables/location_verification_attempts.md)
- [MessagesModel](./tables/messages.md)
- [MaterialUsageModel](./tables/material_usage.md)
- [PausePeriodsModel](./tables/pause_periods.md)
- [PaymentMethodsModel](./tables/payment_methods.md)
- [ProfessionalEarningsModel](./tables/professional_earnings.md)
- [ProfessionalLocationUpdatesModel](./tables/professional_location_updates.md)
- [ProfessionalResponsesModel](./tables/professional_responses.md)
- [QuoteLineItemsModel](./tables/quote_line_items.md)
- [ServiceCategoriesModel](./tables/service_categories.md)
- [QuotePhaseModel](./tables/quote_phase.md)
- [SafetyChecksModel](./tables/safety_checks.md)
- [SitePhotosModel](./tables/site_photos.md)
- [SessionPauseReasonsModel](./tables/session_pause_reasons.md)
- [WorkTasksModel](./tables/work_tasks.md)
- [TestJobsModel](./tables/test_jobs.md)
- [WorkSessionsModel](./tables/work_sessions.md)
- [WorkUpdatesModel](./tables/work_updates.md)
- [WorkingPhaseModel](./tables/working_phase.md)
- [ActiveJobsModel](./tables/active_jobs.md)
- [DiagnosisFindingsModel](./tables/diagnosis_findings.md)
- [FindingPhotosModel](./tables/finding_photos.md)
- [HomeownerProfilesModel](./tables/homeowner_profiles.md)
- [TaskPhotosModel](./tables/task_photos.md)
- [JobTasksModel](./tables/job_tasks.md)
- [JobsModel](./tables/jobs.md)
- [LocationBookmarksModel](./tables/location_bookmarks.md)
- [LocationVerificationsModel](./tables/location_verifications.md)
- [UsersModel](./tables/users.md)
- [PreparationChecksModel](./tables/preparation_checks.md)
- [ProfessionalProfilesModel](./tables/professional_profiles.md)
- [ProfessionalServicesModel](./tables/professional_services.md)
- [QuoteHistoryModel](./tables/quote_history.md)
- [WorkTimelineEventsModel](./tables/work_timeline_events.md)
- [ServiceQuotesModel](./tables/service_quotes.md)
- [ServicesModel](./tables/services.md)
