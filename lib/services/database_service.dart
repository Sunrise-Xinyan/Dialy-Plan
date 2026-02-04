import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';

class DatabaseService {
  final _supabase = Supabase.instance.client;

  // ==================== 运动记录 ====================
  
  Future<List<ExerciseRecord>> getExerciseRecords({int limit = 50}) async {
    final response = await _supabase
        .from('exercise_records')
        .select()
        .order('date', ascending: false)
        .order('created_at', ascending: false)
        .limit(limit);
    
    return (response as List)
        .map((json) => ExerciseRecord.fromJson(json))
        .toList();
  }

  Future<ExerciseRecord> createExerciseRecord(ExerciseRecord record) async {
    final response = await _supabase
        .from('exercise_records')
        .insert(record.toJson())
        .select()
        .single();
    
    return ExerciseRecord.fromJson(response);
  }

  Future<void> deleteExerciseRecord(String id) async {
    await _supabase.from('exercise_records').delete().eq('id', id);
  }

  // ==================== 学习记录 ====================
  
  Future<List<StudyRecord>> getStudyRecords({int limit = 50}) async {
    final response = await _supabase
        .from('study_records')
        .select()
        .order('date', ascending: false)
        .order('created_at', ascending: false)
        .limit(limit);
    
    return (response as List)
        .map((json) => StudyRecord.fromJson(json))
        .toList();
  }

  Future<StudyRecord> createStudyRecord(StudyRecord record) async {
    final response = await _supabase
        .from('study_records')
        .insert(record.toJson())
        .select()
        .single();
    
    return StudyRecord.fromJson(response);
  }

  Future<void> deleteStudyRecord(String id) async {
    await _supabase.from('study_records').delete().eq('id', id);
  }

  // ==================== 统计 ====================
  
  Future<Statistics> getStatistics(String startDate, String endDate) async {
    // 获取运动记录
    final exerciseResponse = await _supabase
        .from('exercise_records')
        .select('duration')
        .gte('date', startDate)
        .lte('date', endDate);
    
    final exercises = exerciseResponse as List;
    final totalExerciseDuration = exercises.fold<int>(
      0,
      (sum, record) => sum + (record['duration'] as int? ?? 0),
    );
    final exerciseCount = exercises.length;

    // 获取学习记录
    final studyResponse = await _supabase
        .from('study_records')
        .select('subject, duration, progress')
        .gte('date', startDate)
        .lte('date', endDate);
    
    final studies = studyResponse as List;
    final totalStudyDuration = studies.fold<int>(
      0,
      (sum, record) => sum + (record['duration'] as int? ?? 0),
    );
    final studyCount = studies.length;

    // 按科目统计
    final subjectMap = <String, Map<String, int>>{};
    for (var record in studies) {
      final subject = record['subject'] as String;
      if (!subjectMap.containsKey(subject)) {
        subjectMap[subject] = {'totalDuration': 0, 'totalProgress': 0, 'count': 0};
      }
      subjectMap[subject]!['totalDuration'] = 
          (subjectMap[subject]!['totalDuration'] ?? 0) + (record['duration'] as int? ?? 0);
      subjectMap[subject]!['totalProgress'] = 
          (subjectMap[subject]!['totalProgress'] ?? 0) + (record['progress'] as int? ?? 0);
      subjectMap[subject]!['count'] = (subjectMap[subject]!['count'] ?? 0) + 1;
    }

    final subjectProgress = subjectMap.entries.map((entry) {
      final count = entry.value['count'] ?? 1;
      return SubjectProgress(
        subject: entry.key,
        totalDuration: entry.value['totalDuration'] ?? 0,
        averageProgress: count > 0 
            ? ((entry.value['totalProgress'] ?? 0) / count).round() 
            : 0,
      );
    }).toList();

    return Statistics(
      totalExerciseDuration: totalExerciseDuration,
      totalStudyDuration: totalStudyDuration,
      exerciseCount: exerciseCount,
      studyCount: studyCount,
      subjectProgress: subjectProgress,
    );
  }

  Future<Statistics> getTodayStatistics() async {
    final today = DateTime.now().toIso8601String().split('T')[0];
    return getStatistics(today, today);
  }

  Future<Statistics> getWeekStatistics() async {
    final today = DateTime.now();
    final weekAgo = today.subtract(const Duration(days: 7));
    return getStatistics(
      weekAgo.toIso8601String().split('T')[0],
      today.toIso8601String().split('T')[0],
    );
  }

  Future<Statistics> getMonthStatistics() async {
    final today = DateTime.now();
    final monthAgo = today.subtract(const Duration(days: 30));
    return getStatistics(
      monthAgo.toIso8601String().split('T')[0],
      today.toIso8601String().split('T')[0],
    );
  }
}
