import 'package:fluent_ui/fluent_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mine_field/interface/screen/panes/settings/settings_controller.dart';

class SettingsPane extends HookConsumerWidget {
  const SettingsPane({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldPage(
      content: Column(
        children: [
          Text(
            'Configurações',
            style: FluentTheme.of(context).typography.title,
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Dificuldade',
            style: FluentTheme.of(context).typography.bodyStrong,
          ),
          Text(
            ref.watch(dificultLabelProvider),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Fácil',
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                constraints: const BoxConstraints(maxWidth: 250),
                child: Slider(
                  vertical: false,
                  min: 0,
                  max: 4,
                  divisions: 4,
                  value: ref.watch(dificultValueProvider),
                  onChanged: (value) {
                    ref.read(dificultValueProvider.notifier).state = value;
                  },
                ),
              ),
              const Text('Difícil'),
            ],
          ),
        ],
      ),
    );
  }
}
