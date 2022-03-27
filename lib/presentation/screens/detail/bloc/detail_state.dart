part of 'detail_bloc.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object?> get props => [];
}

enum DetailLoad { none, share }

class DetailLoadInProgress extends DetailState {}

class DetailLoadSuccess extends DetailState {
  const DetailLoadSuccess(
    this.product, {
    this.selectedColor,
    this.selectedSize,
    this.flashMessage,
    this.detailLoad = DetailLoad.none,
  });
  final Product product;
  final Image? selectedColor;
  final Size? selectedSize;
  final String? flashMessage;
  final DetailLoad detailLoad;

  @override
  List<Object?> get props =>
      [product, selectedColor, selectedSize, flashMessage, detailLoad];
}

class DetailLoadError extends DetailState {
  const DetailLoadError(this.message, this.key);
  final String message;
  final Key key;

  @override
  List<Object> get props => [message, key];
}
