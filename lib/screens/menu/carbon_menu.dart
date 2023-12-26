import 'package:new_bumi_baik/models/carbon_and_tree_model.dart';
import 'package:new_bumi_baik/models/carbon_model.dart';
import 'package:new_bumi_baik/models/tree_model.dart';
import 'package:new_bumi_baik/models/user_model.dart';
import 'package:new_bumi_baik/services/carbon_service.dart';
import 'package:new_bumi_baik/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:intl/intl.dart';

import '../../models/detail_distribute_trees_respone_model.dart';
import '../../resources/color_manager.dart';
import '../../services/detail_distribute_trees_service.dart';
import 'package:url_launcher/url_launcher.dart';

class CarbonMenu extends StatefulWidget {
  // UserModel userModel;
  // CarbonMenu({required this.userModel, Key? key}) : super(key: key);
  const CarbonMenu({super.key});
  @override
  State<CarbonMenu> createState() => _CarbonMenuState();
}

class _CarbonMenuState extends State<CarbonMenu> {
  DetailDistributeTreesRespone detail = DetailDistributeTreesRespone();
  // Completer<GoogleMapController> _controller = Completer();

  // static final CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );

  // static final CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    detail = await DetailDistributeTreesService().getDetail();
    // setState(() {});
    print(detail.data!.corporateTreeDistributionImage ?? "gak ada");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              "Pohon Kamu",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          InteractiveViewer(
              child: Image.network(
                  detail.data!.corporateTreeDistributionImage ?? "")),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: FloatingActionButton.extended(
          backgroundColor: ColorManager.primary,
          //onPressed: _goToTheLake,
          onPressed: () {
            launchUrl(
              Uri.parse(detail.data!.corporateTreeDistributionDocument ?? ""),
              mode: LaunchMode.externalApplication,
            );
          },
          label: const Text('Data Detail Project '),
          icon: const Icon(
            FontAwesomeIcons.mapPin,
          ),
        ),
      ),
    );
  }

  buildAppbar() {
    return AppBar(
      elevation: 1,
      toolbarHeight: MediaQuery.of(context).size.height * 0.54,
      backgroundColor: Colors.white,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                width: MediaQuery.of(context).size.width * 0.4,
                image: const AssetImage('assets/images/logo_1.png'),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              const Text(
                'Offset Karbon',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              Text(
                // ignore: prefer_interpolation_to_compose_strings
                "Total Jejak Karbon Dalam Project Penanaman adalah " +
                    (carbon == null ? "-" : carbon!.emision!.toString()) +
                    " Kg ",
                style: const TextStyle(color: Colors.black),
              ),
              // SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              const Center(
                  // child: SizedBox(
                  //   width: MediaQuery.of(context).size.width,
                  //   height: MediaQuery.of(context).size.height * 0.15,
                  // child: LiquidLinearProgressIndicator(
                  //   value: carbon == null
                  //       ? 0
                  //       : carbon!.offset == null
                  //           ? 0
                  //           : carbon!.offset! / 100, // Defaults to 0.5.
                  //   valueColor: AlwaysStoppedAnimation(ColorManager
                  //       .primary), // Defaults to the current Theme's accentColor.
                  //   backgroundColor: Colors.grey[
                  //       700], // Defaults to the current Theme's backgroundColor.
                  //   borderColor: Colors.grey[700]!,
                  //   borderWidth: 5.0,
                  //   borderRadius: 12.0,
                  //   direction: Axis
                  //       .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                  //   center: Text(
                  //     carbon == null
                  //         ? "0%"
                  //         : carbon!.offset == null
                  //             ? "0%"
                  //             : "${carbon!.offset!.toStringAsFixed(0)}%",
                  //     style: const TextStyle(
                  //       color: Colors.white,
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 20,
                  //     ),
                  //   ),
                  // ),
                  // ),
                  ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              // Text(
              //   carbon == null
              //       ? "Pelunasan karbon kamu masi 0% dalam setahun terakhir"
              //       : carbon!.offset == null
              //           ? "Pelunasan karbon kamu masi 0% dalam setahun terakhir"
              //           : "Pelunasan karbon kamu telah mencapai ${carbon!.offset!}% dari total jejak karbon dalam setahun terakhir",
              //   style: const TextStyle(color: Colors.black),
              // ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              Text(
                carbon == null
                    ? ""
                    : "Tanggal perhitungan jejak karbon terakhir ${DateFormat.yMMMEd('id_ID').format(carbon!.lastCalculate!)}",
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
