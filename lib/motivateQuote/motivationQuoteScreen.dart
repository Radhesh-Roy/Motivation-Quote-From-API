import 'package:flutter/material.dart';
import 'package:motivational_quote/motivateQuote/API/api.dart';

class Motivationquotescreen extends StatefulWidget {
  const Motivationquotescreen({super.key});

  @override
  State<Motivationquotescreen> createState() => _MotivationquotescreenState();
}

class _MotivationquotescreenState extends State<Motivationquotescreen> {
  List apiData=[];
  void getApi() async{

var a= await Api().getData();
apiData=a['data'];
setState(() {

});
  }
  @override
  void initState() {
   getApi();
    super.initState();
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE2E8EA),
      appBar: AppBar(
        backgroundColor: Color(0xff3DA979),
        centerTitle: true,
        title: Text(
          "Motivation Quotes",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(spacing: 10,
          children: [
            Card(
              elevation: 5,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search Author or Quotes",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.search_rounded),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: apiData.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    elevation: 5,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Color(0xff1485D2),

                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(7),
                              child: Image.asset(
                                "assets/quote.png",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, left: 5, bottom: 15,right: 50),
                            child: Column(
                              spacing: 10,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${apiData[index]["quote"]}",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,

                                ),
                                Text("${apiData[index]["author"]}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.grey),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
