import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../core/images/images.dart';
import '../../../data/model/products/productsModel.dart';

class HomeState {

  bool isTest = true;

  InterstitialAd? interstitialAd;
  BannerAd? bannerAd;

  int indexChosen = 0;
  List<bool> iconfavorite = [];
  List<bool> iconLap = [];
  List<bool> iconWatch = [];
  List<bool> iconAirpods = [];
  List<bool> iconPhone = [];
  List<bool> iconPc = [];
  List<bool> iconTv = [];
  List<Map> suggested          = [];
  List<ProductModel> favorites = [];

  static List<ProductModel> home = [
    ProductModel(name: "Pc Gaming", image: Images.pcA, data: "Cpu core i9-13800  3.91 GHz 4.6 GHz\n RAM 32 GB \n SSD 4TB \n GPU GTX 5060 12GB", salary: 2000),
    ProductModel(name: "Mac 14 pro", image: Images.labA, data: "Cpu core i9-13800  3.91 GHz 4.6 GHz\n RAM 32 GB \n SSD 4TB \n GPU GTX 5060 2GB", salary: 5000),
    ProductModel(name: "Samsung TV smart curve", image: Images.tvA, data: "Screen Size	60 Inches\n"
        "Brand Name	SAMSUNG\n"
        "Supported Internet Services	Netflix, Amazon Instant Video, YouTube\n"
        "Display Technology	LED\n"
        "Item Dimensions D x W x H	17D x 91.7W x 55.2H centimeters\n"
        "Resolution	1080p\n"
        "Model Name	UA40T5300AUXEG\n"
        "Connectivity Technology	AUX\n"
        "Color	Black\n"
        "Mounting Type	Table Mount", salary: 2500),
    ProductModel(name: "Apple WATCH 2", image: Images.watchA, data: "42 mm Smartwatch, \n"
        "Durable Battery Life, All-Day SpO2 Monitoring,\n"
        "Accurate Heart Rate Monitoring,100+ Workout Modes,\n"
        "Bluetooth Calling, Black", salary: 1000),
    ProductModel(name: "Airpods G2", image: Images.airpodsC, data: "Spatial Audio takes immersion to a remarkably personal level.\n"
        "Touch control lets you adjust volume with a swipe.\n"
        "And a leap in Power delivers 6 hours of battery life from a single charge.\n", salary: 110),
    ProductModel(name: "Pc Hewuai", image: Images.pcD, data: "Cpu core i3-13800  2.41 GHz 2.9 GHz\n RAM 12 GB \n SSD 1TB \n GPU GTX 5060 4GB", salary: 500),
  ];
  static List<ProductModel> pc = [
    ProductModel(name: "Pc Gaming", image: Images.pcA, data: "Cpu core i9-13800  3.91 GHz 4.6 GHz\n RAM 32 GB \n SSD 4TB \n GPU GTX 5060 12GB", salary: 2000),
    ProductModel(name: "Pc Hewuai", image: Images.pcB, data: "Cpu core i7-13800  2.41 GHz 2.9 GHz\n RAM 12 GB \n SSD 1TB \n GPU GTX 5060 4GB", salary: 500),
    ProductModel(name: "Pc Samsung", image: Images.pcC, data: "Cpu core i5-13800  2.41 GHz 2.9 GHz\n RAM 12 GB \n SSD 1TB \n GPU GTX 5060 4GB", salary: 500),
    ProductModel(name: "Pc Ausus", image: Images.pcD, data: "Cpu core i3-13800  2.41 GHz 2.9 GHz\n RAM 12 GB \n SSD 1TB \n GPU GTX 5060 4GB", salary: 500),
  ];
  static List<ProductModel> lap = [
    ProductModel(name: "Mac 14 pro", image: Images.labA, data: "Cpu core i9-13800  3.91 GHz 4.6 GHz\n RAM 32 GB \n SSD 4TB \n GPU GTX 5060 2GB", salary: 5000),
    ProductModel(name: "Huawei", image: Images.labB, data: "Cpu core i7-13800  3.91 GHz 4.6 GHz\n RAM 20 GB \n SSD 2TB \n GPU GTX 5060 4GB", salary: 3000),
    ProductModel(name: "hp", image: Images.labC, data: "Cpu core i5-13800  2.91 GHz 3.6 GHz\n RAM 16 GB \n SSD 1TB \n GPU GTX 5060 2GB", salary: 2000),
    ProductModel(name: "DELL", image: Images.labD, data: "Cpu core i3-13800  2.91 GHz 3.6 GHz\n RAM 12 GB \n SSD 1TB \n GPU GTX 5060 2GB", salary: 1000),
  ];
  static List<ProductModel> phone = [
    ProductModel(name: "I Phone 15 Pro Max", image: Images.phoneA, data: "Apple A15 Bionic\n6 GB RAM\n"
        "Display6.7 inches, OLED120 Hz Refresh Rate\n"
        "Camera12 MP + 12 MP + 12 MP\nTriple Primary CamerasDual LED Flash12 MP Front Camera\n"
        "Battery4400 mAhFast ChargingLightning Port", salary: 2000),
    ProductModel(name: "Z Fold 3", image: Images.phoneB, data: "12 GB RAM | 256 GB ROM\n"
        "17.27 cm (6.8 inch) Quad HD+ Display\n"
        "200MP + 10MP + 12MP + 10MP | 12MP Front Camera\n"
        "5000 mAh Lithium Ion Battery\n"
        "Qualcomm Snapdragon 8 Gen 2 Processor\n", salary: 1900),
    ProductModel(name: "Mi Mix 14", image: Images.phoneC, data: "12 GB RAM | 256 GB ROM\n"
        "13.27 cm (6.8 inch) Quad HD+ Display\n"
        "200MP + 10MP + 10MP + 8MP | 24MP Front Camera\n"
        "6000 mAh Lithium Ion Battery\n"
        "Qualcomm Snapdragon 6 Gen 2 Processor\n", salary: 1500),
    ProductModel(name: "OPPO Reno 10", image: Images.phoneD, data: "12 GB RAM | 256 GB ROM\n"
        "13.27 cm (6.8 inch) Quad HD+ Display\n"
        "200MP + 10MP + 10MP + 8MP | 24MP Front Camera\n"
        "6000 mAh Lithium Ion Battery\n"
        "Qualcomm Snapdragon 6 Gen 2 Processor\n", salary: 1300),
  ];
  static List<ProductModel> tv = [
    ProductModel(name: "Samsung TV smart curve", image: Images.tvA, data: "Screen Size	60 Inches\n"
        "Brand Name	SAMSUNG\n"
        "Supported Internet Services	Netflix, Amazon Instant Video, YouTube\n"
        "Display Technology	LED\n"
        "Item Dimensions D x W x H	17D x 91.7W x 55.2H centimeters\n"
        "Resolution	1080p\n"
        "Model Name	UA40T5300AUXEG\n"
        "Connectivity Technology	AUX\n"
        "Color	Black\n"
        "Mounting Type	Table Mount", salary: 2500),
    ProductModel(name: "Samsung TV smart", image: Images.tvB, data: "Screen Size	42 Inches\n"
        "Brand Name	SAMSUNG\n"
        "Supported Internet Services	Netflix, Amazon Instant Video, YouTube\n"
        "Display Technology	LED\n"
        "Item Dimensions D x W x H	17D x 91.7W x 55.2H centimeters\n"
        "Resolution	1080p\n"
        "Model Name	UA40T5300AUXEG\n"
        "Color	Black\n", salary: 2000),
    ProductModel(name: "Sony TV smart curve", image: Images.tvC, data: "Screen Size	40 Inches\n"
        "Brand Name	SAMSUNG\n"
        "Supported Internet Services	Netflix, Amazon Instant Video, YouTube\n"
        "Display Technology	LED\n"
        "Item Dimensions D x W x H	17D x 91.7W x 55.2H centimeters\n"
        "Resolution	1080p\n"
        "Model Name	UA40T5300AUXEG\n"
        "Connectivity Technology	AUX\n"
        "Color	Black\n"
        "Mounting Type	Table Mount", salary: 1500),
    ProductModel(name: "LG TV smart curve", image: Images.tvD, data: "Screen Size	32 Inches\n"
        "Display Technology	LED\n"
        "Item Dimensions D x W x H	17D x 91.7W x 55.2H centimeters\n"
        "Resolution	1080p\n"
        "Model Name	UA40T5300AUXEG\n"
        "Connectivity Technology	AUX\n"
        "Color	Black\n", salary: 1000),
  ];
  static List<ProductModel> watch = [
    ProductModel(name: "HUAWEI WATCH GT 3", image: Images.watchB, data: "42 mm Smartwatch,\n "
        "Durable Battery Life, All-Day SpO2 Monitoring,\n"
        "Accurate Heart Rate Monitoring,100+ Workout Modes,\n"
        "Bluetooth Calling, Gold", salary: 800),
    ProductModel(name: "Apple WATCH 2", image: Images.watchA, data: "42 mm Smartwatch, \n"
        "Durable Battery Life, All-Day SpO2 Monitoring,\n"
        "Accurate Heart Rate Monitoring,100+ Workout Modes,\n"
        "Bluetooth Calling, Black", salary: 1000),
    ProductModel(name: "Samsung Watch S3", image: Images.watchC, data: "42 mm Smartwatch, \n"
        "Durable Battery Life, All-Day SpO2 Monitoring,\n"
        "Accurate Heart Rate Monitoring,100+ Workout Modes,\n"
        "Bluetooth Calling, Gold", salary: 500),
    ProductModel(name: "Mi Watch", image: Images.watchD, data: "42 mm Smartwatch, \n"
        "Durable Battery Life, All-Day SpO2 Monitoring,\n"
        "Accurate Heart Rate Monitoring,100+ Workout Modes,\n"
        "Bluetooth Calling, Gold", salary: 300),
  ];
  static List<ProductModel> airpods = [
    ProductModel(name: "Apple Airpods Pro", image: Images.airpodsA, data: "Up to 2x more Active Noise Cancellation than the previous generation.\n"
        "Spatial Audio takes immersion to a remarkably personal level.\n"
        "Touch control lets you adjust volume with a swipe.\n"
        "And a leap in Power delivers 6 hours of battery life from a single charge.\n", salary: 200),
    ProductModel(name: "Apple Airpods 2", image: Images.airpodsB, data: "Up to 2x more Active Noise Cancellation than the previous generation.\n"
        "Spatial Audio takes immersion to a remarkably personal level.\n"
        "Touch control lets you adjust volume with a swipe.\n"
        "And a leap in Power delivers 6 hours of battery life from a single charge.\n", salary: 170),
    ProductModel(name: "Airpods G2", image: Images.airpodsC, data: "Spatial Audio takes immersion to a remarkably personal level.\n"
        "Touch control lets you adjust volume with a swipe.\n"
        "And a leap in Power delivers 6 hours of battery life from a single charge.\n", salary: 110),
    ProductModel(name: "OPPO Airpods 4", image: Images.airpodsD, data: "Spatial Audio takes immersion to a remarkably personal level.\n"
        "Touch control lets you adjust volume with a swipe.\n"
        "And a leap in Power delivers 6 hours of battery life from a single charge.\n", salary: 90),
  ];

  List<ProductModel> displayList = List.from(home);
  List<ProductModel> pcList = List.from(pc);
  List<ProductModel> lapList = List.from(lap);
  List<ProductModel> phoneList = List.from(phone);
  List<ProductModel> tvList = List.from(tv);
  List<ProductModel> watchList = List.from(watch);
  List<ProductModel> airpodsList = List.from(airpods);

}
