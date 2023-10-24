import 'package:check_in_app/index.dart';

class ElevatedButtonCust extends StatelessWidget {
  const ElevatedButtonCust({
    Key? key,
    this.tit,
    this.onNavigator,
    this.btnHigh,
    this.borderColor = Colors.white,
    this.btnColor = Colors.white,
    this.textColor = Colors.white,
    this.iconColor = Colors.white,
  }) : super(key: key);
  final String? tit;
  final double? btnHigh;
  final Color? borderColor;
  final Color? btnColor;
  final Color? textColor;
  final Color? iconColor;
  final void Function()? onNavigator;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: btnHigh,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: borderColor!,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          minimumSize: Size(MediaQuery.of(context).size.width, btnHigh!),
          elevation: 0,
        ),
        onPressed: onNavigator,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              LucideIcons.logIn,
              color: iconColor!,
            ),
            const SizedBox(
              width: 7,
            ),
            Text(
              tit!,
              style: TextStyle(
                color: textColor!,
                fontSize: 17,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
