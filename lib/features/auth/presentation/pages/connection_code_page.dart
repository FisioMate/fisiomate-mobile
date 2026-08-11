part of '_pages.dart';

class ConnectionCodePage extends StatefulWidget {
  const ConnectionCodePage({super.key});

  @override
  State<ConnectionCodePage> createState() => _ConnectionCodePageState();
}

class _ConnectionCodePageState extends State<ConnectionCodePage> {
  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConnectionCodeCubit(repository: context.read()),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<ConnectionCodeCubit, ConnectionCodeState>(
            listener: (context, state) {
              switch (state) {
                case ConnectionCodeSuccess():
                  context.go('/');
                case ConnectionCodeFailureState(:final message):
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: BaseColors.error,
                    ),
                  );
                case ConnectionCodeInitial() || ConnectionCodeLoading():
                  break;
              }
            },
            builder: (context, state) {
              final isLoading = state is ConnectionCodeLoading;

              return Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hubungkan dengan Fisioterapis Anda.',
                        style: FontTheme.headlineLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Masukkan kode yang diberikan oleh fisioterapis Anda '
                        'untuk menghubungkan akun FisioMate Anda.',
                        style: FontTheme.bodyMedium.copyWith(
                          color: BaseColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 32),
                      MainTextField(
                        label: 'Kode Koneksi',
                        hintText: 'Masukkan kode koneksi',
                        controller: _codeController,
                        textCapitalization: TextCapitalization.characters,
                        validator: (value) => (value == null || value.trim().isEmpty)
                            ? 'Kode koneksi wajib diisi'
                            : null,
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: MainButton(
                          label: isLoading ? 'Menghubungkan...' : 'Hubungkan',
                          onPressed: isLoading
                              ? null
                              : () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<ConnectionCodeCubit>().connect(
                                      _codeController.text.trim(),
                                    );
                                  }
                                },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: Text(
                          'Belum mendapatkan kode? Hubungi fisioterapis Anda.',
                          textAlign: TextAlign.center,
                          style: FontTheme.bodySmall.copyWith(
                            color: BaseColors.textSecondary,
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
