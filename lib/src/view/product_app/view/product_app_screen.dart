import 'package:cached_network_image/cached_network_image.dart';
import 'package:fetch_api/src/view/product_app/controller/product_controller.dart';
import 'package:fetch_api/src/view/product_app/widget/shrimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ProductAppScreen extends GetView<Produccontroller> {
  ProductAppScreen({super.key});

  late final controller = Get.put(Produccontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Store App'),
      ),
      body: controller.obx(
          (state) => ListView.builder(
                itemCount: state!.length,
                itemBuilder: (context, index) => ExpansionTile(
                  initiallyExpanded: true,
                  trailing: IconButton(
                      onPressed: () async {
                        // Share.share('check out my website https://example.com',
                        //     subject: 'Look what I made!');
                      },
                      icon: const Icon(Icons.share)),
                  title: Text(state[index].title),
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
                            imageUrl: state[index].image.toString(),
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                                    child: CircularProgressIndicator(
                              value: downloadProgress.downloaded.toDouble(),
                            )),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              state[index].description,
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
                        '\$ ${state[index].price}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
          onLoading: buildProductShrimmer()),
    );
  }

  Widget buildProductShrimmer() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(255, 230, 229, 229)),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: ShimmerLoadingWidget(
                            height: 40,
                            width: double.infinity,
                            shapeBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)))
                        .rectangular(),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerLoadingWidget(
                              height: 150,
                              width: 150,
                              shapeBorder: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)))
                          .rectangular(),
                      Flexible(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: ShimmerLoadingWidget(
                                        height: 20,
                                        width: double.infinity,
                                        shapeBorder: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4)))
                                    .rectangular(),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: ShimmerLoadingWidget(
                                        height: 20,
                                        width: double.infinity,
                                        shapeBorder: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4)))
                                    .rectangular(),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: ShimmerLoadingWidget(
                                        height: 20,
                                        width: double.infinity,
                                        shapeBorder: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4)))
                                    .rectangular(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: ShimmerLoadingWidget(
                            height: 20,
                            width: 150,
                            shapeBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)))
                        .rectangular(),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
