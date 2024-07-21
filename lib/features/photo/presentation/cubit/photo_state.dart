import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'package:task_app/core/common/exports.dart';

class PhotoState {
  final bool isLoading;
  final bool isSuccess;

  final AppErrorHandler? error;

  final List<PhotoEntity> userPhotos;
  final PhotoEntity? selectedPhoto;
  PhotoState({
    required this.isLoading,
    required this.isSuccess,
    this.error,
    required this.userPhotos,
    this.selectedPhoto,
  });

  factory PhotoState.initial() {
    return PhotoState(
      isLoading: false,
      isSuccess: false,
      error: null,
      userPhotos: const [],
      selectedPhoto: null,
    );
  }

  PhotoState copyWith({
    bool? isLoading,
    bool? isSuccess,
    ValueGetter<AppErrorHandler?>? error,
    List<PhotoEntity>? userPhotos,
    ValueGetter<PhotoEntity?>? selectedPhoto,
  }) {
    return PhotoState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error != null ? error() : this.error,
      userPhotos: userPhotos ?? this.userPhotos,
      selectedPhoto:
          selectedPhoto != null ? selectedPhoto() : this.selectedPhoto,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'is_loading': isLoading,
      'is_success': isSuccess,
      'error': error?.toMap(),
      'user_photos': userPhotos.map((x) => x.toMap()).toList(),
      'selected_photo': selectedPhoto?.toMap(),
    };
  }

  factory PhotoState.fromMap(Map<String, dynamic> map) {
    return PhotoState(
      isLoading: map['is_loading'] ?? false,
      isSuccess: map['is_success'] ?? false,
      error:
          map['error'] != null ? AppErrorHandler.fromMap(map['error']) : null,
      userPhotos: List<PhotoEntity>.from(
          map['user_photos']?.map((x) => PhotoEntity.fromMap(x)) ?? const []),
      selectedPhoto: map['selected_photo'] != null
          ? PhotoEntity.fromMap(map['selected_photo'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PhotoState.fromJson(String source) =>
      PhotoState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PhotoState(isLoading: $isLoading, isSuccess: $isSuccess, error: $error, userPhotos: $userPhotos, selectedPhoto: $selectedPhoto)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PhotoState &&
        other.isLoading == isLoading &&
        other.isSuccess == isSuccess &&
        other.error == error &&
        listEquals(other.userPhotos, userPhotos) &&
        other.selectedPhoto == selectedPhoto;
  }

  @override
  int get hashCode {
    return isLoading.hashCode ^
        isSuccess.hashCode ^
        error.hashCode ^
        userPhotos.hashCode ^
        selectedPhoto.hashCode;
  }
}
