import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'set_tabindex_notifier.g.dart';

@riverpod
class SetIndexPage extends _$SetIndexPage {
  @override
  int build() {
    return 0;
  }

  void setIndexPage(int index) {
    state = index;
  }
}
