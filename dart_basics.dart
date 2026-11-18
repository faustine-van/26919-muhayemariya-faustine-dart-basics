// Student: MUHAYEMARIYA Faustine
// Reg no: 26919/2024
const String regNo = '26919';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  String fullname = 'MUHAYEMARIYA Faustine';
  int res = countVowels(fullname);
  print('$fullname has ${res} vowels');

  print(initials('MUHAYEMARIYA Faustine'));
  print(initials(' ana uwase '));
  print(initials(' '));
}
int countVowels(String text){
  // by MF
  int count = 0;
  String vowels = 'aeiou';
  text = text.toLowerCase();

  int i = 0;
  while (i < text.length) {
    if (vowels.contains(text[i])) {
      count++;
    }
    i++;
  }
  return count;
}

String initials(String fullName) {
  // by MF
  if (fullName.trim().isEmpty) {
    return '';
  }
  String res = '';
  List<String> parts = fullName.split(' ');
  int i = 0;
  while (i < parts.length) {
      res += parts[i][0].toUpperCase() + '.';
    }
    i++;
  }
  return res;
}
