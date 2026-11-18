// Student: MUHAYEMARIYA Faustine
// Reg no: 26919/2024
const String regNo = '26919';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));
void main() {
  // by MF
  print('Reg no: $regNo | D = $d | T = $t');

  print(isValidPin('12345')); 
  print(isValidPin('77777')); 
  print(isValidPin('4821')); 
  print(isValidPin('48a21')); 
  print(isValidPin('48219'));


  int balance = 20000 + t * 500;
  print('Start balance: ${formatRwf(balance)}');

  int sendAmount = (d + 1) * 3000;
  balance = sendMoney(balance, sendAmount);
  balance = sendMoney(balance, sendAmount);
  balance = sendMoney(balance, sendAmount);

  balance = buyAirtime(balance, 1000);

  balance = sendMoney(balance, 0);

  balance = sendMoney(balance, 200000);

  print('Final balance: ${formatRwf(balance)}');

  print(formatRwf(500));       
  print(formatRwf(1234567));  
  print(formatRwf(-250));    
  print(isValidPin('00000'));  
  print(isValidPin('54321')); 
  print(isValidPin('12 45'));
}

String formatRwf(int amount) {
  // by MF
  bool negative = amount < 0;
  String digits = amount.abs().toString();
  String result = '';
  int count = 0;
  int i = digits.length - 1;
  while (i >= 0) {
    if (count == 3) {
      result = ',' + result;
      count = 0;
    }
    result = digits[i] + result;
    count++;
    i--;
  }
  if (negative) {
    result = '-' + result;
  }
  return result + ' RWF';
}

bool isValidPin(String pin) {
  // by MF
  if (pin.length != 5) {
    return false;
  }
  int i = 0;
  while (i < pin.length) {
    if (!'0123456789'.contains(pin[i])) {
      return false;
    }
    i++;
  }
  if (pin == '12345') {
    return false;
  }
  bool allSame = true;
  int j = 1;
  while (j < pin.length) {
    if (pin[j] != pin[0]) {
      allSame = false;
    }
    j++;
  }
  if (allSame) {
    return false;
  }
  return true;
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

int sendMoney(int balance, int amount) {
  // by MF
  int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount - fee;
  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

int buyAirtime(int balance, int amount) {
  // by MF
  if (amount < 100 || amount > 50000) {
    print('Failed: airtime amount must be between 100 and 50,000 RWF');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount;
  print('Bought airtime ${formatRwf(amount)}. New balance: ${formatRwf(newBalance)}');
  return newBalance;
}
