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

  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  print('--- receipts ---');
  int totalFees = 0;
  int i = 1;
  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    totalFees += fee;
    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone('0788123456')}');
    i++;
  }
  print('Total fees: $totalFees RWF');
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
  String trimmed = fullName.trim();
  if (trimmed.isEmpty) {
    return '';
  }
  String res = '';
  List<String> parts = trimmed.split(' ');
  int i = 0;
  while (i < parts.length) {
    if (parts[i].isNotEmpty) {
      res += parts[i][0].toUpperCase() + '.';
    }
    i++;
  }
  return res;
}

void drawTriangle(int height) {
  // by MF
  if (height <= 0) {
    return;
  }
  int row = 1;
  while (row <= height) {
    String line = '';
    int spaces = height - row;
    int s = 0;
    while (s < spaces) {
      line += ' ';
      s++;
    }
    String ch = (row % 2 == 1) ? '*' : '#';
    int c = 0;
    while (c < row) {
      line += ch;
      c++;
    }
    print(line);
    row++;
  }
}


int momoFee(int amount) {
  // by MF
  if (amount <= 0) {
    return -1;
  } else if (amount <= 1000) {
    return 20;
  } else if (amount <= 10000) {
    return 100;
  } else if (amount <= 150000) {
    return 250;
  } else {
    return 1500;
  }
}

String maskPhone(String phone) {
  // by MF
  if (phone.length != 10) {
    return 'INVALID';
  }
  String masked = phone.substring(0, 3);
  int i = 3;
  while (i < 8) {
    masked += '*';
    i++;
  }
  masked += phone.substring(8);
  return masked;
}