import 'package:cached_network_image/cached_network_image.dart';
import 'package:fetch_api/src/view/product_app/controller/product_controller.dart';
import 'package:fetch_api/src/view/product_app/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAppScreen extends StatefulWidget {
  ProductAppScreen({super.key});

  @override
  State<ProductAppScreen> createState() => _ProductAppScreenState();
}

class _ProductAppScreenState extends State<ProductAppScreen> {
  late final controller = Get.put(Produccontroller());
  List<ProductModel> listData = [];
  void getData() async {
    controller.getProoducts()!.then((value) {
      setState(() {
        listData = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Store App'),
        ),
        body: ListView.builder(
          itemCount: listData.length,
          itemBuilder: (context, index) => ExpansionTile(
            initiallyExpanded: true,
            trailing: IconButton(
                onPressed: () async {
                  // await Share.shareUri(
                  //   Uri.parse(listData[index].image),
                  // );
                },
                icon: const Icon(Icons.share)),
            title: Text(listData[index].title),
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: listData[index].image.toString(),
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                  value:
                                      downloadProgress.downloaded.toDouble())),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        listData[index].description,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '\$ ${listData[index].price}',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ));
  }
}
