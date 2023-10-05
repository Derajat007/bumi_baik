import 'package:new_bumi_baik/common/common_widget.dart';
import 'package:new_bumi_baik/models/product_adopt_model.dart';
import 'package:new_bumi_baik/screens/donasi/donasi_detail.dart';
import 'package:new_bumi_baik/screens/tree_adopt/tree_adopt_detail.dart';
import 'package:new_bumi_baik/screens/widgets/product_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

import '../../resources/color_manager.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DonasiList extends StatefulWidget {
  List<ProductAdoptModel> adoptList;
  DonasiList({required this.adoptList, Key? key}) : super(key: key);

  @override
  State<DonasiList> createState() => _DonasiListState();
}

class _DonasiListState extends State<DonasiList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.buildCommonAppbar(context, "Daftar Donasi"),
      body: ResponsiveGridList(
        listViewBuilderOptions: ListViewBuilderOptions(shrinkWrap: true),
        minItemsPerRow: 2,
        horizontalGridSpacing: 10,
        verticalGridSpacing: 10,
        minItemWidth: MediaQuery.of(context).size.width * 0.5,
        horizontalGridMargin: 10,
        verticalGridMargin: 10,
        children: List.generate(
          widget.adoptList.length,
          (index) => GestureDetector(
            onTap: () {
              CommonWidget().movePage(
                context,
                DonasiDetail(
                  productAdoptModel: widget.adoptList[index],
                ),
              );
            },
            child: Card(
              elevation: 1.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.13,
                    width: MediaQuery.of(context).size.width * 0.40,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Image.asset(
                        'assets/images/spanduk_donasi.png', // Ganti dengan path gambar Anda
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.28,
                    width: MediaQuery.of(context).size.width * 0.40,
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                  Text(
                    "Save Earth with K-POPERS INDONESIA",
                    // isAdopt
                    //     ? widget.adoptModel!.name!
                    //     : widget.plantingModel!.name!,
                    // overflow: TextOverflow.ellipsis,
                    // softWrap: true,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "UKM Tani: Cempaka Foundatiion",
                    // isAdopt
                    //     ? widget.adoptModel!.name!
                    //     : widget.plantingModel!.name!,
                    // overflow: TextOverflow.ellipsis,
                    // softWrap: true,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                  ),
                  const SizedBox(height: 10),
                  LinearPercentIndicator(
                    width: 144.0,
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 13.0,
                    // leading: new Text("left content"),
                    // trailing: new Text("right content"),
                    percent: 0.2,
                    center: const Text(
                      "20.0%",
                      style: TextStyle(fontSize: 10),
                    ),
                    linearStrokeCap: LinearStrokeCap.butt,
                    progressColor: Colors.blue,
                  ),
                  const SizedBox(height: 15),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rp. 45,000',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                      ),
                      Text(
                        '151 hari lagi',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Pohon terkumpul",
                    // isAdopt
                    //     ? widget.adoptModel!.name!
                    //     : widget.plantingModel!.name!,
                    // overflow: TextOverflow.ellipsis,
                    // softWrap: true,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                  ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     Icon(
                        //       Icons.location_pin,
                        //       color: ColorManager.blue,
                        //     ),
                        //     Expanded(
                        //       child: Text(
                        //         widget.adoptList[index].location!,
                        //         style: Theme.of(context)
                        //             .textTheme
                        //             .bodyText2
                        //             ?.copyWith(
                        //               color: ColorManager.blue,
                        //             ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          growable: false,
        ),
      ),
    );
  }
}
