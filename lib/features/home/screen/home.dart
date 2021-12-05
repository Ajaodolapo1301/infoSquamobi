import 'package:flutter/material.dart';

import 'package:squamobi_test/core/styles/color_utils.dart';
import 'package:squamobi_test/core/styles/font_sizes.dart';
import 'package:squamobi_test/core/utils/sizeConfig/size_config.dart';

import 'package:squamobi_test/core/widget/custom_button.dart';
import 'package:squamobi_test/core/widget/header.dart';
import 'package:squamobi_test/features/home/model/pricing_model.dart';
import 'package:squamobi_test/features/home/model/unlimited.dart';
import 'package:squamobi_test/features/home/screen/widget/circles.dart';
import 'package:squamobi_test/features/home/screen/widget/cubes.dart';
import 'package:squamobi_test/features/home/screen/widget/pricing.dart';

import '../model/text_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);







  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  int _currentPage = 0;
  PageController pageController = PageController(initialPage: 0);
  double current = 0.0;



  int currentIndex = 0;
  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const Header(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(

                  children: <Widget>[
                    Text("Daily Quotes \nPremium", textAlign: TextAlign.center,
                      style: kBold.copyWith(fontSize: thirtyFive, letterSpacing: 1.5),),

                     SizedBox(height: thirty,),

                    Column(
                      children: UnLimitedModel.allText.map((e){
                        return Cubes(text: e.text, cubeColor: e.color);
                      }).toList(),
                    ),


                     SizedBox(height: thirty,),

                    SizedBox(
                      height: 8.1 * SizeConfig.heightMultiplier,
                      child: PageView.builder(
                        itemCount: TextModel.allText.length,
                        onPageChanged: (page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },

                        controller: pageController,
                        itemBuilder: (context, index) {
                          return Container(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              child: Text("\"${TextModel.allText[index].mainText}\"",
                                textAlign: TextAlign.center,
                                style: TextStyle(

                                  height: 1.5,
                                  color:Colors.black54,
                                  fontSize: 2.2 * SizeConfig.textMultiplier,
                                  fontWeight: FontWeight.w500,
                                 ),));
                        },
                      ),
                    ),




                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buildPageIndicator(),
                      ),
                    ),
                     SizedBox(height: thirtyFive,),
                    const SizedBox(height: 10,),


                    SizedBox(
                      height: 20 * SizeConfig.heightMultiplier,

                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: Pricing.allText.asMap().keys.toList().map((index){

                              Pricing pricing = Pricing.allText[index];
                              if(index == 1){
                                return InkWell(
                                  onTap: (){
                                    setState(() {
                                      currentIndex = index;
                                    });
                                  },
                                  child: PricingWidget(
                                    factorChange: pricing.freeTrial ? 0.0: (1.toDouble() - index).abs(),
                                    mainText: pricing.mainText,
                                    subText: pricing.subText,

                                    haveFocus: currentIndex== index,
                                    freeTrial: pricing.freeTrial,

                                  ),
                                );
                              }
                              return InkWell(
                                onTap: (){
                                  setState(() {
                                    currentIndex = index;
                                  });
                                },
                                child: PricingWidget(
                                  freeTrial: pricing.freeTrial,
                                  factorChange:  (1.toDouble() - index).abs(),
                                  mainText: pricing.mainText,
                                  subText: pricing.subText,

                                  haveFocus: currentIndex== index,

                                ),
                              );
                            }).toList(),
                          ),
                        )
                    ),


                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CustomButton(text: "Continue", onPressed: (){}, color: purple),
                    ),
                    const SizedBox(height: 20,),




                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Terms", style: kBold.copyWith(fontSize: 12, color: Colors.black54,),),
                  Text("Privacy", style: kBold.copyWith(fontSize: 12,color: Colors.black54, ),),
                  Text("Restore", style: kBold.copyWith(fontSize: 12, color: Colors.black54,),)
                ],
              ),
            )


          ],
        ),
      ),

    );
  }
  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < TextModel.allText.length; i++) {
      list.add(i == _currentPage ? CircleBar(true) : CircleBar(false));
    }
    return list;
  }

}







