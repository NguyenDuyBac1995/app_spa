import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/widget/item/input/bottom_sheet.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:read_more_less/read_more_less.dart';

import '../../../bloc/language/bloc_lang.dart';
import '../../../bloc/state_bloc.dart';
import '../../../config/const.dart';
import '../../../model/model_local.dart';
import '../../../styles/init_style.dart';
import '../../../widget/item/button.dart';
import '../../../widget/item/image_slide_common.dart';
import '../../../widget/item/input/text_filed.dart';
import '../../../widget/item/load_image.dart';

class InfoService extends StatefulWidget {
  const InfoService({Key? key}) : super(key: key);

  @override
  State<InfoService> createState() => _InfoServiceState();
}

class _InfoServiceState extends State<InfoService> {
  bool opacity = true;
  TextEditingController dichVu = TextEditingController();
  bool ttdv = true;
  int selectedIndex = -1;
  int constLength = 3;
  TextEditingController ngay = TextEditingController();
  TextEditingController gio = TextEditingController();
  TextEditingController serviceTypeController = TextEditingController();

  List<ModelLocal2> items = [
    ModelLocal2(name: 'Chi nhánh 16A Lê Lợi - Lạng Sơn', id: 'filterIcon1.svg'),
    ModelLocal2(
        name:
            'Chi nhánh gì đó tên dài rất dài mà phải xuống dòng - Hoàn Kiếm - Hà Nội',
        id: 'filterIcon2.svg'),
    ModelLocal2(name: 'Chi nhánh 16A Lê Lợi - Lạng Sơn', id: 'filterIcon3.svg'),
  ];
  String? selectedDV;
  String? selectedCN;

