import 'package:equatable/equatable.dart';

class Image extends Equatable {
  const Image({
    required this.file,
    required this.blurHash,
    this.id
  });
  final String file;
  final String blurHash;
  final int? id;

  @override
  List<Object?> get props => [file];
}
