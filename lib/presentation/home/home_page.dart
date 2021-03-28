import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intera/presentation/home/home_controller.dart';
import 'package:intera/shared/settings.dart';
import '../../shared/extensions/screen_util_extension.dart';
import 'components/components.dart';
import 'components/tab_bar/tab_bar.dart';
import 'components/tab_bar/tab_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final HomeController controller = Get.find();

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(logout: controller.logout),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 24.height,
        ),
        onPressed: () {},
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Settings.exibirTotalDeInteras.value == true
                  ? Padding(
                      padding: EdgeInsets.only(
                        left: 20.width,
                        right: 20.width,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TotalOfInteras(total: controller.totalDasInteras)
                        ],
                      ),
                    )
                  : SizedBox(),
            ),
            TabBarComponent(tabController),
            TabViewComponent(
              tabController: tabController,
              interas: controller.interas,
            ),
          ],
        ),
      ),
    );
  }
}
