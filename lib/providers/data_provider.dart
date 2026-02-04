import 'package:flutter/material.dart';
import '../models/models.dart';
import '../services/database_service.dart';

class DataProvider with ChangeNotifier {
  final _db = DatabaseService();
  
  List<ExerciseRecord> _exerciseRecords = [];
  List<StudyRecord> _studyRecords = [];
  Statistics? _todayStats;
  bool _isLoading = false;

  List<ExerciseRecord> get exerciseRecords => _exerciseRecords;
  List<StudyRecord> get studyRecords => _studyRecords;
  Statistics? get todayStats => _todayStats;
  bool get isLoading => _isLoading;

  Future<void> loadExerciseRecords() async {
    _isLoading = true;
    notifyListeners();
    
    try {
      _exerciseRecords = await _db.getExerciseRecords();
    } catch (e) {
      debugPrint('加载运动记录失败: $e');
    }
    
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addExerciseRecord(ExerciseRecord record) async {
    try {
      await _db.createExerciseRecord(record);
      await loadExerciseRecords();
      await loadTodayStats();
    } catch (e) {
      debugPrint('添加运动记录失败: $e');
      rethrow;
    }
  }

  Future<void> deleteExerciseRecord(String id) async {
    try {
      await _db.deleteExerciseRecord(id);
      await loadExerciseRecords();
      await loadTodayStats();
    } catch (e) {
      debugPrint('删除运动记录失败: $e');
      rethrow;
    }
  }

  Future<void> loadStudyRecords() async {
    _isLoading = true;
    notifyListeners();
    
    try {
      _studyRecords = await _db.getStudyRecords();
    } catch (e) {
      debugPrint('加载学习记录失败: $e');
    }
    
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addStudyRecord(StudyRecord record) async {
    try {
      await _db.createStudyRecord(record);
      await loadStudyRecords();
      await loadTodayStats();
    } catch (e) {
      debugPrint('添加学习记录失败: $e');
      rethrow;
    }
  }

  Future<void> deleteStudyRecord(String id) async {
    try {
      await _db.deleteStudyRecord(id);
      await loadStudyRecords();
      await loadTodayStats();
    } catch (e) {
      debugPrint('删除学习记录失败: $e');
      rethrow;
    }
  }

  Future<void> loadTodayStats() async {
    try {
      _todayStats = await _db.getTodayStatistics();
      notifyListeners();
    } catch (e) {
      debugPrint('加载今日统计失败: $e');
    }
  }
}
