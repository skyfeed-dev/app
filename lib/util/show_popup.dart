import 'package:skyfeed/app.dart';

void showPopup(BuildContext context, Function buildItems) {
  final RenderBox renderBox = context.findRenderObject() as RenderBox;

  final offset = renderBox.localToGlobal(Offset.zero);
  final left = offset.dx;
  final top = offset.dy + renderBox.size.height;
  final right = left + renderBox.size.width;
  showMenu(
    context: context,
    position: RelativeRect.fromLTRB(left, top, right, 0.0),
    items: buildItems(context),
  );
}
