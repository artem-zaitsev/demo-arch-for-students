import 'dart:ui';

import 'package:demo_app/src/di/container.dart';
import 'package:demo_app/src/modules/showroom/models/item.dart';
import 'package:flutter/material.dart';

import '../showroom/showroom_view_model.dart';

class ShowroomScreen extends StatefulWidget {
  const ShowroomScreen({Key? key}) : super(key: key);

  @override
  _ShowroomScreenState createState() => _ShowroomScreenState();
}

class _ShowroomScreenState extends State<ShowroomScreen> {
  late ShowroomViewModel _viewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _viewModel = ShowroomViewModel(
      context,
    );

    _viewModel.addListener(_rebuild);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Items'),
      ),
      body: Stack(
        children: [
          if (_viewModel.state == States.content)
            ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              itemCount: _viewModel.items.length,
              itemBuilder: (ctx, idx) {
                final item = _viewModel.items.toList()[idx];

                return ItemCard(
                  item: item,
                  onTap: _viewModel.orderItem,
                );
              },
            ),
          if (_viewModel.state == States.loading)
            Expanded(
              child: Container(
                color: Colors.white,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.removeListener(_rebuild);
    super.dispose();
  }

  void _rebuild() {
    setState(() {
      //emty for rebuild
    });
  }
}

class ItemCard extends StatelessWidget {
  final Item item;
  final void Function(Item) onTap;

  const ItemCard({
    Key? key,
    required this.item,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => onTap(item),
        child: Stack(
          children: [
            Image.network(
              item.url,
              height: 300,
              width: double.infinity,
              fit: BoxFit.fill,
              color: Colors.black.withOpacity(0.4),
              colorBlendMode: BlendMode.darken,
            ),
            Positioned(
              bottom: 0,
              left: 8,
              height: 50,
              child: Text(
                item.name,
                style: Theme.of(context)
                    .primaryTextTheme
                    .subtitle1
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
