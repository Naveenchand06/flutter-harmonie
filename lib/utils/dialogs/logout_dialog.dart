import 'package:flutter/foundation.dart';
import 'package:music_player/utils/constants/app_strings.dart';
import 'package:music_player/utils/dialogs/models/alert_dialog_model.dart';

@immutable
class LogoutDialog extends AlertDialogModel<bool> {
  const LogoutDialog()
      : super(
          title: AppStrings.confirmation,
          message: AppStrings.areYouSure,
          buttons: const {
            "No": false,
            "Yes": true,
          },
        );
}
