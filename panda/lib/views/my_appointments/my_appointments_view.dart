import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:pandamedical/styles/app_colors.dart';
import 'package:pandamedical/views/my_appointments/my_appointments_bloc.dart';
import 'package:pandamedical/widgets/no_result.dart';

class MyAppointmentView extends StatefulWidget {
  const MyAppointmentView({Key? key}) : super(key: key);

  @override
  _MyAppointmentViewState createState() => _MyAppointmentViewState();
}

class _MyAppointmentViewState extends State<MyAppointmentView> {
  // AuthBloc bloc;
  late DateTime initialDate;
  late MyAppointmentBloc _bloc;

  final _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async {
    _bloc.add(RefreshMyAppointment());
  }

  void _onLoading() async {
    // monitor network fetch
    // if failed,use loadFailed(),if no data return,use LoadNodata(), refreshCompleted, refreshFailed
    //_refreshController.loadComplete();
  }

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<MyAppointmentBloc>(context);
    //_bloc.add(InitMyAppointment());
    // _bloc.add(AppointmentOptions());
  }

  @override
  void dispose() {
    //bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bloc.add(MyAppointment(_refreshController, context));

    initialDate = DateTime(1990);

    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(children: <Widget>[
      Container(
        height: screenHeight + screenHeight,
        color: Colors.white,
      ),
      Column(children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            color: AppColors.greenBG,
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(45.0)),
          ),
        ),
      ]),
      //Container(margin: EdgeInsets.only(top: 100, left: 100,), height: 1000,),
      Positioned(
          top: 15.0,
          left: 0.0,
          right: 0.0,
          child: SizedBox(
            height: screenHeight,
            child: SmartRefresher(
                enablePullDown: true,
                //enablePullUp: true,
                header: const WaterDropHeader(),
                controller: _refreshController,
                onRefresh: _onRefresh,
                onLoading: _onLoading,
                child: Container(
                  height: screenHeight,
                  margin: const EdgeInsets.only(top: 0),
                  decoration: const BoxDecoration(
                    //color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(45.0)),
                  ),
                  child: ListView(
                      //shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const Image(
                            height: 40,
                            width: 100,
                            fit: BoxFit.fitHeight,
                            image: AssetImage('images/beat.png')),
                        Card(
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Container(
                              height: screenHeight,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(45.0)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 30),
                                child: BlocBuilder<MyAppointmentBloc,
                                        MyAppointmentState>(
                                    buildWhen: (previous, current) =>
                                        previous.vitalList != current.vitalList,
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
                                        ); //AppointmentDatas().myAppointment();
                                      } else if (state.vitalList!.isEmpty) {
                                        return Column(
                                          children: [
                                            NoResult(),
                                            const SizedBox(
                                              height: 200,
                                            )
                                          ],
                                        ); //AppointmentDatas().myAppointment();
                                      } else {
                                        return Column(
                                            children: state.vitalList!);
                                      }
                                    }),
                              )),
                        )
                      ]),
                )),
          )),
    ]);
  }
}
