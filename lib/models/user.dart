class User {
  final String email;
  final String uid;
  final String fullname;
  final String bio;
  final String photoUrl;
  final List<dynamic> shared;
  final List<dynamic> received;

  const User({
    required this.email,
    required this.uid,
    required this.fullname,
    this.bio = '',
    this.photoUrl = '',
    required this.shared,
    required this.received,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'uid': uid,
      'fullname': fullname,
      'bio': bio,
      'photoUrl': photoUrl,
      'shared': shared,
      'received': received,
    };
  }
  
}
