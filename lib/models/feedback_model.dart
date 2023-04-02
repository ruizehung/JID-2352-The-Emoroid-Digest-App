class FeedbackModel {
  static final String date = 'Date';
  static final String name = 'Name';
  static final String email = "Email";
  static final String medical = 'Medical Institution';
  static final String feedbackOrBugs = 'Feedback or Bugs Report';
  static final String detail = 'Detail';

  static List<String> getFields() => [date, name, email, medical, feedbackOrBugs, detail];
}
