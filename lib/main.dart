import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyObject {
  int _value;

  MyObject(this._value);

  int get value => _value;

  void increase() {
    _value++;
  }

  void decrease() {
    _value--;
  }

  void increment() {
    _value++;
  }

  void decrement() {
    _value--;
  }

  void reset() {
    _value = 0;
  }

  void add(int amount) {
    _value += amount;
  }

  void subtract(int amount) {
    _value -= amount;
  }

  void setValue(int newValue) {
    _value = newValue;
  }

  bool isGreaterThan(int comparisonValue) {
    return _value > comparisonValue;
  }

  void square() {
    _value = _value * _value;
  }

  int power(int exponent) {
    int result = 1;
    for (int i = 0; i < exponent; i++) {
      result *= _value;
    }
    return result;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final MyObject myObject = MyObject(0);
    return MaterialApp(
      home: CounterPage(myObject: myObject),
    );
  }
}

class CounterPage extends StatefulWidget {
  final MyObject myObject;

  const CounterPage({Key? key, required this.myObject}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CounterPageState();
  }
}

class _CounterPageState extends State<CounterPage> {
  final TextEditingController _exponentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Text('Counter Page'),
        actions: [
          IconButton(
            onPressed: () {
              widget.myObject.decrement();
              debugPrint('Counter: ${widget.myObject.value}');
              setState(() {});
            },
            icon: const Icon(Icons.remove),
          ),
          IconButton(
            onPressed: () {
              widget.myObject.increment();
              debugPrint('Counter: ${widget.myObject.value}');
              setState(() {});
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Count',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${widget.myObject.value}',
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _exponentController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Nhập số nguyên n',
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              widget.myObject.decrement();
              debugPrint('Counter: ${widget.myObject.value}');
              setState(() {});
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              widget.myObject.increase();
              debugPrint('Tăng');
              setState(() {});
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              widget.myObject.reset();
              debugPrint('Counter reset to 0');
              setState(() {});
            },
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              widget.myObject.add(5);
              debugPrint('Added 5 to counter: ${widget.myObject.value}');
              setState(() {});
            },
            child: const Text('+5'),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              widget.myObject.subtract(5);
              debugPrint('Subtracted 5 from counter: ${widget.myObject.value}');
              setState(() {});
            },
            child: const Text('-5'),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              widget.myObject.square();
              debugPrint('Squared value: ${widget.myObject.value}');
              setState(() {});
            },
            child: const Text('Square'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              int exponent = int.tryParse(_exponentController.text) ?? 0;
              int result = widget.myObject.power(exponent);
              debugPrint('Value to the power of $exponent: $result');
              setState(() {});
            },
            child: const Text('Power of N'),
          ),
        ],
      ),
    );
  }
}
//Giải thích :
 //Việc sử dụng lớp MyObject giúp tổ chức và quản lý dữ liệu liên quan đến đối tượng một cách rõ ràng hơn.
 //Điều này giúp giảm độ phức tạp của Stateful Widget và làm cho mã nguồn dễ bảo trì hơn.