import 'package:task_app/core/common/exports.dart';

void kBottomSheet({
  required BuildContext context,
  required String title,
  Widget? child,
  double? height,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Ensures the bottom sheet can resize properly
    builder: (context) {
      return Container(
        height: height ?? 0.5.sh,
        padding: EdgeInsets.symmetric(
          vertical: 0.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.r),
            topRight: Radius.circular(50.r),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 30.h,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Text(
                    title,
                    style: AllTextStyle.f20W8.copyWith(
                      color: PrimitiveColors.grey0,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  child ?? const SizedBox(),
                ],
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              top: -28,
              child: SizedBox(
                child: Container(
                  height: 40.h,
                  width: 40.h,
                  margin: EdgeInsets.symmetric(horizontal: 1.sw / 2 - 60),
                  decoration: BoxDecoration(
                    color: const Color(0xFF383751),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
