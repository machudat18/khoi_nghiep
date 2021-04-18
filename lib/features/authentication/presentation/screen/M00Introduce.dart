import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khoi_nghiep/common/util/GetColors.dart';
import 'package:khoi_nghiep/features/khoinghiep/presentation/pages/AllRouteManagement.dart';
import 'package:khoi_nghiep/features/khoinghiep/presentation/widgets/PageWidget.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class Introduce extends StatefulWidget {
  @override
  _IntroduceState createState() => _IntroduceState();
}

class _IntroduceState extends State<Introduce> {
  final _currentPageNotifier = ValueNotifier<int>(0);
  final _pageController = PageController(initialPage: 0);
  final List<Widget> pageWidget = [
    PageWidget(
        'assets/im_introduce.png',
        'Tin tức khởi nghiệp kinh doanh',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit,'
            ' sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. '),
    PageWidget(
        'assets/im_introduce.png',
        'Tin tức khởi nghiệp kinh doanh',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit,'
            ' sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. '),
    PageWidget(
        'assets/im_introduce.png',
        'Tin tức khởi nghiệp kinh doanh',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit,'
            ' sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. '),
    PageWidget(
        'assets/im_introduce.png',
        'Tin tức khởi nghiệp kinh doanh',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit,'
            ' sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. ')
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: pageWidget.length,
                controller: _pageController,
                itemBuilder: (BuildContext context, int index) {
                  return pageWidget[index];
                },
                onPageChanged: (int index) {
                  _currentPageNotifier.value = index;
                },
              ),
            ),
            CirclePageIndicator(
              dotColor: Colors.grey,
              dotSpacing: 10,
              selectedSize: 10,
              selectedDotColor: Colors.blue,
              itemCount: pageWidget.length,
              currentPageNotifier: _currentPageNotifier,
              size: 10,
              onPageSelected: (int index) {
                if (_currentPageNotifier.value > index)
                  _pageController.jumpToPage(index);
              },
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 30, bottom: 50, right: 24, left: 24),
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AllRouteManagement()),
                  );
                },
                child: Ink(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: HexColor("#0062DD"),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Center(
                      child: Text(
                    'Bắt đầu sử dụng',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
