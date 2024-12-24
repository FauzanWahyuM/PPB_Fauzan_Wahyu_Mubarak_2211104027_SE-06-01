import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiController extends GetxController {
  var posts = <dynamic>[].obs; // Observable list untuk posts
  var isLoading = false.obs; // Observable untuk status loading

  final String baseUrl = "https://jsonplaceholder.typicode.com";

  // Fungsi untuk GET data
  Future<void> fetchPosts() async {
    try {
      isLoading.value = true; // Set isLoading menjadi true saat proses dimulai
      final response = await http.get(Uri.parse('$baseUrl/posts'));
      if (response.statusCode == 200) {
        posts.value = json.decode(response.body); // Update posts
        // Tampilkan Snackbar sukses
        Get.snackbar('Success', 'Get loaded successfully!',
            snackPosition: SnackPosition.BOTTOM);
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load posts: $e',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false; // Set isLoading menjadi false setelah selesai
    }
  }

  // Fungsi untuk POST data
  Future<void> createPost() async {
    try {
      isLoading.value = true; // Set isLoading menjadi true saat POST dimulai
      final response = await http.post(
        Uri.parse('$baseUrl/posts'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'title': 'Flutter Post',
          'body': 'Ini contoh POST.',
          'userId': 1,
        }),
      );

      if (response.statusCode == 201) {
        posts.add({
          'title': 'Flutter Post',
          'body': 'Ini contoh POST.',
          'id': posts.length + 1,
        });

        Get.snackbar('Success', 'Post created successfully!',
            snackPosition: SnackPosition.BOTTOM);
      } else {
        throw Exception('Failed to create post');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to create post: $e',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false; // Set isLoading menjadi false setelah selesai
    }
  }

  // Fungsi untuk UPDATE data
  Future<void> updatePost() async {
    try {
      isLoading.value = true; // Set isLoading menjadi true saat UPDATE dimulai
      final response = await http.put(
        Uri.parse('$baseUrl/posts/1'),
        body: json.encode({
          'title': 'Updated Title',
          'body': 'Updated Body',
          'userId': 1,
        }),
      );

      if (response.statusCode == 200) {
        final updatedPost = posts.firstWhere((post) => post['id'] == 1);
        updatedPost['title'] = 'Updated Title';
        updatedPost['body'] = 'Updated Body';

        Get.snackbar('Success', 'Update updated successfully!',
            snackPosition: SnackPosition.BOTTOM);
      } else {
        throw Exception('Failed to update post');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update post: $e',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false; // Set isLoading menjadi false setelah selesai
    }
  }

  // Fungsi untuk DELETE data
  Future<void> deletePost() async {
    try {
      isLoading.value = true; // Set isLoading menjadi true saat DELETE dimulai
      final response = await http.delete(
        Uri.parse('$baseUrl/posts/1'),
      );

      if (response.statusCode == 200) {
        posts.removeWhere((post) => post['id'] == 1);

        Get.snackbar('Success', 'Post deleted successfully!',
            snackPosition: SnackPosition.BOTTOM);
      } else {
        throw Exception('Failed to delete post');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete post: $e',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false; // Set isLoading menjadi false setelah selesai
    }
  }
}
