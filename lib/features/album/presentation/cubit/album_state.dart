import 'package:task_app/core/common/exports.dart';



class AlbumState {
  final bool isLoading;
  final bool isSuccess;
  final AppErrorHandler? error;

  final List<AlbumEntity> userAlbums;
  final AlbumEntity? selectedAlbum;
  AlbumState({
    required this.isLoading,
    required this.isSuccess,
    this.error,
    required this.userAlbums,
    this.selectedAlbum,
  });

  factory AlbumState.initial() {
    return AlbumState(
      isLoading: false,
      isSuccess: false,
      error: null,
      userAlbums: const [],
    );
  }

  AlbumState copyWith({
    bool? isLoading,
    bool? isSuccess,
    ValueGetter<AppErrorHandler?>? error,
    List<AlbumEntity>? userAlbums,
    ValueGetter<AlbumEntity?>? selectedAlbum,
  }) {
    return AlbumState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error != null ? error() : this.error,
      userAlbums: userAlbums ?? this.userAlbums,
      selectedAlbum:
          selectedAlbum != null ? selectedAlbum() : this.selectedAlbum,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'is_loading': isLoading,
      'is_success': isSuccess,
      'error': error?.toMap(),
      'user_albums': userAlbums.map((x) => x.toMap()).toList(),
      'selected_album': selectedAlbum?.toMap(),
    };
  }

  factory AlbumState.fromMap(Map<String, dynamic> map) {
    return AlbumState(
      isLoading: map['is_loading'] ?? false,
      isSuccess: map['is_success'] ?? false,
      error:
          map['error'] != null ? AppErrorHandler.fromMap(map['error']) : null,
      userAlbums: List<AlbumEntity>.from(
          map['user_albums']?.map((x) => AlbumEntity.fromMap(x)) ?? const []),
      selectedAlbum: map['selected_album'] != null
          ? AlbumEntity.fromMap(map['selected_album'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AlbumState.fromJson(String source) =>
      AlbumState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AlbumState(isLoading: $isLoading, isSuccess: $isSuccess, error: $error, userAlbums: $userAlbums, selectedAlbum: $selectedAlbum)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AlbumState &&
        other.isLoading == isLoading &&
        other.isSuccess == isSuccess &&
        other.error == error &&
        listEquals(other.userAlbums, userAlbums) &&
        other.selectedAlbum == selectedAlbum;
  }

  @override
  int get hashCode {
    return isLoading.hashCode ^
        isSuccess.hashCode ^
        error.hashCode ^
        userAlbums.hashCode ^
        selectedAlbum.hashCode;
  }
}
