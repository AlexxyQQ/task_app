import 'package:task_app/core/common/exports.dart';



class CommentState {
  final bool isLoading;
  final bool isSuccess;
  final AppErrorHandler? error;

  final List<CommentEntity> comments;

  CommentState({
    required this.isLoading,
    required this.isSuccess,
    required this.error,
    required this.comments,
  });

  factory CommentState.initial() {
    return CommentState(
      isLoading: false,
      isSuccess: false,
      error: null,
      comments: const [],
    );
  }

  CommentState copyWith({
    bool? isLoading,
    bool? isSuccess,
    ValueGetter<AppErrorHandler?>? error,
    List<CommentEntity>? comments,
  }) {
    return CommentState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error != null ? error() : this.error,
      comments: comments ?? this.comments,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'is_loading': isLoading,
      'is_success': isSuccess,
      'error': error?.toMap(),
      'comments': comments.map((x) => x.toMap()).toList(),
    };
  }

  factory CommentState.fromMap(Map<String, dynamic> map) {
    return CommentState(
      isLoading: map['is_loading'] ?? false,
      isSuccess: map['is_success'] ?? false,
      error:
          map['error'] != null ? AppErrorHandler.fromMap(map['error']) : null,
      comments: List<CommentEntity>.from(
          map['comments']?.map((x) => CommentEntity.fromMap(x)) ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentState.fromJson(String source) =>
      CommentState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CommentState(isLoading: $isLoading, isSuccess: $isSuccess, error: $error, comments: $comments)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CommentState &&
        other.isLoading == isLoading &&
        other.isSuccess == isSuccess &&
        other.error == error &&
        listEquals(other.comments, comments);
  }

  @override
  int get hashCode {
    return isLoading.hashCode ^
        isSuccess.hashCode ^
        error.hashCode ^
        comments.hashCode;
  }
}
