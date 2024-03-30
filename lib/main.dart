import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmiCalculator(),
    );
  }
}

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  TextEditingController ageController = TextEditingController();
  TextEditingController feetController = TextEditingController();
  TextEditingController inchController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController controller5 = TextEditingController();

  double? ans;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        elevation: 200,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.replay_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              inputArea(),
              bmiChart(),
              const SizedBox(height: 10,),
              const Text('Normal Weight :  117.9 - 159.4 lb', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),)
            ],
          ),
        ),
      ),
    );
  }//

  Column inputArea() {
    return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InputDetails(ageController: ageController, labelText: 'Age',),
                    const SizedBox(
                      width: 45,
                    ),
                    InputDetails(ageController: feetController, labelText: "'"),
                    const SizedBox(
                      width: 55,
                    ),
                    InputDetails(ageController: inchController, labelText: "' '"),
                    const SizedBox(
                      width: 50,
                    ),
                    const Text('ft'),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(onTap: () {}, child: const Icon(Icons.arrow_drop_down_outlined))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 100,
                          child: InkWell(
                            onTap: () {},
                            child: const Icon(Icons.male),
                          ),
                        ),
                        const Icon(Icons.straight),
                        SizedBox(
                          height: 100,
                          child: InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.female,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextFormField(
                        controller: weightController,
                        decoration: const InputDecoration(
                          labelText: "Weight",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    const Text('lb'),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        bmiCalculation();
                      },
                      child: const Icon(Icons.arrow_drop_down_outlined),
                    )
                  ],
                ),
                bmiMeter(),
              ],
            );
  }

  void bmiCalculation() {
    double? wt =
        double.tryParse(weightController.text) ?? 0;
    double? ft =
        double.tryParse(feetController.text) ?? 0;
    double? inch =
        double.tryParse(inchController.text) ?? 0;

    double? meter = (ft * 12 + inch) * 0.0254;
    ans = wt / (meter * meter);
    weightController.clear();

    setState(() {});
  }

  Column bmiChart() {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Very Severely Underweight',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: (ans?.toDouble() ?? 0) <= 15.9
                            ? Colors.green
                            : Colors.black,
                      ),
                    ),
                    Text(
                      '<- 15.9',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: (ans?.toDouble() ?? 0) <= 15.9
                            ? Colors.green
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Severely Underweight',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ((ans?.toDouble() ?? 0) >= 16.0 &&
                                (ans?.toDouble() ?? 0) <= 16.9)
                            ? Colors.green
                            : Colors.black,
                      ),
                    ),
                    Text(
                      '16.0 - 16.9',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ((ans?.toDouble() ?? 0) >= 16.0 &&
                                (ans?.toDouble() ?? 0) <= 16.9)
                            ? Colors.green
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Underweight',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ((ans?.toDouble() ?? 0) >= 17.0 &&
                                (ans?.toDouble() ?? 0) <= 18.4)
                            ? Colors.green
                            : Colors.black,
                      ),
                    ),
                    Text(
                      '17.0 - 18.4',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ((ans?.toDouble() ?? 0) >= 17.0 &&
                                (ans?.toDouble() ?? 0) <= 18.4)
                            ? Colors.green
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Normal',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ((ans?.toDouble() ?? 0) >= 18.5 &&
                                (ans?.toDouble() ?? 0) <= 24.9)
                            ? Colors.green
                            : Colors.black,
                      ),
                    ),
                    Text(
                      '18.5 - 24.9',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ((ans?.toDouble() ?? 0) >= 18.5 &&
                                (ans?.toDouble() ?? 0) <= 24.9)
                            ? Colors.green
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Overweight',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ((ans?.toDouble() ?? 0) >= 25.0 &&
                                (ans?.toDouble() ?? 0) <= 29.9)
                            ? Colors.green
                            : Colors.black,
                      ),
                    ),
                    Text(
                      '25.0 - 29.9',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ((ans?.toDouble() ?? 0) >= 25.0 &&
                                (ans?.toDouble() ?? 0) <= 29.9)
                            ? Colors.green
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Obese Class |',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ((ans?.toDouble() ?? 0) >= 30.0 &&
                                (ans?.toDouble() ?? 0) <= 34.9)
                            ? Colors.green
                            : Colors.black,
                      ),
                    ),
                    Text(
                      '30.0 - 34.9',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ((ans?.toDouble() ?? 0) >= 30.0 &&
                                (ans?.toDouble() ?? 0) <= 34.9)
                            ? Colors.green
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Obese Class ||',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ((ans?.toDouble() ?? 0) >= 35.0 &&
                                (ans?.toDouble() ?? 0) <= 39.9)
                            ? Colors.green
                            : Colors.black,
                      ),
                    ),
                    Text(
                      '35.0 - 39.9',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ((ans?.toDouble() ?? 0) >= 35.0 &&
                            (ans?.toDouble() ?? 0) <= 39.9)
                            ? Colors.green
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Obese Class |||',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: (ans?.toDouble() ?? 0) >= 45.0
                            ? Colors.green
                            : Colors.black,
                      ),
                    ),
                    Text(
                      '>= 45.0',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: (ans?.toDouble() ?? 0) >= 45.0
                            ? Colors.green
                            : Colors.black,
                      ),
                    )
                  ],
                ),
              ],
            );
  }
  SizedBox bmiMeter() {
    return SizedBox(
                  height: 250,
                  width: 300,
                  child: SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                        minimum: 16.0,
                        maximum: 41,
                        ranges: <GaugeRange>[
                          GaugeRange(
                              startValue: 16.0,
                              endValue: 18.4,
                              color: Colors.green),
                          GaugeRange(
                              startValue: 18.5,
                              endValue: 24.9,
                              color: Colors.orange),
                          GaugeRange(
                              startValue: 25.0,
                              endValue: 41.0,
                              color: Colors.red)
                        ],
                        pointers: <GaugePointer>[
                          NeedlePointer(value: ans?.toDouble() ?? 0)
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                            widget: Text(
                              ans?.toStringAsFixed(1) ?? '0',
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            angle: 90,
                            positionFactor: 0.5,
                          )
                        ],
                      ),
                    ],
                  ),
                );
  }
}

class InputDetails extends StatelessWidget {
  const InputDetails({
    super.key,
    required this.ageController,
    required this.labelText,
  });

  final TextEditingController ageController;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 50,
      child: TextFormField(
        controller: ageController,
        decoration: InputDecoration(
          labelText: labelText,
        ),
      ),
    );
  }
}
