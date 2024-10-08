import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';
import 'package:parsonskellogg/core/string_utils/string_utils.dart';
import 'package:parsonskellogg/provider/dashboard_provider.dart';

class DashboardMapWidget extends StatelessWidget {
  const DashboardMapWidget({super.key,required this.provider});

  final DashboardProvider provider;
  @override
  Widget build(BuildContext context) {


    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: ten, top: ten),
          child: commonText(
              fontSize: fourteen,
              fontWeight: FontWeight.w600,
              text: orderByStatus),
        ),

        const Divider(
          thickness: zero3,
        ),
        Expanded(
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: provider.center,
              zoom: twelve,
            ),

            onMapCreated: (controller) {
              provider.updateMapController(controller);
            },
            markers: provider.markers,
            onTap: (LatLng position) {
              provider.addMarker(position);
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: ten,horizontal: ten),

          child: Row(
            children: [
              commonText(text: "0",),
              const SizedBox(width: ten,),
              const Expanded(
                child: SizedBox(
                  height: fifteen,

                  child: LinearProgressIndicator(
                    value: 1,
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xffA5CDFE)),
                    backgroundColor: Color(0xffD6D6D6),
                  ),
                ),

              ),
              const SizedBox(width: ten,),
              commonText(text: "1,926,739"),
            ],
          ),
        )
      ],
    );
  }
}
