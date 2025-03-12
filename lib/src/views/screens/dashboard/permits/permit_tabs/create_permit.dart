import 'package:colab/core/utils/constants/text_constant.dart';
import 'package:colab/src/controllers/permits_controller.dart';
import 'package:colab/src/views/widgets/create_permit_ui_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';


class CreatePermit extends StatefulWidget {
  const CreatePermit({super.key});

  @override
  State<CreatePermit> createState() => _CreatePermitState();
}

class _CreatePermitState extends State<CreatePermit> {
  final permitController = Get.find<PermitsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios)),
          title: Text(
            TextConstant.createPermit,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        body: ListView.builder(
            itemCount: permitController.permitDataList.length,
            itemBuilder: (context, index) {
              final data = permitController.permitDataList[index];
              return CreatePermitUiWidget(data: data);
            }));
  }
}
