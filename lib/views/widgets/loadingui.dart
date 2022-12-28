part of 'widgets.dart';

class LoadingUi {
  static Container loading() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      color: Colors.transparent,
      child: const SpinKitFadingCircle(
        size: 50,
        color: Color(0xFF004422)
      )
    );
  }
  static Container loadingBlock() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      color: Colors.black26,
      child: const SpinKitFadingCircle(
        size: 50,
        color: Color(0xFF004422)
      )
    );
  }
  static Container loadingDD() {
    return Container(
      alignment: Alignment.center,
      width: 30,
      height: 30,
      color: Colors.transparent,
      child: const SpinKitFadingCircle(
        size: 30,
        color: Color(0xFF004422)
      )
    );
  }
}
