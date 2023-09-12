import 'package:get/get.dart';
import 'package:work_graduate/api/api_data.dart';
import 'package:work_graduate/models/Service.dart';

class ServiceController extends GetxController{
  final ServiceApiController _productsApiController = ServiceApiController();
  List<Service> servicedata = <Service>[].obs;
  var isLoading = true.obs;

  static ServiceController get to => Get.find();

  @override
  void onInit() {
    getServices();
    super.onInit();
  }

  void getServices() async {
    var services = await _productsApiController.getService();

    try{
      isLoading(true);
      if (services!.isNotEmpty) {
        servicedata.addAll(services);
      }
    }
    finally {
      isLoading(false);
    }
  }
}