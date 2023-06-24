import 'package:bankaccount/global.dart';
import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';

class Click extends StatefulWidget {
  const Click({Key? key}) : super(key: key);

  @override
  State<Click> createState() => _ClickState();
}

class _ClickState extends State<Click> {

  int? number;
  int? amount;

  TextEditingController numberController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String dropdownvalue = 'Select type';

  var items = [
    'CASH',
    'BANK',
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            setState(() {
              Navigator.pop(context);
            });
          },
            child: const Icon(Icons.arrow_back_ios_new)),
        title: Text("ADD BANK ACCOUNTS",
            style: TextStyle(
                letterSpacing: SizeConfig.screenWidth/90, fontSize: SizeConfig.screenHeight/50, fontWeight: FontWeight.w400)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(SizeConfig.screenWidth/50),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(SizeConfig.screenWidth/25),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                        child: CustomSearchableDropDown(
                          items: items,
                          label: dropdownvalue,
                          labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 18),
                          decoration:  BoxDecoration(
                              color:   Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.transparent,
                              )
                          ),
                          dropDownMenuItems: items.map((e) {
                            return e;
                          }).toList(),
                          dropdownBackgroundColor:  Colors.white,
                          suffixIcon:  Icon(Icons.arrow_drop_down,color: Colors.blue,),
                          onChanged: (value){
                            setState(() {
                              dropdownvalue = value;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                        child: TextFormField(
                          controller: numberController,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter num...";
                            }
                          },
                          onSaved: (val) {
                            setState(() {
                              number = int.parse(val!);
                            });
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.maps_home_work,
                                color: Colors.green,
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                              hintText: "Bank Name",
                              hintStyle: TextStyle(fontSize: 18,color: Colors.grey[400]),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(SizeConfig.screenHeight/55),
                                borderSide: BorderSide.none,
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                        child: TextFormField(
                          controller: amountController,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter amount...";
                            }
                          },
                          onSaved: (val) {
                            setState(() {
                              amount = int.parse(val!);
                            });
                          },
                          decoration: InputDecoration(
                              prefixIcon:  Icon(
                                Icons.currency_rupee,
                                color: Colors.green,
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                              hintText: "opening Balance",
                              hintStyle: TextStyle(fontSize: 18,color: Colors.grey[400]),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(SizeConfig.screenHeight/55),
                                borderSide: BorderSide.none,
                              )),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          ElevatedButton(
                             style: ElevatedButton.styleFrom(
                               backgroundColor: Colors.red,
                             ),
                              onPressed: () {
                            setState(() {
                              numberController.clear();
                              amountController.clear();

                              setState(() {
                                number = null;
                                amount = null;
                                // dropdownvalue = "";
                              });
                            });
                          }, child: Text("Cancel",style: TextStyle(color: Colors.white,fontSize: 17,letterSpacing: 1),)),


                          SizedBox(width: SizeConfig.screenWidth/5,),
                          
                          
                          
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();

                                  print(dropdownvalue);
                                  print(number);
                                  print(amount);

                                  Map<String, dynamic> data = {
                                    'category' : dropdownvalue,
                                    'number' : number,
                                    'amount' : amount,
                                  };

                                  AllData.add(data);

                                  Navigator.pushNamed(context, 'ClickData');
                                  setState(() {

                                  });
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Enter All Details..."),
                                      backgroundColor: Colors.red,
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                }
                                numberController.clear();
                                amountController.clear();

                                setState(() {
                                  number = null;
                                  amount = null;
                                  // dropdownvalue = "";
                                });
                          }, child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 17,letterSpacing: 1),)),
                        ],
                      ),
                      SizedBox(height: SizeConfig.screenHeight/50,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
