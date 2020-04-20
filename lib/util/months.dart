final Map<String, int> monthNumber = {
  'January': 1,
  'February': 2,
  'March': 3,
  'April': 4,
  'May': 5,
  'June': 6,
  'July': 7,
  'August': 8,
  'September': 9,
  'October': 10,
  'November': 11,
  'December': 12,
};

bool getAvailableCritter(DateTime dateNow, String timeYear) {
  List<String> months = timeYear.split(' ');

  try {
    if (dateNow.month < monthNumber[months[0]] ||
        dateNow.month > monthNumber[months[2]])
      return false;
    else
      return true;
  }catch(e){
    return false;
  }
}
