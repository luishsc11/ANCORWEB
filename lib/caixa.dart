import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data/api.dart';
import 'detalhes.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final api = Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Column(
          children: [
            const Text(
              'ANCOR SEGUROS',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {});
                      },
                      icon: Icon(Icons.refresh),
                      color: Colors.black,
                    ),
                    Text(
                      'Caixa de Entrada',
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => LoginPage()),
                    );
                  },
                  child: Text('Logout'),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: api.getAnnouncements(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Text(
                        'Carregando',
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Ocorreu um erro: ${snapshot.error}');
                  }
                  if (snapshot.hasData && snapshot.data != null) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue.withOpacity(0.8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return SizedBox(height: 32);
                                      },
                                      itemCount: snapshot.data!.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final rowData = snapshot.data![index];

                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => Detalhes(
                                                  rowData: rowData,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Color(0xFFE5D9D9),
                                              border: Border.all(
                                                color: Colors.blue,
                                                width: 2.0,
                                              ),
                                            ),
                                            padding: EdgeInsets.all(10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    rowData['nome'],
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    rowData['modelo'],
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    rowData['celular'],
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
