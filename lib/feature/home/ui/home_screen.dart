import 'package:flutter/material.dart';
import 'package:shopigo_mobile/components/main_drawer.dart';
import 'package:shopigo_mobile/feature/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopigo_mobile/feature/home/model/inventory_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<InventoryModel> inventoryList = [];

  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(RequestHomeData("product-1"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      drawer: MainDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is HomeFetchingData) {
                print('home loading');
              }
              if (state is HomeFetchDataSuccess) {
                setState(() {
                  print(state);
                  inventoryList = state.inventoryList.result!;
                  print(inventoryList);
                });
              }
            },
            buildWhen: (previousState, state) {
              return previousState != state && state is HomeFetchDataSuccess;
            },
            builder: (context, state) {
              return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 1000,
                        child: ListView.builder(
                            itemCount: inventoryList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                elevation: 10,
                                color: Theme.of(context).colorScheme.surfaceVariant,
                                child: SizedBox(
                                  width: 300,
                                  height: 500,
                                  child: Column(
                                    children: [
                                      Image.network(
                                        inventoryList[index].productImage!,
                                        width: 500,
                                        height: 400,
                                      ),
                                      Container(
                                        width: 500,
                                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                        child: Text(
                                          inventoryList[index].productName!,
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      Container(
                                        width: 500,
                                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                        child: Text(
                                          "RM " + inventoryList[index].productPrice!.toString(),
                                          style: const TextStyle(
                                              fontSize: 20, fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ));
            },
          ),
        ),
      ),
    );
  }
}
