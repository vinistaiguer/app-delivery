import 'package:app_chat/src/shared/utils/get_zip_code.dart';
import 'package:flutter/material.dart';

import '../../shared/components/input_field.dart';
import '../components/register_header.dart';

class AddressRegisterPage extends StatefulWidget {
  const AddressRegisterPage({super.key});

  @override
  AddressRegisterPageState createState() => AddressRegisterPageState();
}

class AddressRegisterPageState extends State<AddressRegisterPage> {
  final TextEditingController _controller = TextEditingController();

  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _neighborhoodController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _complementController = TextEditingController();

  final GetZipCode zipCodeGetter = GetZipCode();
  final TextEditingController _cepController = TextEditingController();
  

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const RegisterHeader(title: 'Endereço'),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _cepController,
                  decoration: const InputDecoration(
                      labelText: 'CEP',
                      contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0)),
                  onSubmitted: (text) {
                    String cep = _cepController.text.trim();
                    zipCodeGetter.getZipCode(
                      cep,
                      _stateController,
                      _cityController,
                      _neighborhoodController,
                      _addressController,
                      _numberController,
                      _complementController,
                    );
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: InputField(
                        controller: _stateController,
                        labelText: 'UF',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 4,
                      child: InputField(
                        controller: _cityController,
                        labelText: 'Cidade',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                InputField(
                  controller: _neighborhoodController,
                  labelText: 'Bairro',
                ),
                const SizedBox(height: 16),
                InputField(
                  controller: _addressController,
                  labelText: 'Endereço',
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: InputField(
                        controller: _numberController.text.isEmpty
                            ? TextEditingController()
                            : _numberController,
                        labelText: 'Número',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 4,
                      child: InputField(
                        controller: _complementController.text.isEmpty
                            ? TextEditingController()
                            : _complementController,
                        labelText: 'Complemento',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 210,
            child: Stack(
              children: [
                Positioned(
                  bottom: 16,
                  left: -10,
                  child: SizedBox(
                    height: 280,
                    width: 280,
                    child: Image.asset(
                      'assets/whiskyHand2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16, top: 70),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Salvar',
                          style: Theme.of(context).textTheme.labelLarge),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
