/// If you are using firebase, you can use this converter to convert the timestamp to DateTime

// class CustomDateTimeConverter implements JsonConverter<DateTime?, String?> {
//   const CustomDateTimeConverter();

//   @override
//   DateTime? fromJson(Timestamp? timestamp) {
//     return timestamp?.toDate();
//   }

//   @override
//   Timestamp? toJson(DateTime? date) =>
//       date != null ? Timestamp.fromDate(date) : null;
// }