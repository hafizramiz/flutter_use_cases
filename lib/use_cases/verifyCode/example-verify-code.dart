// @override
// Future<bool> verifyCode(String verificationID, String code) async {
//   THResponse<Map<String, dynamic>> response = await requester.executeRequest(
//       THRequestMethods.post,
//       '/api/auth/codeVerification',
//       data: <String, String>{
//         'verification_id' : verificationID,
//         'code' : code
//       }
//   );
//
//   if (!response.success) {
//     throw ServerException(
//         code: response.code,
//         message: response.message
//     );
//   }
//
//   //Save user's session
//   requester.setToken(
//       response.data?['access_token'] ?? '',
//       response.data?['refresh_token'] ?? ''
//   );
//   return true;
// }
// }