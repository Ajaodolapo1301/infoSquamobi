


class Pricing {
  String mainText;
  String subText;
  bool freeTrial;
  Pricing({required this.subText, required this.mainText,required this.freeTrial});


  static   final List<Pricing> allText =[
    Pricing(
      freeTrial: false,
      mainText: "\$999.99 per month",
      subText: "Auto renewal"
    ),
    Pricing(
      mainText: "\$999.99 per month",
      subText: "Auto renewal",
      freeTrial: true,
    ),

    Pricing(
        freeTrial: false,
        mainText: "\$999.99 per month",
        subText: "Auto renewal"
    )
  ];
}