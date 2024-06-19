import 'package:flutter_svg/svg.dart';
import '../../login_imports.dart';

class CheckboxLabel extends StatefulWidget {
  final bool value;
  final String label;
  final double? textWith;
  final ValueChanged<bool> onChanged;
  final EdgeInsetsGeometry padding;

  const CheckboxLabel({
    super.key,
    required this.value,
    required this.label,
    required this.onChanged,
    this.padding = EdgeInsets.zero,
    this.textWith,
  });

  @override
  State<CheckboxLabel> createState() => _CheckboxLabelState();
}

class _CheckboxLabelState extends State<CheckboxLabel> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late bool value = widget.value;
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onChanged(!value);
        });
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: widget.padding,
            width: 24.0,
            height: 24.0,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF37C66D),
                  Color.fromRGBO(46, 165, 130, 1),
                ], // Cores do degradê
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(7.0),
              border: Border.all(
                color: const Color(0xFFD2D8D7),
                width: 1,
              ),
              color: value ? Colors.white : Colors.transparent,
            ),
            child: value
                ? Center(
                    child: SvgPicture.asset(
                      AppImageAssets.checkMark,
                      height: 9,
                      colorFilter: ColorFilter.mode(
                          context.theme.colorScheme.primaryWhite,
                          BlendMode.srcIn),
                    ),
                  )
                : null,
          ),
          SizedBox(
            width: widget.textWith,
            child: Text(widget.label,
                style: context.theme.textTheme.smallGreyTextStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFontFamily.dmSansRegular,
                    color: const Color.fromARGB(255, 25, 25, 25))),
          )
        ],
      ),
    );
  }
}
