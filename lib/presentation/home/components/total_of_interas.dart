import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:intera/shared/extensions/formatter_extension.dart';
import '../../../shared/extensions/screen_util_extension.dart';

class TotalOfInteras extends StatefulWidget {
  final double total;

  TotalOfInteras({Key? key, this.total = 0}) : super(key: key);

  @override
  _TotalOfInterasState createState() => _TotalOfInterasState();
}

class _TotalOfInterasState extends State<TotalOfInteras> {
  String get totalFormated => Formatter.currency(widget.total);

  bool isVisible = true;
  bool _isVisibleDefinitive = true;

  @override
  Widget build(BuildContext context) {
    return _isVisibleDefinitive == true
        ? AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            curve: Curves.fastLinearToSlowEaseIn,
            opacity: isVisible ? 1.0 : 0.0,
            child: FadeInLeft(
              from: 20,
              duration: Duration(milliseconds: 500),
              child: Container(
                key: widget.key,
                height: 100.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(8.radius),
                ),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 24.height,
                        ),
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                          Future.delayed(
                            Duration(milliseconds: 550),
                            () {
                              setState(() {
                                _isVisibleDefinitive = isVisible;
                              });
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.height),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'TOTAL DAS INTERAS',
                            style: TextStyle(
                              color: Colors.white.withOpacity(.8),
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              totalFormated,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : SizedBox();
  }
}
