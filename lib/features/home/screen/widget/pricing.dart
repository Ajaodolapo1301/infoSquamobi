


import 'package:flutter/material.dart';
import 'package:squamobi_test/core/styles/color_utils.dart';
import 'package:squamobi_test/core/styles/font_sizes.dart';
import 'package:squamobi_test/core/utils/sizeConfig/size_config.dart';

class PricingWidget extends StatefulWidget {
  const PricingWidget({
    Key? key,
    required this.mainText,
    required this.subText,
    required this.haveFocus,
    required this.factorChange,
    required this.freeTrial,
  }) : super(key: key);

  final String mainText;
  final String subText;
  final bool haveFocus;
  final bool freeTrial;
  final double factorChange;

  @override
  State<PricingWidget> createState() => _PricingWidgetState();
}

class _PricingWidgetState extends State<PricingWidget> with TickerProviderStateMixin{

  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {



    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    animation = Tween(begin: -15.0, end: -20.0)
        .animate(CurvedAnimation(
        parent: animationController,
        curve: Curves.bounceIn
    ));

    animationController.forward();
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [

        Container(
        width: 29 * SizeConfig.widthMultiplier,
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.only(bottom:7.0 * widget.factorChange , top:7.0 * widget.factorChange , left: 5, right: 5  ),

          decoration: BoxDecoration(borderRadius: BorderRadius.circular(17.0),
              border: Border.all(color: widget.haveFocus? purple: ash, width: widget.haveFocus ?3: 1 )
          ),
          child: Stack(
            fit: StackFit.passthrough,
            children: [


              AnimatedSwitcher(
                duration: kThemeChangeDuration,
                child: widget.haveFocus
                    ?         const _ShaderCard()
                    : const SizedBox(),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 4 ),
                decoration: const BoxDecoration(

                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                widget.freeTrial ?    Text("3-days FREE TRIAL", textAlign: TextAlign.center, style: kBold.copyWith(fontSize: 9),) : Container(),

                    Column(
                      children: [
                        Text(widget.mainText, textAlign: TextAlign.center, style: kBold.copyWith(fontSize: 11),),
                        const SizedBox(height: 10,),
                        Text(widget.subText, style: kBold500.copyWith(fontSize: 11),),],
                    ),
                    Container()
                  ],
                ),
              ),
              widget.freeTrial   ?  Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 16.0 * SizeConfig.widthMultiplier,
                    height: 2.9 * SizeConfig.heightMultiplier,
                    decoration: const BoxDecoration(
                        color: ash,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomRight: Radius.circular(17)
                        )
                    ),
                    child:  Center(child: Text("Save 23%", style: kBold.copyWith(fontSize: 9, color: Colors.white),)),
                  ),
                ),
              ):  const SizedBox(),
            ],
          ),
        ),

        widget.freeTrial ?          AnimatedBuilder(
          animation: animation,
          builder: (context, child){

            return Positioned(

              right: 0.0,
              left: 0.0,
              top: animation.value,
              child: Container(

                child: child,

              ),
            );
          },
          child:Container(
              margin: const EdgeInsets.symmetric(horizontal: 23, ),
              height: 20,
              child: Center(child: Text("Popular", style: kBold.copyWith(fontSize: 10, color: Colors.white),)),
              decoration:  const BoxDecoration(
                  color: ash,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(13),
                      topRight: Radius.circular(13)
                  )
              )
          ),
        ) : const SizedBox(),
      ],
    );
  }
}

class _ShaderCard extends StatelessWidget {
  const _ShaderCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color:
        const Color(0xffd6d4f2),
        borderRadius: BorderRadius.circular(16)
      ),
    );
  }
}

