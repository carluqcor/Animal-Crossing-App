bool isDataFilled(String name){
  switch(name){
    case '':
      return false;
    case 'N/A':
      return false;
    default:
      return true;
  }
}