

/// Connectivity Provider'i dinleyip routing yapmaya gerek yok bence.
///  Eger yapacaksak MaterialApp'in child'ina sarmalayip yapabiliriz.
///  Ama bence gereksiz.
///  Direk network isConnected kontrolu yapip istenilen islemi yapmak yeterli

/// Bunu asagidaki gibi yazabiliriz. Eger offline first yapacaksak connection durumunu kontrol edip
/// Ona gore remote'a ve ya local'a baglanabiliriz.

// abstract class NetworkInfo {
//   Future<bool> get isConnected;
// }
//
// class NetworkInfoImpl implements NetworkInfo {
//   final DataConnectionChecker connectionChecker;
//
//   NetworkInfoImpl(this.connectionChecker);
//
//   @override
//   Future<bool> get isConnected => connectionChecker.hasConnection;
// }

/// How to use:
// /// Burda network controlu yapiliyor. Eger network yok ise localden veri cekiyor.
// Future<Either<Failure, NumberTrivia>> _getTrivia(
//     _ConcreteOrRandomChooser getConcreteOrRandom,
//     ) async {
//   if (await networkInfo.isConnected) {
//     try {
//       final remoteTrivia = await getConcreteOrRandom();
//       localDataSource.cacheNumberTrivia(remoteTrivia);
//       return Right(remoteTrivia);
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   } else {
//     try {
//       final localTrivia = await localDataSource.getLastNumberTrivia();
//       return Right(localTrivia);
//     } on CacheException {
//       return Left(CacheFailure());
//     }
//   }
// }