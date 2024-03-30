import 'package:flutter/material.dart';
import 'helper/bmi_chart_helper.dart';
import 'helper/bmi_meter_helper.dart';
import 'widgets/input_details_widget.dart';

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
  double? lb;
  bool changeMaleGenderColor = false;
  bool changeFemaleGenderColor = false;

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
              bmiChart(ans),
              const SizedBox(height: 10,),
              const Text('Normal Weight :  117.9 - 159.4 lb', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, letterSpacing: 0.2, color: Colors.redAccent),)
            ],
          ),
        ),
      ),
    );
  }

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
              width: 40,
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
                    onTap: () {
                      changeMaleGenderColor = true;
                      changeFemaleGenderColor = false;
                      setState(() {});
                    },
                    child: Icon(Icons.male, color: changeMaleGenderColor == true ? Colors.green : null, size: 28,),
                  ),
                ),
                const Text(' | ', style: TextStyle(fontSize: 30),),
                SizedBox(
                  height: 100,
                  child: InkWell(
                    onTap: () {
                      changeFemaleGenderColor = true;
                      changeMaleGenderColor = false;
                      setState(() {});
                    },
                    child: Icon(
                      Icons.female,
                      color: changeFemaleGenderColor == true ? Colors.green : null,
                        size: 28
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 15,
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
              width: 90,
            ),
            const Text('wt'),
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
        bmiMeter(ans),
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
    double? meter2 = (ft * 12 + inch) * 703;
    ans = wt / (meter * meter);
    //lb = wt / (meter2 * meter2);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    ageController.clear();
    feetController.clear();
    inchController.clear();
    weightController.clear();
  }




}