import 'package:flutter/material.dart';
import 'package:food_delivary_app/utils/dimansiontions.dart';
import 'package:food_delivary_app/widgets/small_text.dart';


void main(){
  runApp(MaterialApp(title: "Expandable Widget",));
}

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText=true;

  double textHight=Dimensions.screenHight/5.63;

  @override
  void initState() {
    super.initState();
    if(widget.text.length>textHight){
      firstHalf=widget.text.substring(0,textHight.toInt());
      secondHalf=widget.text.substring(textHight.toInt()+1,widget.text.length);
    }else{
      firstHalf=widget.text;
      secondHalf="";
    }

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(color: Colors.black54,size: Dimensions.font16,text: firstHalf):Column(
        children: [
          SmallText(height: 1.8,color:Colors.black54,size: Dimensions.font16,text: hiddenText?(firstHalf+"..."):(firstHalf+secondHalf)),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText=!hiddenText;
              });

            },
            child: Row(
                children: [
                  SmallText(text: "Show More", color: Colors.blue),
                  Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up,color: Colors.blue),],
              ),
          ),

        ],
      ),
    );
  }
}
