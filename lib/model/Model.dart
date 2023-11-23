
import 'package:bestin_interview/model/Support.dart';
import 'package:bestin_interview/model/User.dart';

class UserList {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<User> data;
  final Support support;

  UserList({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });

  factory UserList.fromJson(Map<String, dynamic> json) {
    return UserList(
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
      totalPages: json['total_pages'],
      data: (json['data'] as List).map((userData) => User.fromJson(userData)).toList(),
      support: Support.fromJson(json['support']),
    );
  }
}


