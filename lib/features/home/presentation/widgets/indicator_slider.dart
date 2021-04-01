import 'package:champs_21/constants/colors.dart';
import 'package:champs_21/features/home/presentation/bloc/indicator/indicator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IndicatorSlider extends StatelessWidget {
  final int count;
  const IndicatorSlider({
    Key key,
    @required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only( left : 20, right:  20, top: 25,),
        child: Row(
          children: [
            Container(
              height: 13,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, position) {
                  return BlocBuilder<IndicatorCubit, IndicatorState>(
                    builder: (context, state) {
                      if (state is IndicatorStateChangePosition) {
                        return IndicatorItem(
                            isSelected: state.newPosition == position);
                      } else if (state is IndicatorInitial) {
                        return IndicatorItem(isSelected: position == 0);
                      } else {
                        return Container();
                      }
                    },
                  );
                },
                itemCount: count,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IndicatorItem extends StatelessWidget {
  const IndicatorItem({
    Key key,
    @required this.isSelected,
  }) : super(key: key);

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.1),
      child: isSelected
          ? Container(
              width: 13.5699462890625,
              height: 12.8900146484375,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kHiglightedColor,
                boxShadow: [
                  BoxShadow(
                      color: Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                      spreadRadius: 0)
                ],
              ))
          : Container(
              width: 10.8599853515625,
              height: 10.17999267578125,
              decoration: BoxDecoration(
                color: Color(0xffa6abbb),
                shape: BoxShape.circle,
              )),
    );
  }
}
