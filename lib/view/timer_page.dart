import 'package:flutter/material.dart';

class TimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/forest.jpg'),
            fit: BoxFit.cover,
            opacity: .2),
        color: Colors.black,
      ),
      child: Column(
        children: [
          const Spacer(flex: 4),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: 'CURRENT TASK\n',
              style: TextStyle(
                height: 1.7,
                letterSpacing: 2,
                color: Colors.white38,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(
                  text: 'Pomodoro mobile app design',
                  style: TextStyle(
                    letterSpacing: 0,
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(flex: 2),
          Expanded(
            flex: 9, child: TimerPickerSlider(),
            // CountdownIndicator()
          ),
          const Spacer(),
          SizedBox(
            height: 55,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        Icon(theme[index].icon, size: 22),
                        const SizedBox(height: 6),
                        Text(
                          theme[index].label!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: theme.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const Spacer(),
          AnimatedCrossFade(
            crossFadeState: CrossFadeState.showFirst,
            duration: const Duration(seconds: 2),
            firstChild: ElevatedButton(
              onPressed: () {},
              child: const Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
                size: 35,
              ),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                primary: const Color(0xFF313146),
                padding: const EdgeInsets.all(15),
              ),
            ),
            secondChild: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.restart_alt_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: const CircleBorder(),
                    side: const BorderSide(color: Colors.white30),
                    padding: const EdgeInsets.all(10),
                  ),
                ),
                const SizedBox(width: 18),
                ElevatedButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.pause_rounded,
                    color: Colors.white,
                    size: 35,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    primary: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.all(15),
                  ),
                ),
                const SizedBox(width: 18),
                OutlinedButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.stop_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: const CircleBorder(),
                    side: const BorderSide(color: Colors.white30),
                    padding: const EdgeInsets.all(10),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  List<String> bg = [
    'forest.jpg',
    'beach.jpg',
    'campfire.jpg',
    'night.jpg',
    'rain.jpg'
  ];

  List<MoodData> theme = [
    MoodData(
      icon: Icons.notifications,
      label: 'Default',
    ),
    MoodData(
      icon: Icons.cloudy_snowing,
      label: 'Summer rain',
    ),
    MoodData(
      icon: Icons.nights_stay_rounded,
      label: 'Summer night',
    ),
    MoodData(
      icon: Icons.forest,
      label: 'Forest',
    ),
    MoodData(
      icon: Icons.beach_access_rounded,
      label: 'Beach',
    ),
    MoodData(
      icon: Icons.cloudy_snowing,
      label: 'Summer rain',
    ),
    MoodData(
      icon: Icons.local_fire_department,
      label: 'Campfire',
    ),
  ];
}

class CountdownIndicator extends StatelessWidget {
  final double val = .6;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator.adaptive(
            strokeWidth: 7,
            backgroundColor: const Color(0xFF515257),
            valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
            value: val,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                '35:20',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Total 2 hours',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.white60,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class TimerPickerSlider extends StatefulWidget {
  @override
  State<TimerPickerSlider> createState() => _TimerPickerSliderState();
}

class _TimerPickerSliderState extends State<TimerPickerSlider> {
  var hours = 0;
  var minSec = 0;
  // final _controller = ScrollController();

  // final List<int> pages = List.generate(4, (index) => index);

  // ScrollPhysics? _physics;

  // @override
  // void initState() {
  //   super.initState();

  //   _controller.addListener(() {
  //     if (_controller.position.haveDimensions && _physics == null) {
  //       setState(() {
  //         var dimension =
  //             _controller.position.maxScrollExtent / (pages.length - 1);
  //         _physics = CustomScrollPhysics(itemDimension: dimension);
  //       });
  //     }
  //   });
  // }
  @override
  void didChangeDependencies() {
    setState(() {
      hours;
      minSec;
    });

    super.didChangeDependencies();
  }

  void _infiniteScroll() {
    if (hours >= 24) {
      hours = 0;
    }

    if (minSec >= 60) {
      minSec = 0;
    }
    minSec++;
    hours++;
  }

  String get checkNumber {
    if (hours < 10) {
      return '0';
    }
    if (minSec < 10) {
      return '0';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    const List<int> format = [24, 60, 60];
    // var scroll = ScrollPhysics();
    // scroll.

    return Row(
      children: [
        const Spacer(),
        ...List.generate(
          3,
          (listIdx) => Flexible(
            flex: 3,
            child: ListView.builder(
              // controller: _controller,

              physics: const PageScrollPhysics(),
              itemCount: 1000,
              padding: EdgeInsets.zero,
              itemBuilder: (ctx, idx) {
                var selectedIdx = [0, 1, 2, 3, 4];
                // AnimatedDefaultTextStyle(child: child, style: style, duration: duration)

                _infiniteScroll();

                return GestureDetector(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "$checkNumber${listIdx == 0 ? hours.toString() : minSec.toString()}",
                        style: hours == selectedIdx.first ||
                                hours == selectedIdx.last
                            ? const TextStyle(
                                fontSize: 30,
                                color: Colors.white24,
                              )
                            : hours == selectedIdx[2]
                                ? const TextStyle(
                                    fontSize: 42,
                                  )
                                : const TextStyle(
                                    fontSize: 36,
                                    color: Colors.white54,
                                  ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

// class CustomScrollPhysics extends ScrollPhysics {
//   final double? itemDimension;

//   CustomScrollPhysics({this.itemDimension, ScrollPhysics? parent})
//       : super(parent: parent);

//   // @override
//   // CustomScrollPhysics applyTo(ScrollPhysics ancestor) {
//   //   return CustomScrollPhysics(
//   //       itemDimension: itemDimension, parent: buildParent(ancestor)!);
//   // }

//   double _getPage(ScrollMetrics position) {
//     return position.pixels / itemDimension!;
//   }

//   double _getPixels(double page) {
//     return page * itemDimension!;
//   }

//   double _getTargetPixels(
//       ScrollMetrics position, Tolerance tolerance, double velocity) {
//     double page = _getPage(position);
//     if (velocity < -tolerance.velocity) {
//       page -= 0.5;
//     } else if (velocity > tolerance.velocity) {
//       page += 0.5;
//     }
//     return _getPixels(page.roundToDouble());
//   }

//   @override
//   Simulation? createBallisticSimulation(
//       ScrollMetrics position, double velocity) {
//     // If we're out of range and not headed back in range, defer to the parent
//     // ballistics, which should put us back in range at a page boundary.
//     if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
//         (velocity >= 0.0 && position.pixels >= position.maxScrollExtent))
//       return super.createBallisticSimulation(position, velocity);
//     final Tolerance tolerance = this.tolerance;
//     final double target = _getTargetPixels(position, tolerance, velocity);
//     if (target != position.pixels)
//       return ScrollSpringSimulation(spring, position.pixels, target, velocity,
//           tolerance: tolerance);
//     return null;
//   }

//   @override
//   bool get allowImplicitScrolling => false;
// }

class MoodData {
  final IconData? icon;
  final String? label;
  MoodData({this.icon, this.label});
}
