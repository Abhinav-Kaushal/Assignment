import 'package:flutter_app/Model/currency_model.dart';
import 'package:flutter_app/Network_Handeler/network_handeler.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var time;
  DateTime now = DateTime.now();
  // Network handeler is for all Api functionality;

  NetworkHandeler _networkHandeler = NetworkHandeler();

  // Applied Model classes for getting the data;
  CurrencyModel currency_model = CurrencyModel();
// for loading
  bool circular = true ;


  TextEditingController Number = TextEditingController(text:"0");

 // i think this method is too much hard coded thats why implimenting
 // only three values

  var num1, INRnum, INR, RONnum , RON, AUDnum, AUD ;

// For implementing the multiplication logic

  void multiplication(){
    setState(() {
      num1 = int.parse(Number.text);
      INRnum = currency_model.INR;
      RONnum = currency_model.RON;
      AUDnum = currency_model.AUD;
      INR = num1*INRnum;
      RON = num1*RONnum;
      AUD = num1*AUDnum;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //formating the date and time
    time = DateFormat(' dd-MM-yyyy HH:mm:ss ${now.millisecond}').format(now);
    fetchData();
  }


// fetching data from Network Handeler instance
  void fetchData() async {
    var response = await _networkHandeler.get('');
    setState(() {
      currency_model =  CurrencyModel.fromJson(response['rates']);
      print(response);
      circular = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Text("Last updated time"),
            time == null ? Text("$time", style: TextStyle(
              fontSize: 15,
            ),):Text("${time}" , style: TextStyle(fontSize: 15), ),
          ],
        ) ,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.build),onPressed: (){
            setState(() {
              time;
            });
          },)
        ],
      ),
      body: ListView(
        children: <Widget>[
          Form(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30 , vertical: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: circular ? CircularProgressIndicator(): Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.teal
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            )
                        ),
                        labelText: "Enter the Currency",
                        hintText: "10",
                      ),
                      controller: Number,
                      keyboardType: TextInputType.number,
                    ),
                    RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: (){
                        multiplication();
                      },
                      child: Text("Click"),
                    ),

                    // Displaying the Currency
                    SizedBox(height: 10,),
                    INR == null ? details("INR", currency_model.INR.toString()):details("INR", "$INR"),
                    SizedBox(height: 10,),
                    RON == null ? details("RON", currency_model.RON.toString()):details("RON", "$RON"),
                    SizedBox(height: 10,),
                    AUD == null ? details("AUD", currency_model.AUD.toString()):details("AUD", "$AUD"),
                    SizedBox(height: 10,),
                    details("SEK", currency_model.SEK.toString()),
                    SizedBox(height: 10,),
                    details("DKK",currency_model.DKK.toString()),
                    SizedBox(height: 10,),
                    details("CAD", currency_model.CAD.toString()),
                    SizedBox(height: 10,),
                    details("PHP",currency_model.PHP.toString()),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // for displaying the details

  Widget details(String label, String value,){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("$label:", style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
        ), ),
        Text("$value:" , style: TextStyle(
            fontSize: 15
        ),)

      ],
    );
  }
}

