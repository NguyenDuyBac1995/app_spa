import 'package:bloc_base/bloc/language/bloc_lang.dart';
import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/config/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../bloc/state_bloc.dart';
import '../../../styles/init_style.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocLanguage, StateBloc>(
        builder: (context, StateBloc state) {
      if (state is LoadSuccess) {
        Language language = state.data;
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.clear,
                  color: Colors.white,
                )),
            centerTitle: true,
            backgroundColor: ColorApp.darkGreen,
            title: Text(
              language.thongBao,
              style: StyleApp.textStyle700(color: Colors.white, fontSize: 18),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Const.size(context).width * 0.05,
                  vertical: Const.size(context).width * 0.07),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(language.homNay,
                      style: StyleApp.textStyle700(
                          fontSize: 16, color: ColorApp.dark252525)),
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Const.size(context).width * 0.025),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset('assets/svg/notiIcon.svg'),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: Const.size(context).width * 0.65,
                                  child: Text(
                                    'Thanh toán không thành côndsfsdjfiosdufiosdjsdiojfiosdfdsfsdfsdfhsduhfdjhg',
                                    style: StyleApp.textStyle600(
                                        color: ColorApp.dark252525),
                                  ),
                                ),
                                SizedBox(
                                  height: Const.size(context).width * 0.02,
                                ),
                                Text(
                                  '10:21 pm',
                                  style: StyleApp.textStyle400(
                                      color: const Color(0xff717171)),
                                )
                              ],
                            ),
                            const Icon(
                              Icons.more_horiz,
                              color: ColorApp.bottomBarABCA74,
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                  SizedBox(
                    height: Const.size(context).width * 0.05,
                  ),
                  Text(language.ganDay,
                      style: StyleApp.textStyle700(
                          fontSize: 16, color: ColorApp.dark252525)),
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Const.size(context).width * 0.025),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                child: SvgPicture.asset(
                                    'assets/svg/notiIcon.svg')),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: Const.size(context).width * 0.65,
                                  child: Text(
                                    'Thanh toán không thành côndsfsdjfiosdufiosdjsdiojfiosdfdsfsdfsdfhsduhfdjhg',
                                    style: StyleApp.textStyle600(
                                        color: ColorApp.dark252525),
                                  ),
                                ),
                                SizedBox(
                                  height: Const.size(context).width * 0.02,
                                ),
                                Text(
                                  '10:21 pm',
                                  style: StyleApp.textStyle400(
                                      color: const Color(0xff717171)),
                                )
                              ],
                            ),
                            const Icon(
                              Icons.more_horiz,
                              color: ColorApp.bottomBarABCA74,
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                ],
              ),
            ),
          ),
        );
      }
      return const Scaffold();
    });
  }
}
