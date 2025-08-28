import 'package:flutter/material.dart';
import 'package:password_validation/src/shared/colors_app.dart';
import 'package:google_fonts/google_fonts.dart';

enum PasswordValidationButtonVariant { approved, rejected }

class PasswordValidationButton extends StatelessWidget {
  final PasswordValidationButtonVariant variant;

  const PasswordValidationButton({super.key, required this.variant});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: 48.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: switch (variant) {
            PasswordValidationButtonVariant.approved => primaryColor,
            PasswordValidationButtonVariant.rejected => redColor,
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: () {},
        child: Text(
          switch (variant) {
            PasswordValidationButtonVariant.approved => 'SENHA APROVADA',
            PasswordValidationButtonVariant.rejected => 'SENHA REPROVADA',
          },
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17.0,
          ),
        ),
      ),
    );
  }
}
