import 'dart:ui';

import 'package:demo_app/src/di/container.dart';
import 'package:demo_app/src/modules/showroom/models/item.dart';
import 'package:flutter/material.dart';

import 'order_view_model.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  late OrderViewModel _viewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _viewModel = OrderViewModel(
      context,
      Di.instance.showroomService,
      Di.instance.profileRepository,
    );

    _viewModel.addListener(_rebuild);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Items'),
      ),
      body: Stack(
        children: [
          if (_viewModel.state == States.content)
            Form(
              key: _viewModel.formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _viewModel.nameController,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _viewModel.lastNameController,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _viewModel.emailController,
                    ),
                  ],
                ),
              ),
            ),
          if (_viewModel.state == States.content)
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Center(
                child: ElevatedButton(
                  onPressed: _viewModel.orderItem,
                  child: const Text('Заказать'),
                ),
              ),
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
