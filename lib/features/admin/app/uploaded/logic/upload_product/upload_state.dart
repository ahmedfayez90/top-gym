part of 'upload_cubit.dart';

abstract class UploadState extends Equatable {
  const UploadState();

  @override
  List<Object> get props => [];
}

class UploadInitial extends UploadState {}

class LoadingUploadProduct extends UploadState {}

class SuccessUploadProduct extends UploadState {}

class ErrorUploadProduct extends UploadState {}

class LoadingUploadImage extends UploadState {}

class SuccessUploadImage extends UploadState {}

class ErrorUploadImage extends UploadState {}
