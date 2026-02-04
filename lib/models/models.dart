class ExerciseRecord {
  final String id;
  final String date;
  final String exerciseType;
  final int duration;
  final String? notes;
  final DateTime createdAt;

  ExerciseRecord({
    required this.id,
    required this.date,
    required this.exerciseType,
    required this.duration,
    this.notes,
    required this.createdAt,
  });

  factory ExerciseRecord.fromJson(Map<String, dynamic> json) {
    return ExerciseRecord(
      id: json['id'] as String,
      date: json['date'] as String,
      exerciseType: json['exercise_type'] as String,
      duration: json['duration'] as int,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'exercise_type': exerciseType,
      'duration': duration,
      'notes': notes,
    };
  }
}

class StudyRecord {
  final String id;
  final String date;
  final String subject;
  final int duration;
  final String? content;
  final int progress;
  final String? notes;
  final DateTime createdAt;

  StudyRecord({
    required this.id,
    required this.date,
    required this.subject,
    required this.duration,
    this.content,
    required this.progress,
    this.notes,
    required this.createdAt,
  });

  factory StudyRecord.fromJson(Map<String, dynamic> json) {
    return StudyRecord(
      id: json['id'] as String,
      date: json['date'] as String,
      subject: json['subject'] as String,
      duration: json['duration'] as int,
      content: json['content'] as String?,
      progress: json['progress'] as int,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'subject': subject,
      'duration': duration,
      'content': content,
      'progress': progress,
      'notes': notes,
    };
  }
}

class Statistics {
  final int totalExerciseDuration;
  final int totalStudyDuration;
  final int exerciseCount;
  final int studyCount;
  final List<SubjectProgress> subjectProgress;

  Statistics({
    required this.totalExerciseDuration,
    required this.totalStudyDuration,
    required this.exerciseCount,
    required this.studyCount,
    required this.subjectProgress,
  });
}

class SubjectProgress {
  final String subject;
  final int totalDuration;
  final int averageProgress;

  SubjectProgress({
    required this.subject,
    required this.totalDuration,
    required this.averageProgress,
  });
}
