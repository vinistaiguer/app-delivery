import 'package:app_chat/src/authentication/components/register_delivery_person.dart';
import 'package:flutter/material.dart';

import '../../shared/components/input_field.dart';
import '../../shared/utils/get_zip_code.dart';

class RegisterDeliveryPersonPage extends StatefulWidget {
  const RegisterDeliveryPersonPage({super.key});

  @override
  RegisterDeliveryPersonPageState createState() =>
      RegisterDeliveryPersonPageState();
}

class RegisterDeliveryPersonPageState
    extends State<RegisterDeliveryPersonPage> {
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
          const RegisterDeliveryPerson(title: 'Cadastro para entregador'),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputField(
                  controller: TextEditingController(),
                  labelText: 'Nome Completo',
                ),
                const SizedBox(height: 16),
                InputField(
                  controller: TextEditingController(),
                  labelText: 'E-mail',
                ),
                const SizedBox(height: 16),
                InputField(
                  controller: TextEditingController(),
                  labelText: 'Telefone',
                ),
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
                            ? TextEditingController(text: 'Número')
                            : _numberController,
                        labelText: 'Número',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 4,
                      child: InputField(
                        controller: _complementController.text.isEmpty
                            ? TextEditingController(text: 'Complemento')
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
                  bottom: -40,
                  left: -30,
                  child: SizedBox(
                    height: 280,
                    width: 280,
                    child: Image.asset(
                      'assets/helmetLeft.png',
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
