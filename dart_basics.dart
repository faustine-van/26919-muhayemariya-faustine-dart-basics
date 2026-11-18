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
}
int countVowels(String text){
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