  List<ModelLocal2> listFilter = [
    ModelLocal2(name: 'Kiểm soát dầu, thu gọn lỗ chân lông', id: '200.000'),
    ModelLocal2(
        name:
            'Dịch vụ gì đó tên dài rất dài mà phải xuống dòng abc njkf kvnjxv',
        id: '200.000'),
    ModelLocal2(name: 'Tiếp nước cho da', id: '₫ 200.000'),
  ];
  List<ModelLocal2> listFilter2 = [];
  List<ModelLocal2> checkListItems = [
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Trị liệu thâm nám',
      id: '2',
    ),
    ModelLocal2(
      name: 'Liệu trình tắm trắng',
      id: '3',
    ),
    ModelLocal2(
      name: 'Liệu trình giảm cân',
      id: '4',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
  ];
  List<ModelLocal2> checkListItems2 = [
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Trị liệu thâm námàdasf àiasjf à ấ fasfasjfas fas jfpasjf ậ',
      id: '2',
    ),
    ModelLocal2(
      name: 'Liệu trình tắm trắng',
      id: '3',
    ),
    ModelLocal2(
      name: 'Liệu trình giảm cân',
      id: '4',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    ngay.dispose();
    gio.dispose();
    serviceTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocLanguage, StateBloc>(builder: (_, StateBloc state) {
      if (state is LoadSuccess) {
        Language lang = state.data;
        return Scaffold(
          bottomSheet: Padding(
            padding: EdgeInsets.only(
              left: Const.sizeWidth(context, 16),
              right: Const.sizeWidth(context, 16),
              bottom: Const.sizeHeight(context, 20),
              top:Const.sizeHeight(context, 5),
            ),
            child: Row(
              children: [
                Expanded(
                    child: ButtonWidget(
                  text: lang.muaGoi,
                  onTap: () {
                    BottomSheetInforService.purchaseBuyBottomSheet(
                        context, lang);
                  },
                )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: ButtonWidget(
                        text: lang.datLichNgay,
                        onTap: () {
                          _bookingNowBottomSheet(context, lang);
                        },
                        type: ButtonType.secondary))
              ],
            ),
          ),
          body: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
              ),
              const ImageSliderStyle(),
              Positioned(
                height: MediaQuery.of(context).size.height * 0.7,
                top: MediaQuery.of(context).size.height * 0.25,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                          top:Radius.circular(15))),
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Const.size(context).width * 0.05,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Const.size(context).width * 0.04,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Chăm Sóc Da Mặt',
                                style: StyleApp.textStyle700(
                                    color: ColorApp.dark252525, fontSize: 22),
                              ),
                              SizedBox(
                                height: Const.size(context).width * 0.03,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '₫ 400.000 ',
                                        style: StyleApp.textStyle700(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: ColorApp.dark500),
                                      ),
                                      Text(
                                        '₫ 200.000',
                                        style: StyleApp.textStyle700(
                                            color: ColorApp.darkGreen,
                                            fontSize: 17),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.watch_later_rounded,
                                        color: ColorApp.greyAD,
                                        size: 16,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '90 phút',
                                        style: StyleApp.textStyle500(
                                            fontSize: 18,
                                            color: ColorApp.greyAD),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const Gap(6),
                            ],
                          ),
                        ),
                        const Divider(),
                        Expanded(
                          child: SingleChildScrollView(
                            padding: EdgeInsets.symmetric(
                                vertical: Const.size(context).width * 0.02,),
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: Const.size(context).width * 0.04),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              ttdv = true;
                                              setState(() {});
                                            },
                                            child: Text(
                                              lang.thongTinDichVu,
                                              style: StyleApp.styleGilroy700(
                                                  fontSize: 15,
                                                  color: ttdv == true
                                                      ? ColorApp.bottomBarABCA74
                                                      : ColorApp.dark500),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              ttdv = false;
                                              setState(() {});
                                            },
                                            child: Row(
                                              children: [
                                                Text(
                                                  lang.danhGia,
                                                  style: StyleApp.styleGilroy700(
                                                      fontSize: 15,
                                                      color: ttdv == false
                                                          ? ColorApp.bottomBarABCA74
                                                          : ColorApp.dark500),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                const Icon(
                                                  Icons.star,
                                                  color: ColorApp.yellow,
                                                  size: 19,
                                                ),
                                                Text(
                                                  '4.7 ',
                                                  style: StyleApp.textStyle500(
                                                      fontSize: 15,
                                                      color: ColorApp.yellow),
                                                ),
                                                Text(
                                                  ' (86)',
                                                  style: StyleApp.textStyle500(
                                                      fontSize: 15,
                                                      color: ColorApp.dark500),
                                                )
                                              ],
                                            ),
                                          ),
                                          const SizedBox()
                                        ],
                                      ),
                                      const Gap(13),
                                      ttdv == true
                                          ? Column(
                                        children: [
                                          InputText1(
                                            borderSize: 0.7,
                                            colorBg: ColorApp.background,
                                            borderColor: ColorApp.greyAD,
                                            radius: 12,
                                            controller: serviceTypeController,
                                            label: lang.chonDV,
                                            readOnly: true,
                                            hasSuffix: true,
                                            onTap: () {
                                              BottomSheetInforService
                                                  .selecteRadioBottomSheet(
                                                  context,
                                                  lang.chonDV,
                                                  listFilter,
                                                  selectedIndex,
                                                  serviceTypeController);
                                              // _serviceBottomSheet(context, lang);
                                            },
                                            suffix: const Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color: ColorApp.black,
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                              Const.size(context).width *
                                                  0.0406451612),
                                          Stack(
                                            children: [
                                              ReadMoreLess(
                                                textAlign: TextAlign.left,
                                                textStyle: StyleApp.textStyle400(color: ColorApp.dark252525,),
                                                maxLines: 8,
                                                collapsedHeight: Const.sizeHeight(context, 120),
                                                customButtonBuilder: (
                                                    bool isCollapsed ,
                                                    VoidCallback onPro,
                                                    ) {
                                                  return isCollapsed
                                                      ? _DescribleServiceWidget(
                                                    text: lang.xemThem,
                                                    onPressed: (){
                                                      onPro();
                                                      opacity = !opacity;
                                                      setState(() {});
                                                    },
                                                    icon: Icons
                                                        .keyboard_arrow_down,
                                                  )
                                                      : _DescribleServiceWidget(
                                                    text: lang.thuNho,
                                                    onPressed: (){
                                                      onPro();
                                                      opacity = !opacity;
                                                      setState(() {});
                                                    },
                                                    icon: Icons
                                                        .keyboard_arrow_up,
                                                  );
                                                },
                                                text: '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur et lobortis erat. Sed vulputate elit lacinia justo tincidunt varius. Nam convallis semper magna, a volutpat turpis feugiat sed. Morbi ac ligula suscipit, lobortis arcu at, ornare justo. Maecenas vestibulum, eros et imperdiet egestas, tellus enim porttitor risus, sit amet tincidunt est neque nec arcu. Pellentesque egestas dolor vitae nisl varius, ut hendrerit nisl auctor. Morbi eget ex sapien. Donec congue sagittis ante, ac fermentum felis molestie at. Integer pharetra nec est at blandit. Nullam vestibulum at est id sollicitudin. Etiam maximus ipsum orci, nec placerat ligula pharetra vel. Curabitur rutrum justo et mauris eleifend, in tristique dolor molestie. Nullam ut sem quis orci dictum vestibulum eu ac sem. Nam eu consectetur lacus. Nulla ut elit sed urna condimentum efficitur.
''',
                                              ),
                                              opacity
                                                  ? Positioned(
                                                  bottom: 25,
                                                  child: Container(
                                                    width: MediaQuery.of(
                                                        context)
                                                        .size
                                                        .width,
                                                    height:
                                                    Const.sizeHeight(
                                                        context, 50),
                                                    decoration:
                                                    BoxDecoration(
                                                        gradient: LinearGradient(
                                                          colors: [
                                                            ColorApp.background.withOpacity(0.5),
                                                            ColorApp.background
                                                          ],
                                                          begin: Alignment.topCenter,
                                                          end: Alignment.bottomCenter
                                                        )
                                                    ),
                                                  ))
                                                  : SizedBox()
                                            ],
                                          )
                                        ],
                                      )
                                          : Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          ListView.builder(
                                            itemCount: constLength,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.all(
                                                        8.0),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: Container(
                                                            height: Const.size(
                                                                context)
                                                                .width *
                                                                0.09692307692,
                                                            width: Const.size(
                                                                context)
                                                                .width *
                                                                0.09692307692,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    80)),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  80),
                                                              child:
                                                              const LoadImage(
                                                                url:
                                                                'https://pbs.twimg.com/media/Fr8SLFzaEAE_skC?format=jpg&name=large',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Expanded(
                                                          flex: 10,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    'Quỳnh Anh',
                                                                    style: StyleApp
                                                                        .textStyle700(
                                                                        color:
                                                                        ColorApp.dark252525),
                                                                  ),
                                                                  Text(
                                                                    '4 ngày trước',
                                                                    style: StyleApp
                                                                        .textStyle400(
                                                                        color:
                                                                        ColorApp.dark500),
                                                                  )
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: Const.size(
                                                                    context)
                                                                    .width *
                                                                    0.01692307692,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  ...List
                                                                      .generate(
                                                                      5,
                                                                          (index) =>
                                                                      const Icon(
                                                                        Icons.star,
                                                                        size: 18,
                                                                        color: ColorApp.yellow,
                                                                      )),
                                                                  Text(
                                                                    '${lang.dichvu}: ',
                                                                    style: StyleApp
                                                                        .textStyle400(
                                                                        color:
                                                                        ColorApp.dark500),
                                                                  ),
                                                                  Expanded(
                                                                    child: Text(
                                                                      'Dịch vụ: Kiểm soát dầu, thu gọn lỗ chân lôngìa ầ pgkr fdgokdfgm dfogkdfgm dfgpdfkg,df ògjfdkg',
                                                                      style: StyleApp.textStyle400(
                                                                          color:
                                                                          ColorApp.bottomBarABCA74),
                                                                      maxLines:
                                                                      1,
                                                                      overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: Const.size(
                                                                    context)
                                                                    .width *
                                                                    0.01692307692,
                                                              ),
                                                              Text(
                                                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
                                                                style: StyleApp
                                                                    .textStyle400(
                                                                    color: ColorApp
                                                                        .dark500),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  const Divider()
                                                ],
                                              );
                                            },
                                            shrinkWrap: true,
                                            physics:
                                            const NeverScrollableScrollPhysics(),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              constLength = 10;
                                              lang.xemThem = lang.daHet;
                                              setState(() {});
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              decoration: const BoxDecoration(),
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    const SizedBox(),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          lang.xemThem,
                                                          style: StyleApp
                                                              .textStyle400(
                                                              color: ColorApp
                                                                  .bottomBarABCA74),
                                                        ),
                                                        const Icon(
                                                          Icons
                                                              .keyboard_arrow_down,
                                                          size: 16,
                                                          color: ColorApp
                                                              .bottomBarABCA74,
                                                        )
                                                      ],
                                                    ),
                                                    const SizedBox(),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                .size
                                                .height *
                                                0.066,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: Const.size(context).width * 0.03,
                                      ),
                                      Text(
                                        lang.dvKhac,
                                        style: StyleApp.textStyle700(
                                            color: ColorApp.dark252525, fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: Const.size(context).width * 0.03,
                                      ),
                                    ],
                                  ),
                                ),
                                ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => const InfoService()));
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(vertical: 8 , horizontal: Const.sizeWidth(context, 16)),
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: SizedBox(
                                                      height:
                                                      Const.size(context).width * 0.17948717948,
                                                      width:
                                                      Const.size(context).width * 0.21025641025,
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(12),
                                                        child: Image.asset(
                                                          'assets/images/exSpa.png',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      )),
                                                ),
                                                Expanded(
                                                  flex: 5,
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: Const.size(context).width *
                                                            0.02948717948),
                                                    height:
                                                    Const.size(context).width * 0.17948717948,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Chăm sóc da mặt',
                                                          style: StyleApp.textStyle700(
                                                              color: ColorApp.dark252525),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              '₫ 400.000 ',
                                                              style: StyleApp.textStyle700(
                                                                  decoration:
                                                                  TextDecoration.lineThrough,
                                                                  color: ColorApp.dark500),
                                                            ),
                                                            Text(
                                                              '₫ 200.000',
                                                              style: StyleApp.textStyle700(
                                                                  color: ColorApp.darkGreen),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                              Icons.star,
                                                              color: ColorApp.yellow,
                                                              size: 18,
                                                            ),
                                                            Text(
                                                              ' 4.5 ',
                                                              style: StyleApp.textStyle700(
                                                                  color: ColorApp.yellow),
                                                            ),
                                                            Text('(86)', style: StyleApp.textStyle400(),),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: SizedBox(
                                                    height:
                                                    Const.size(context).width * 0.17948717948,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Icon(
                                                          Icons.favorite,
                                                          size: 18,
                                                          color: index % 2 == 1
                                                              ? ColorApp.yellow
                                                              : ColorApp.dark500.withOpacity(0.3),
                                                        ),
                                                        Container(
                                                            decoration: BoxDecoration(
                                                                color: ColorApp.bottomBarABCA74,
                                                                borderRadius:
                                                                BorderRadius.circular(10)),
                                                            child: Padding(
                                                              padding: EdgeInsets.symmetric(
                                                                  horizontal:
                                                                  Const.sizeWidth(context, 12),
                                                                  vertical:
                                                                  Const.sizeWidth(context, 6)),
                                                              child: Text(
                                                                lang.chiTiet,
                                                                style: StyleApp.textStyle700(
                                                                    color: Colors.white),
                                                              ),
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  shrinkWrap: true,
                                  itemCount: 10,
                                  separatorBuilder: (BuildContext context, int index) {
                                    return const Divider(color: ColorApp.dark500 );
                                  },
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }
      return const Scaffold();
    });
  }

  Future<dynamic> _bookingNowBottomSheet(BuildContext context, Language lang) {
    return showModalBottomSheet(
        backgroundColor: ColorApp.background,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(15)),
        ),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState1) {
            return Container(
              height: Const.size(context).height * 0.8,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(15))
                      ),
                      padding: EdgeInsets.symmetric(vertical: Const.sizeHeight(context, 14), horizontal: Const.sizeWidth(context, 16)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.clear),
                          ),
                          Text(
                            lang.muaGoi,
                            style: StyleApp.textStyle700(
                                fontSize: 18, color: ColorApp.dark252525),
                          ),
                          const SizedBox(width: 20,)
                        ],
                      ),
                    ),
                    const Divider( color: ColorApp.dark500,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Const.sizeWidth(context, 16)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Const.size(context).width * 0.0241025641,
                          ),
                          Text(
                            lang.chiNhanh,
                            style:
                            StyleApp.textStyle700(color: ColorApp.dark252525),
                          ),
                          const Gap(10),
                          InputText1(
                            borderColor: ColorApp.backgroundF5F6EE,
                            colorBg: ColorApp.backgroundF5F6EE,
                            radius: 12,
                            controller: serviceTypeController,
                            label: lang.chonChiNhanh,
                            readOnly: true,
                            hasSuffix: true,
                            onTap: () {
                              BottomSheetInforService.selecteRadioBottomSheet(
                                  context,
                                  lang.chiNhanh,
                                  items,
                                  selectedIndex,
                                  serviceTypeController);
                            },
                            suffix: const Icon(Icons.keyboard_arrow_down_rounded),
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.0241025641,
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.0541025641,
                          ),
                          Text(
                            lang.dichvu,
                            style:
                            StyleApp.textStyle700(color: ColorApp.dark252525),
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.0241025641,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  flex: 5,
                                  child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(bottom: 5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(15),
                                              color: ColorApp.greyF9),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                          '${listFilter2[index].name}'),
                                                      Text(
                                                          '₫ ${listFilter2[index].id}')
                                                    ],
                                                  ),
                                                ),
                                                InkWell(
                                                    onTap: () {
                                                      for (var item in listFilter) {
                                                        if (listFilter2[index]
                                                            .name ==
                                                            item.name) {
                                                          item.value = false;
                                                        }
                                                      }
                                                      listFilter2.removeAt(index);
                                                      setState1(() {});
                                                    },
                                                    child: const Icon(Icons.clear))
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: listFilter2.length,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return StatefulBuilder(builder:
                                                (BuildContext context,
                                                StateSetter setState2) {
                                              return SizedBox(
                                                height: Const.size(context).height *
                                                    0.8,
                                                child: SingleChildScrollView(
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: const Icon(
                                                                  Icons.clear),
                                                            ),
                                                            Text(
                                                              lang.dichvu,
                                                              style: StyleApp
                                                                  .textStyle700(
                                                                  fontSize: 18,
                                                                  color: ColorApp
                                                                      .dark252525),
                                                            ),
                                                            const SizedBox()
                                                          ],
                                                        ),
                                                        const Divider(),
                                                        ListView.builder(
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Padding(
                                                              padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  bottom: 5),
                                                              child: Container(
                                                                width:
                                                                double.infinity,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        12),
                                                                    color: ColorApp
                                                                        .greyF9),
                                                                child: Padding(
                                                                  padding: EdgeInsets.only(
                                                                      left: Const.size(
                                                                          context)
                                                                          .width *
                                                                          0.04615384615),
                                                                  child:
                                                                  CheckboxListTile(
                                                                    checkboxShape:
                                                                    const CircleBorder(),
                                                                    activeColor:
                                                                    Colors
                                                                        .green,
                                                                    controlAffinity:
                                                                    ListTileControlAffinity
                                                                        .trailing,
                                                                    contentPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                    dense: true,
                                                                    title: Text(
                                                                      listFilter[index]
                                                                          .name ??
                                                                          '',
                                                                      style: StyleApp
                                                                          .textStyle500(),
                                                                    ),
                                                                    value: listFilter[
                                                                    index]
                                                                        .value,
                                                                    onChanged:
                                                                        (value) {
                                                                      listFilter[index]
                                                                          .value =
                                                                          value;
                                                                      listFilter2 =
                                                                      [];
                                                                      for (var item
                                                                      in listFilter) {
                                                                        if (item.value ==
                                                                            true) {
                                                                          listFilter2
                                                                              .add(
                                                                              item);
                                                                        }
                                                                      }
                                                                      setState2(
                                                                              () {});
                                                                      setState1(
                                                                              () {});
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          shrinkWrap: true,
                                                          physics:
                                                          const NeverScrollableScrollPhysics(),
                                                          itemCount:
                                                          listFilter.length,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                          });
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 5),
                                      child:
                                      Icon(Icons.keyboard_arrow_down_rounded),
                                    ),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.0541025641,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 10,
                                  child: Text(
                                    lang.ngayThucHien,
                                    style: StyleApp.textStyle700(
                                        color: ColorApp.dark500),
                                  )),
                              const Expanded(
                                flex: 1,
                                child: SizedBox(),
                              ),
                              Expanded(
                                  flex: 10,
                                  child: Text(
                                    lang.gioGoiY,
                                    style: StyleApp.textStyle700(
                                        color: ColorApp.dark500),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.0241025641,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 10,
                                  child: InputText1(
                                    onTap: () {
                                      // DatePicker.showDatePicker(context,
                                      //     currentTime: DateTime.now(),
                                      //     locale: lang.codeNow == 'en'
                                      //         ? LocaleType.en
                                      //         : LocaleType.vi, onConfirm: (date) {
                                      //   ngay.text = Const.formatTime(
                                      //       date.millisecondsSinceEpoch,
                                      //       format: 'dd/MM/yyyy');
                                      // });
                                    },
                                    controller: ngay,
                                    label:
                                    '${Const.formatTime(DateTime.now().millisecondsSinceEpoch, format: 'dd/MM/yyyy')}',
                                    colorBg: ColorApp.backgroundF5F6EE,
                                    borderColor: ColorApp.backgroundF5F6EE,
                                    radius: 12,
                                    readOnly: true,
                                  )),
                              const Expanded(
                                flex: 1,
                                child: SizedBox(),
                              ),
                              Expanded(
                                  flex: 10,
                                  child: InputText1(
                                    onTap: () {
                                      // DatePicker.showTimePicker(context,
                                      //     currentTime: DateTime.now(),
                                      //     locale: lang.codeNow == 'en'
                                      //         ? LocaleType.en
                                      //         : LocaleType.vi, onConfirm: (date) {
                                      //   gio.text = Const.formatTime(
                                      //       date.millisecondsSinceEpoch,
                                      //       format: 'HH:mm');
                                      // }, showSecondsColumn: false);
                                    },
                                    controller: gio,
                                    label:
                                    '${Const.formatTime(DateTime.now().millisecondsSinceEpoch, format: 'HH:mm')}',
                                    colorBg: ColorApp.backgroundF5F6EE,
                                    borderColor: ColorApp.backgroundF5F6EE,
                                    radius: 12,
                                    readOnly: true,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.0541025641,
                          ),
                          Text(
                            lang.yeuCauDacBiet,
                            style:
                            StyleApp.textStyle700(color: ColorApp.dark252525),
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.0241025641,
                          ),
                          InputText1(
                            label: '',
                            maxLine: 5,
                            colorBg: ColorApp.backgroundF5F6EE,
                            borderColor: ColorApp.backgroundF5F6EE,
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.0541025641,
                          ),
                          DottedBorder(
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(15),
                              color: ColorApp.bottomBarABCA74,
                              dashPattern: const [5, 1],
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(
                                          Const.size(context).width * 0.03),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          SvgPicture.asset(
                                              'assets/svg/discount2.svg'),
                                          Text(
                                            '   ${lang.maGiamGia}',
                                            style: StyleApp.textStyle700(
                                                color: ColorApp.dark500,
                                                fontSize: 13),
                                          ),
                                          const SizedBox(),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: Const.size(context).width *
                                              0.05277777777),
                                      child: const FaIcon(
                                        FontAwesomeIcons.arrowRightLong,
                                        size: 16,
                                        color: ColorApp.bottomBarABCA74,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: Const.size(context).width * 0.0541025641,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    lang.tongThanhToan,
                                    style: StyleApp.textStyle500(
                                        color: ColorApp.dark500),
                                  ),
                                  Text(
                                    '₫ 400.000',
                                    style: StyleApp.textStyle700(
                                        color: ColorApp.darkGreen),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  BottomSheetInforService.addedToCartBottomSheet(
                                      context, lang);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: ColorApp.yellow,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: Const.size(context).width *
                                            0.04615384615,
                                        horizontal: Const.size(context).width *
                                            0.08615384615),
                                    child: Text(
                                      lang.datLich.toUpperCase(),
                                      style: StyleApp.textStyle700(
                                          color: ColorApp.dark252525),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          });
        });
  }

// Future<dynamic> _addedToCartBottomSheet(BuildContext context, Language lang) {
//   return showModalBottomSheet(
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(12), topRight: Radius.circular(12)),
//       ),
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           height: MediaQuery.of(context).size.height * 0.75,
//           decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(12),
//                   topRight: Radius.circular(12))),
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: const Icon(Icons.clear),
//                       ),
//                       const SizedBox()
//                     ],
//                   ),
//                   SizedBox(height: Const.size(context).width * 0.1),
//                   Text(
//                     lang.daThemVaoGioHang,
//                     style: StyleApp.textStyle700(
//                         color: ColorApp.dark, fontSize: 20),
//                   ),
//                   SizedBox(height: Const.size(context).width * 0.11),
//                   SvgPicture.asset('assets/svg/datLichTC.svg'),
//                   SizedBox(height: Const.size(context).width * 0.08),
//                   Text(
//                     lang.banDaThem,
//                     style: StyleApp.textStyle500(color: ColorApp.dark500),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: Const.size(context).width * 0.03),
//                   Text(
//                     lang.camOnBan,
//                     style: StyleApp.textStyle500(color: ColorApp.dark500),
//                   ),
//                   SizedBox(height: Const.size(context).width * 0.18),
//                   ButtonWidget(
//                     text: lang.commomViewCart.toUpperCase(),
//                     onTap: () {},
//                     type: ButtonType.secondary,
//                   ),
//                   SizedBox(height: Const.size(context).width * 0.03),
//                   ButtonWidget(
//                     text: lang.timDVKhac.toUpperCase(),
//                     onTap: () {},
//                   )
//                 ],
//               ),
//             ),
//           ),
//         );
//       });
// }

// Future<dynamic> _purchaseBuyBottomSheet(BuildContext context, Language lang) {
//   return showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return StatefulBuilder(
//             builder: (BuildContext context, StateSetter setState) {
//           return SizedBox(
//             height: Const.size(context).height * 0.8,
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             Navigator.pop(context);
//                           },
//                           child: const Icon(Icons.clear),
//                         ),
//                         Text(
//                           lang.muaGoi,
//                           style: StyleApp.textStyle700(
//                               fontSize: 18, color: ColorApp.dark),
//                         ),
//                         const SizedBox()
//                       ],
//                     ),
//                     const Divider(),
//                     ListView.builder(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemCount:
//                           3, // The number of RadioListTiles you want to display
//                       itemBuilder: (BuildContext context, int index) {
//                         return Container(
//                           margin: const EdgeInsets.only(bottom: 5),
//                           decoration: BoxDecoration(color: ColorApp.greyF9),
//                           child: Padding(
//                             padding: EdgeInsets.all(
//                                 Const.size(context).width * 0.05),
//                             child: Column(
//                               children: [
//                                 Row(
//                                   crossAxisAlignment:
//                                       CrossAxisAlignment.start,
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     SizedBox(
//                                         width:
//                                             Const.size(context).width * 0.63,
//                                         child: Text(
//                                           'Combo Chăm Sóc Da Mặt + Gội Đầu Thảo Dược',
//                                           style: StyleApp.textStyle700(
//                                               color: ColorApp.dark,
//                                               fontSize: 16),
//                                         )),
//                                     Container(
//                                       decoration: BoxDecoration(
//                                           color: ColorApp.pink,
//                                           borderRadius:
//                                               BorderRadius.circular(12)),
//                                       child: Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             vertical: 6, horizontal: 9),
//                                         child: Text(
//                                           '-78%',
//                                           style: StyleApp.textStyle700(
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: Const.size(context).width * 0.023,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Text(
//                                           '₫ 400.000 ',
//                                           style: StyleApp.textStyle700(
//                                               decoration:
//                                                   TextDecoration.lineThrough,
//                                               color: ColorApp.dark500),
//                                         ),
//                                         Text(
//                                           '₫ 200.000',
//                                           style: StyleApp.textStyle700(
//                                               color: ColorApp.darkGreen),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         Transform.scale(
//                                             scale: 0.8,
//                                             child: SvgPicture.asset(
//                                                 'assets/svg/notiIcon.svg')),
//                                         Text(
//                                           '  6 buổi',
//                                           style: StyleApp.textStyle700(
//                                               color: ColorApp.darkGreen,
//                                               fontSize: 15),
//                                         ),
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: Const.size(context).width * 0.023,
//                                 ),
//                                 Text(
//                                   'Tấm Home Spa - Combo Chăm Sóc Da Mặt + Gội Đầu Thảo Dược. Voucher 550,000 VNĐ, Còn 119,000 VNĐ, Giảm 78%.',
//                                   style: StyleApp.textStyle500(
//                                       color: ColorApp.dark500),
//                                 ),
//                                 SizedBox(
//                                   height: Const.size(context).width * 0.033,
//                                 ),
//                                 ButtonWidget(
//                                   text: lang.muaGoi,
//                                   onTap: () => InforServiceBottomSheet
//                                       .addedToCartBottomSheet(context, lang),
//                                 )

//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//       });
// }
}

class _ActionAppbarWidget extends StatelessWidget {
  const _ActionAppbarWidget({
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black.withOpacity(0.3),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _DescribleServiceWidget extends StatelessWidget {
  const _DescribleServiceWidget({
    // super.key,
    required this.text,
    required this.onPressed,
    required this.icon,
  });

  final String text;
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: Colors.transparent),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: StyleApp.textStyle600(color: ColorApp.bottomBarABCA74),
                textAlign: TextAlign.center,
              ),
              const Gap(3),
              Icon(
                icon,
                color: ColorApp.bottomBarABCA74,
                size: 18,
              )
            ],
          ),
        ),
      ),
    );
  }
}
