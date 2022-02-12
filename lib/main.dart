import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Red Hat Display',
      ),
      home: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          color: CustomColors.paleBlue,
          child: OrderSummaryCard(
            child: Column(
              children: [
                OrderSummaryImage(
                    child: SvgPicture.asset(
                  'assets/images/illustration-hero.svg',
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                )),
                Expanded(
                    child: OrderSummaryContent(children: [
                  const OrderSummaryTitle(title: 'Order Summary'),
                  const OrderSummaryDescription(
                      description:
                          'You can now listen to millions of songs, audiobooks, and podcasts on any device anywhere you like!'),
                  OrderSummaryTile(
                      leading: SvgPicture.asset('assets/images/icon-music.svg'),
                      title: Column(
                        children: const [
                          Text(
                            'Annual Plan',
                            style: TextStyle(fontWeight: FontWeight.w900),
                          ),
                          Text('\$59.99/year')
                        ],
                      ),
                      trailing: Text(
                        'Change',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: CustomColors.brightBlue,
                            fontWeight: FontWeight.w700),
                      )),
                  const SizedBox(
                    width: double.infinity,
                    child: OrderSummaryButton(
                      child: Text(
                        'Proceed to Payment',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all(const EdgeInsets.all(16))),
                        onPressed: () => {},
                        child: Text('Cancel Order',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: CustomColors.desaturatedBlue))),
                  )
                ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OrderSummaryButton extends StatelessWidget {
  final Widget child;

  const OrderSummaryButton({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) {
                return CustomColors.brightBlue;
              },
            )),
        onPressed: () {},
        child: child);
  }
}

class OrderSummaryTile extends StatelessWidget {
  final Widget leading, trailing, title;

  const OrderSummaryTile(
      {Key? key,
      required this.leading,
      required this.trailing,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColors.veryPaleBlue,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: DefaultTextStyle.merge(
          style: TextStyle(fontSize: 18, color: CustomColors.darkBlue),
          child: Row(
            children: [
              leading,
              const SizedBox(width: 16),
              title,
              const Spacer(),
              trailing
            ],
          ),
        ),
      ),
    );
  }
}

class OrderSummaryDescription extends StatelessWidget {
  final String description;

  const OrderSummaryDescription({required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: CustomColors.desaturatedBlue,
        fontSize: 18,
      ),
    );
  }
}

class OrderSummaryTitle extends StatelessWidget {
  final String title;

  const OrderSummaryTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 28,
          color: CustomColors.darkBlue),
    );
  }
}

class OrderSummaryCard extends StatelessWidget {
  final Widget child;

  const OrderSummaryCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(16),
      child: child,
    );
  }
}

class OrderSummaryImage extends StatelessWidget {
  final Widget child;

  const OrderSummaryImage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: ClipRRect(
        child: child,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
    );
  }
}

class OrderSummaryContent extends StatelessWidget {
  final List<Widget> children;

  const OrderSummaryContent({Key? key, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: children,
      ),
    );
  }
}

class CustomColors {
  static Color paleBlue =
      const HSLColor.fromAHSL(1.0, 225, 1.0, 0.94).toColor();
  static Color brightBlue =
      const HSLColor.fromAHSL(1.0, 245, 0.75, 0.52).toColor();
  static Color veryPaleBlue =
      const HSLColor.fromAHSL(1.0, 225, 1.0, 0.98).toColor();
  static Color desaturatedBlue =
      const HSLColor.fromAHSL(1.0, 224, 0.23, 0.55).toColor();
  static Color darkBlue =
      const HSLColor.fromAHSL(1.0, 223, 0.47, 0.23).toColor();
}
