import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:pandamedical/styles/app_colors.dart';
import 'package:pandamedical/widgets/text.dart';
import 'package:pandamedical/views/vitals/vitals_bloc.dart';
import 'package:pandamedical/constants/routing_constants.dart';
import 'package:pandamedical/widgets/no_result.dart';

class VitalsView extends StatefulWidget {
  const VitalsView({Key? key}) : super(key: key);

  @override
  _VitalsViewState createState() => _VitalsViewState();
}

class _VitalsViewState extends State<VitalsView> {
  late DateTime initialDate;
  final _key = GlobalKey<FormState>();
  late VitalsBloc _bloc;

  final _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async {
    _bloc.add(RefreshVitals());
  }

  void _onLoading() async {
    // monitor network fetch
    // if failed,use loadFailed(),if no data return,use LoadNodata(), refreshCompleted, refreshFailed
    //_refreshController.loadComplete();
  }

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<VitalsBloc>(context);
    //_bloc.add(InitVitals());
    _bloc.add(VitalsOptions());
  }

  @override
  void dispose() {
    //bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bloc.add(Vitals(_refreshController, context));

    initialDate = DateTime(1990);

    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: CustomText(
              text: 'Vital(s)', color: AppColors.blue, big: true, bold: true),
          backgroundColor: AppColors.greenBG,
          leading: BackButton(
              color: AppColors.blue,
              onPressed: () {
                Navigator.pop(context);
              }),
          actions: [
            BlocBuilder<VitalsBloc, VitalsState>(
                buildWhen: (previous, current) =>
                    previous.vitalOptions != current.vitalOptions,
                builder: (context, state) {
                  if (state.vitalOptions == null) {
                    return GestureDetector(
                      onTap: () => Navigator.pushNamed(context, AddVitalRoute,
                          arguments: state.vitalOptions),
                      child: Icon(
                        Icons.add,
                        color: AppColors.primary,
                        size: 30,
                      ),
                    ); //VitalsDatas().Vitals();
                  } else {
                    return GestureDetector(
                      onTap: () => Navigator.pushNamed(context, AddVitalRoute,
                          arguments: state.vitalOptions),
                      child: Icon(
                        Icons.add,
                        color: AppColors.primary,
                        size: 30,
                      ),
                    );
                  }
                }),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, AddLabResultRoute),
              child: Icon(
                Icons.share,
                color: AppColors.primary,
                size: 30,
              ),
            ),
            const SizedBox(width: 10)
          ],
        ),
        body: SmartRefresher(
            enablePullDown: true,
            //enablePullUp: true,
            header: const WaterDropHeader(),
            controller: _refreshController,
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            child: ListView(children: [
              Stack(children: <Widget>[
                Container(
                  height: screenHeight,
                  color: Colors.white,
                ),
                Container(
                    child: Column(children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: AppColors.greenBG,
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(40.0)),
                    ),
                  ),
                ])),
                //Container(margin: EdgeInsets.only(top: 100, left: 100,), height: 1000,),
                Positioned(
                    top: 15.0,
                    left: 0.0,
                    right: 0.0,
                    bottom: 0.0,
                    child: SizedBox(
                      height: 730,
                      child: ListView(
                          //shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true, //controller: ScrollController(),
                          children: [
                            const Image(
                                height: 40,
                                width: 100,
                                fit: BoxFit.fitHeight,
                                image: AssetImage('images/beat.png')),
                            Card(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                //elevation: 45,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 30),
                                  child: BlocBuilder<VitalsBloc, VitalsState>(
                                      buildWhen: (previous, current) =>
                                          previous.vitalList !=
                                          current.vitalList,
                                      builder: (context, state) {
                                        if (state.vitalList == null) {
                                          return Column(
                                            children: const [
                                              SizedBox(height: 100),
                                              Center(
                                                  child: SizedBox(
                                                      width: 40,
                                                      child:
                                                          CircularProgressIndicator())),
                                              SizedBox(height: 500),
                                            ],
                                          );
                                        } else if (state.vitalList!.isEmpty) {
                                          return Column(
                                            children: [
                                              NoResult(),
                                              const SizedBox(
                                                height: 300,
                                              )
                                            ],
                                          ); //VitalsDatas().myVitals();
                                        } else {
                                          return Column(children: [
                                            Column(children: state.vitalList!),
                                            const SizedBox(height: 40)
                                          ]);
                                        }
                                      }),
                                )),
                          ]),
                    )),
              ])
            ])));
  }
}
