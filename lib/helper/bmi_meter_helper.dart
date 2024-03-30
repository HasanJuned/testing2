import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

SizedBox bmiMeter(double? ans) {
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