import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _curStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StepperDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
                  data: Theme.of(context).copyWith(
                    primaryColor: Colors.black
                  ),
                  child: Stepper(
                    currentStep: _curStep,
                    onStepContinue: () {
                      setState(() {
                        if (_curStep < 2) {
                          _curStep++;
                        }
                      });
                    },
                    onStepCancel: () {
                      setState(() {
                        if (_curStep > 0) {
                          _curStep--;
                        }
                      });
                    },
                    steps: [
                      Step(
                        title: Text('Login'),
                        subtitle: Text('Login first'),
                        content: Text('Ea deserunt elit incididunt Lorem in magna cupidatat Lorem dolore.'),
                        isActive: true
                      ),
                      Step(
                        title: Text('Login'),
                        subtitle: Text('Login first'),
                        content: Text('Ea deserunt elit incididunt Lorem in magna cupidatat Lorem dolore.'),
                        isActive: true
                      ),
                      Step(
                        title: Text('Login'),
                        subtitle: Text('Login first'),
                        content: Text('Ea deserunt elit incididunt Lorem in magna cupidatat Lorem dolore.'),
                        isActive: true
                      ),
                    ],
                  ),
                )
          ],
        ),
      ),
    );
  }
}