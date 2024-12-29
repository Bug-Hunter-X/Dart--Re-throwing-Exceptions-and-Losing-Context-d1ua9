```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // Process jsonData
    } else {
      throw HttpException('HTTP request failed: ${response.statusCode}', Uri.parse('https://api.example.com/data'));
    }
  } on HttpException catch (e) {
    print('HTTP Error: ${e.message} at ${e.uri}');
  } on FormatException catch (e) {
    print('JSON format error: $e');
  } catch (e) {
    print('Unexpected error: $e');
  }
}
```