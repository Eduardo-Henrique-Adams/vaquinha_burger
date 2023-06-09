import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';
import 'package:vaquinha_burguer/app/core/ui/styles/text_styles.dart';
import 'package:vaquinha_burguer/app/pages/auth/register/register_controller.dart';
import 'package:vaquinha_burguer/app/pages/auth/register/register_state.dart';

import '../../../core/ui/base_state/base_state.dart';
import '../../../core/ui/widgets/delivery_appbar.dart';
import '../../../core/ui/widgets/delivery_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();

  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterController, RegisterState>(
      listener: (context, state) {
        state.status.matchAny(
            any: () => hideLoader(),
            register: () => showLoader(),
            error: () {
              hideLoader();
              showError('Erro ao registrar usuario');
            },
            success: () {
              hideLoader();
              showSuccess('Cadastro realizado com sucesso');
              Navigator.pop(context);
            });
      },
      child: Scaffold(
        appBar: DeliveryAppbar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cadastro",
                    style: context.textStyles.textTitle,
                  ),
                  Text(
                    'Preencha os campos abaixo para criar o seu cadastro',
                    style: context.textStyles.textMedium.copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Nome'),
                    controller: _nameEC,
                    validator: Validatorless.required('Nome obrigatorio'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'E-mail'),
                    controller: _emailEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('E-mail obrigatorio'),
                      Validatorless.email('E-mail invalido')
                    ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Senha'),
                    controller: _passwordEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha obrigatoria'),
                      Validatorless.min(
                          6, 'Senha deve conter pelo menos 6 caracteres')
                    ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration:
                        const InputDecoration(labelText: 'Confirma senha'),
                    validator: Validatorless.multiple([
                      Validatorless.required('Confirma senha obrigatoria'),
                      Validatorless.compare(
                          _passwordEC, 'Senha diferente de confirma senha')
                    ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: DeliveryButton(
                      onPressed: () {
                        final valid =
                            _formKey.currentState?.validate() ?? false;
                        if (valid) {
                          controller.register(
                            _nameEC.text,
                            _emailEC.text,
                            _passwordEC.text,
                          );
                        }
                      },
                      label: 'Cadastrar',
                      width: double.infinity,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
