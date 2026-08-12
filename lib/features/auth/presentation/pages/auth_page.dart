part of '_pages.dart';

/// Combined login/sign-up screen — toggles between the two forms in
/// place rather than being two separate routes, matching the WBS's
/// "Belum punya akun? Daftar" secondary action.
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isSignUp = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _requiredValidator(String? value) {
    return (value == null || value.trim().isEmpty) ? 'Wajib diisi' : null;
  }

  void _submit(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;
    final cubit = context.read<AuthCubit>();
    if (_isSignUp) {
      cubit.registerPatient(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
    } else {
      cubit.login(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(repository: context.read()),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              switch (state) {
                case AuthLoginSuccess(:final patient):
                  context.go(
                    patient.isConnectedToPhysiotherapist ? '/' : '/connect',
                  );
                case AuthRegisterSuccess():
                  context.go('/connect');
                case AuthFailureState(:final message):
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: BaseColors.error,
                    ),
                  );
                case AuthInitial() || AuthLoading():
                  break;
              }
            },
            builder: (context, state) {
              final isLoading = state is AuthLoading;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/fisiomate-full.svg',
                        height: 36,
                      ),
                      const SizedBox(height: 40),
                      Text(
                        _isSignUp
                            ? 'Buat Akun FisioMate'
                            : 'Selamat Datang di FisioMate',
                        style: FontTheme.headlineLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _isSignUp
                            ? 'Daftar untuk memulai perjalanan rehabilitasi Anda.'
                            : 'Masuk untuk melanjutkan perjalanan rehabilitasi Anda.',
                        style: FontTheme.bodyMedium.copyWith(
                          color: BaseColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 32),
                      if (_isSignUp) ...[
                        MainTextField(
                          key: const ValueKey('name'),
                          label: 'Nama Lengkap',
                          controller: _nameController,
                          validator: _requiredValidator,
                        ),
                        const SizedBox(height: 16),
                      ],
                      MainTextField(
                        key: const ValueKey('email'),
                        label: 'Email',
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: _requiredValidator,
                      ),
                      const SizedBox(height: 16),
                      MainTextField(
                        key: const ValueKey('password'),
                        label: 'Password',
                        controller: _passwordController,
                        obscureText: true,
                        validator: _requiredValidator,
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: MainButton(
                          label: isLoading
                              ? 'Memuat...'
                              : (_isSignUp ? 'Buat Akun' : 'Masuk'),
                          onPressed: isLoading ? null : () => _submit(context),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: TextButton(
                          onPressed: isLoading
                              ? null
                              : () => setState(() => _isSignUp = !_isSignUp),
                          child: Text.rich(
                            TextSpan(
                              text: _isSignUp
                                  ? 'Sudah punya akun? '
                                  : 'Belum punya akun? ',
                              style: FontTheme.bodyMedium.copyWith(
                                color: BaseColors.textSecondary,
                              ),
                              children: [
                                TextSpan(
                                  text: _isSignUp ? 'Masuk' : 'Daftar',
                                  style: FontTheme.bodyMedium.copyWith(
                                    color: BaseColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
