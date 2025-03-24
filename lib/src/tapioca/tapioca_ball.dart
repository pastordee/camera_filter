import "dart:typed_data";
import "dart:ui";

/// TapiocaBall is a effect to apply to the video.
abstract class TapiocaBall {
  
   /// Creates a object to apply color filter from [Filters].
  static TapiocaBall filter(Filters filter) {
    return _Filter(filter);
  }

  /// Creates a object to apply color filter from [Color].
  static TapiocaBall filterFromColor(Color color) {
    return _Filter.color(color);
  }

  /// Creates a object to overlay text.
  static TapiocaBall textOverlay(
      String text, int x, int y, int size, Color color,{ int width = 20, int height = 20,  double startTime = 0.0,  double endTime = 1.0}) {
    return _TextOverlay(text, x, y, size, color,width, height, startTime, endTime);
  }

  /// Creates a object to overlay a image.
  static TapiocaBall imageOverlay(Uint8List bitmap, int x, int y, {int width = 20, int height = 20,double startTime = 0.0,  double endTime = 1.0} ) { //{required double startTime, required double endTime}
    return _ImageOverlay(bitmap, x, y,width, height, startTime, endTime);
  }

 //   /// Returns a [Map<String, dynamic>] representation of this object.
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }

  /// Returns a TapiocaBall type name.
  String toTypeName() {
    // TODO: implement toTypeName
    throw UnimplementedError();
  }
}

/// Enum that specifies the color filter type.
enum Filters { pink, white, blue }

class _Filter extends TapiocaBall {
  late String color;
  _Filter(Filters type) {
    switch (type) {
      case Filters.pink:
        this.color = "#ffc0cb";
        break;
      case Filters.white:
        this.color = "#ffffff";
        break;
      case Filters.blue:
        this.color = "#1f8eed";
    }
  }
  _Filter.color(Color colorInstance) {
    this.color = '#${colorInstance.value.toRadixString(16).substring(2)}';
  }

  Map<String, dynamic> toMap() {
    return {'type': color};
  }

  String toTypeName() {
    return 'Filter';
  }
}

class _TextOverlay extends TapiocaBall {
  final String text;
  final int x;
  final int y;
  final int size;
  final Color color;
  final int width; 
  final int height;
  final double startTime; 
  final double endTime;
  
  _TextOverlay(this.text, this.x, this.y, this.size, this.color, this.width, this.height, this.startTime, this.endTime);

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'x': x,
      'y': y,
      'size': size,
      'color': '#${color.value.toRadixString(16).substring(2)}',
      'width': width,
      'height': height,
      'start': startTime,
      'duration': endTime
    };
  }

  String toTypeName() {
    return 'TextOverlay';
  }
}

class _ImageOverlay extends TapiocaBall {
  final Uint8List bitmap;
  final int x;
  final int y;
  final int width; 
  final int height;
  final double startTime; 
  final double endTime;
  _ImageOverlay(this.bitmap, this.x, this.y, this.width, this.height, this.startTime, this.endTime);

  Map<String, dynamic> toMap() {
    return {'bitmap': bitmap, 'x': x, 'y': y,'width': width, 'height': height,'start': startTime, 'duration': endTime};
  }

  String toTypeName() {
    return 'ImageOverlay';
  }
}

