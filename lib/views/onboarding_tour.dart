
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_buddy/utils/colors.dart';

import '../../providers/onboarding_tour_provider.dart';

class OnboardingTourPage extends StatefulWidget {
  static const routeName = "OnboardingTourPage";
  const OnboardingTourPage({super.key});

  @override
  State<OnboardingTourPage> createState() => _OnboardingTourPageState();
}

class _OnboardingTourPageState extends State<OnboardingTourPage> {
  OnboardingTourProvider onboardingTourProvider = OnboardingTourProvider();
  PageController? _controller;

  final List<String> _imagePathList = [
    "assets/2.svg",
    "assets/3.svg",
  ];

  final List<String> _descriptionList = [
    "Get started with a friendly welcome.",
    "Share Your Travel Plans & See Available Travel Routes.",
  ];

  int _currentPage = 0;

  int pageLength = 2;
  bool isFirstLaunch = true;

  @override
  initState() {
    super.initState();
    _checkIfFirstLaunch();

    _controller = PageController();
  }

  Future<void> _checkIfFirstLaunch() async {
    bool value = await onboardingTourProvider.canLaunch();
    setState(() {
      isFirstLaunch = value;
    });
  }

  Widget _getPage(int index) {
    Size size = MediaQuery.of(context).size;
    return
        
        SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: size.height * 0.15,
          ),
          SizedBox(
            height: size.height * 0.48,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: SizedBox(
                    height: size.height * 0.4,
                    width: size.width * 0.7,
                    child: SvgPicture.asset(
                      _imagePathList[index],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //  SizedBox(
          //   height: size.height * 0.1,
          // ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
            child: Text(
              _descriptionList[index],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.darkBlackColor,
                fontSize: 28,
              ),
            ),
          ),
          //  SizedBox(
          //   height: size.height * 0.1,
          // ),
        ],
      ),
    );
  }

  Widget _bottomNavigationController() {
    return Padding(
      padding: const EdgeInsets.all(20.0) + const EdgeInsets.only(bottom: 14.0),
      child: GestureDetector(
        onTap: () {
          //
          // onboardingTourProvider.isOnboardingOpen = false;
          // Navigator.pop(context);
          if (_currentPage != pageLength - 1) {
            _controller!.nextPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn);
          } else {
            /// go to home screen after onboarding flow
            onboardingTourProvider.tourComplete();

            onboardingTourProvider.isOnboardingOpen = false;
            Navigator.pop(context);
          }
        },
        child: Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColors.primaryColor,
          ),
          child: _currentPage == 1
              ? const Center(
                  child: Text(
                  "Get Started",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    
                      color: Colors.white),
                ))
              : const Center(
                  child: Text(
                  "Next",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    
                      color: Colors.white),
                )),
        ),
       
      ),
    );
    // }
    // return Container();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isFirstLaunch) {
          return false;
        }
        if (_currentPage == 0) {
          onboardingTourProvider.isOnboardingOpen = false;
          return true;
        } else {
          _controller!.previousPage(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeIn);
          return false;
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    itemCount: pageLength,
                    controller: _controller,
                    itemBuilder: (context, index) => _getPage(index),
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                  ),
                ),
                _bottomNavigationController()
              ],
            ),
            _currentPage == 4
                ? const SizedBox.shrink()
                : Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(
                        pageLength,
                        (int index) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: 8,
                            width: (index == _currentPage) ? 30 : 10,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: (index == _currentPage)
                                  ? AppColors.primaryColor
                                  : AppColors.primaryColor.withOpacity(0.5),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
            if (!isFirstLaunch) ...[
              Positioned(
                right: 16.0,
                top: 40.0,
                child: IconButton(
                  // padding: EdgeInsets.only(top: 40.0, left: 16.0),
                  iconSize: 20.0,
                  icon: const Icon(Icons.close),
                  color: const Color(0xFF142952),
                  onPressed: () {
                    onboardingTourProvider.isOnboardingOpen = false;
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
