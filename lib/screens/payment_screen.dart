/*import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController _amountController = TextEditingController();
  String _status = "";
  List<String> transactionHistory = [];
  bool isProcessing = false;

  // Simulated user data
  int userIP = Random().nextInt(255);
  List<double> userExpenseHistory = [100, 200, 150, 250, 300];

  @override
  void initState() {
    super.initState();
    _loadTransactionHistory();
  }

  void _processTransaction() async {
    double amount = double.tryParse(_amountController.text) ?? 0.0;

    if (amount <= 0) {
      Fluttertoast.showToast(
        msg: "⚠️ Enter a valid amount!",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return;
    }

    setState(() {
      isProcessing = true;
      _status = "";
    });

    await Future.delayed(const Duration(seconds: 2)); // Simulate processing delay

    bool isFraudulent = _detectFraud(amount);
    setState(() {
      isProcessing = false;
      if (isFraudulent) {
        _status = "⚠️ Transaction flagged as FRAUDULENT!";
        Fluttertoast.showToast(
          msg: _status,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      } else {
        _status = "✅ Payment Successful!";
        _saveTransaction(amount);
        Fluttertoast.showToast(
          msg: _status,
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
      }
    });
  }

  bool _detectFraud(double amount) {
    double fraudThreshold = 5000.0;
    double averageExpense =
        userExpenseHistory.reduce((a, b) => a + b) / userExpenseHistory.length;

    return amount > fraudThreshold || amount > averageExpense * 3 || userIP % 5 == 0;
  }

  Future<void> _saveTransaction(double amount) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      transactionHistory.add("Paid \$${amount.toStringAsFixed(2)}");
    });
    await prefs.setStringList("transactions", transactionHistory);
  }

  Future<void> _loadTransactionHistory() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      transactionHistory = prefs.getStringList("transactions") ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modern Payment Gateway"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Enter Payment Details",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Amount",
                hintText: "Enter amount (e.g., 100)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.attach_money, color: Colors.blueAccent),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: isProcessing ? null : _processTransaction,
              style: ElevatedButton.styleFrom(
                backgroundColor: isProcessing ? Colors.grey : Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: isProcessing
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  Text("Processing...", style: TextStyle(fontSize: 16, color: Colors.white)),
                ],
              )
                  : const Text(
                "Pay Now",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              _status,
              style: TextStyle(
                fontSize: 18,
                color: _status.contains("FRAUDULENT") ? Colors.red : Colors.green,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: transactionHistory.isNotEmpty
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Transaction History",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: transactionHistory.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            leading: Icon(Icons.payment, color: Colors.blueAccent),
                            title: Text(transactionHistory[index]),
                            trailing: Icon(Icons.check_circle, color: Colors.green),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
                  : const Center(
                child: Text(
                  "No Transactions Yet",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Payment Gateway',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 2,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[900],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.white),
          ),
          labelStyle: const TextStyle(color: Colors.white),
          hintStyle: const TextStyle(color: Colors.white70),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      home: const PaymentScreen(),
    );
  }
}

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  String _status = "";
  List<String> transactionHistory = []; // Only transactions from this session
  bool isProcessing = false;
  String selectedPaymentMethod = "Card";

  // The initial balance is set to 10,000 dollars.
  double _balance = 10000.0;

  // OTP verification state: Once verified, the OTP session is valid for 2 minutes.
  bool otpVerified = false;
  DateTime? otpVerifiedTime;

  // Simulated user data for fraud/suspicion checks
  List<double> userExpenseHistory = [120, 180, 160, 210, 270];
  List<DateTime> transactionTimestamps = [];
  double fraudThreshold = 5000.0;
  String userCountry = "US";
  String transactionCountry = "US"; // Change for testing IP/country mismatch

  @override
  void dispose() {
    _amountController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  /// Checks for suspicious conditions based on amount, frequency, and user history.
  List<String> _checkSuspicious(double amount) {
    List<String> risks = [];
    double averageExpense =
        userExpenseHistory.reduce((a, b) => a + b) / userExpenseHistory.length;
    DateTime now = DateTime.now();
    int recentCount =
        transactionTimestamps.where((t) => now.difference(t).inSeconds <= 60).length;

    if (recentCount >= 3) risks.add("Frequent Transactions Detected");
    if (amount > fraudThreshold) risks.add("Amount Exceeds Threshold");
    if (amount > 10 * averageExpense)
      risks.add("Unusually High Amount Compared to History");
    if (userCountry != transactionCountry) risks.add("IP Location Mismatch");

    return risks;
  }

  /// Processes a transaction. Before proceeding, the code checks if the entered
  /// amount is within the available balance.
  Future<void> _processTransaction() async {
    double amount = double.tryParse(_amountController.text) ?? 0.0;
    if (amount <= 0) {
      Fluttertoast.showToast(
        msg: "⚠️ Enter a valid amount!",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return;
    }

    // Check if the user has sufficient balance.
    if (amount > _balance) {
      Fluttertoast.showToast(
        msg: "Insufficient balance. Your available balance is \$${_balance.toStringAsFixed(2)}",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return;
    }

    List<String> risks = _checkSuspicious(amount);
    if (risks.isEmpty) {
      // No suspicious factors—process transaction normally.
      await _finalizeTransaction(amount);
    } else {
      // Suspicious transaction: if OTP is active, proceed; otherwise, ask for OTP.
      if (otpVerified &&
          otpVerifiedTime != null &&
          DateTime.now().difference(otpVerifiedTime!) <= Duration(minutes: 2)) {
        await _finalizeTransaction(amount);
      } else {
        _showOtpDialog(risks, amount);
      }
    }
  }

  /// Finalizes the transaction: deducts the amount from the balance, records a
  /// timestamp, updates the transaction history, and displays a success message.
  Future<void> _finalizeTransaction(double amount) async {
    setState(() {
      isProcessing = true;
      _status = "";
    });

    await Future.delayed(const Duration(seconds: 1)); // Simulate processing delay

    // Deduct the amount from the balance.
    setState(() {
      _balance -= amount;
    });

    // Record the timestamp (used for detecting frequent transactions)
    transactionTimestamps.add(DateTime.now());

    setState(() {
      _status = "✅ Payment Successful via $selectedPaymentMethod!";
    });
    Fluttertoast.showToast(
      msg: _status,
      backgroundColor: Colors.white,
      textColor: Colors.black,
    );

    // Add transaction to the current session's history (latest on top).
    setState(() {
      transactionHistory.insert(
          0, "Paid \$${amount.toStringAsFixed(2)} via $selectedPaymentMethod");
    });

    setState(() {
      isProcessing = false;
    });
  }

  /// Displays an OTP dialog when a suspicious transaction is attempted.
  /// The demo OTP is "1234".
  void _showOtpDialog(List<String> risks, double amount) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: const Text(
            "OTP Verification Required",
            style: TextStyle(color: Colors.white),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Suspicious transaction detected due to: ${risks.join(', ')}.\n\n"
                    "Please enter the OTP sent to your registered email/number.",
                style: const TextStyle(fontSize: 14, color: Colors.white70),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Enter OTP",
                  hintText: "e.g., 765",
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                _otpController.clear();
                Navigator.of(context).pop();
              },
              child: const Text("Cancel", style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              onPressed: () {
                if (_otpController.text.trim() == "1234") {
                  setState(() {
                    otpVerified = true;
                    otpVerifiedTime = DateTime.now();
                  });
                  Fluttertoast.showToast(
                    msg:
                    "OTP Verified. You can transact for the next 2 minutes without further OTP.",
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                  );
                  _otpController.clear();
                  Navigator.of(context).pop();
                  _finalizeTransaction(amount);
                } else {
                  Fluttertoast.showToast(
                    msg: "Invalid OTP. Please try again.",
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                  );
                }
              },
              child: const Text("Verify OTP"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Check if an OTP session is active (valid for 2 minutes).
    bool otpActive = otpVerified &&
        otpVerifiedTime != null &&
        DateTime.now().difference(otpVerifiedTime!) <= Duration(minutes: 2);

    return Scaffold(
      appBar: AppBar(
        title: const Text(" Payment Gateway"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Balance Box at the top
            Card(
              color: Colors.grey[850],
              margin: const EdgeInsets.only(bottom: 20),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Total Balance: \$${_balance.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            // Payment Details Form
            const Text(
              "Enter Payment Details",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Amount",
                hintText: "Enter amount (e.g., 100)",
                prefixIcon: Icon(Icons.attach_money, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedPaymentMethod,
              decoration: const InputDecoration(),
              items: ["Card", "PayPal", "Bkash"]
                  .map((method) => DropdownMenuItem(
                value: method,
                child: Text(method),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            if (otpActive)
              const Text(
                "OTP Verified: You can transact for the next 2 minutes.",
                style: TextStyle(
                    color: Colors.green, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: isProcessing ? null : _processTransaction,
              child: const Text("Pay Now"),
            ),
            const SizedBox(height: 16),
            Text(
              _status,
              style:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Divider(color: Colors.white70, height: 30),
            // Transaction History (only current session transactions)
            const Text(
              "Transactions Completed",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            transactionHistory.isEmpty
                ? const Center(
              child: Text("No transactions done yet.",
                  style: TextStyle(color: Colors.white70)),
            )
                : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: transactionHistory.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.grey[850],
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    leading:
                    const Icon(Icons.receipt_long, color: Colors.white),
                    title: Text(
                      transactionHistory[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

