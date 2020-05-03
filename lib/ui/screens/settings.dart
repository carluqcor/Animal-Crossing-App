import 'package:ACApp/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:system_setting/system_setting.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../../providers/index.dart';
import '../widgets/index.dart';

/// Here lays all available options for the user to configurate.
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Settings indexes
  Themes _themeIndex;

  @override
  void initState() {
    // Get the app theme & image quality from the 'AppModel' model.
    _themeIndex = context.read<ThemeProvider>().theme;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimplePage(
      title: FlutterI18n.translate(context, 'app.menu.settings'),
      body: ListView(
        children: <Widget>[
          HeaderText(FlutterI18n.translate(
            context,
            'settings.headers.general',
          )),
          ListCell.icon(
            icon: Ionicons.ios_color_filter,
            title: FlutterI18n.translate(
              context,
              'settings.theme.title',
            ),
            subtitle: FlutterI18n.translate(
              context,
              'settings.theme.body',
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () => showDialog(
              context: context,
              builder: (context) => RoundDialog(
                title: FlutterI18n.translate(
                  context,
                  'settings.theme.title',
                ),
                children: <Widget>[
                  RadioCell<Themes>(
                    title: FlutterI18n.translate(
                      context,
                      'settings.theme.theme.dark',
                    ),
                    groupValue: _themeIndex,
                    value: Themes.dark,
                    onChanged: (value) => _changeTheme(value),
                  ),
                  RadioCell<Themes>(
                    title: FlutterI18n.translate(
                      context,
                      'settings.theme.theme.black',
                    ),
                    groupValue: _themeIndex,
                    value: Themes.black,
                    onChanged: (value) => _changeTheme(value),
                  ),
                  RadioCell<Themes>(
                    title: FlutterI18n.translate(
                      context,
                      'settings.theme.theme.light',
                    ),
                    groupValue: _themeIndex,
                    value: Themes.light,
                    onChanged: (value) => _changeTheme(value),
                  ),
                  RadioCell<Themes>(
                    title: FlutterI18n.translate(
                      context,
                      'settings.theme.theme.system',
                    ),
                    groupValue: _themeIndex,
                    value: Themes.system,
                    onChanged: (value) => _changeTheme(value),
                  ),
                ],
              ),
            ),
          ),
          Separator.divider(indent: 72),
          HeaderText(FlutterI18n.translate(
            context,
            'settings.headers.services',
          )),
          ListCell.icon(
            icon: Icons.notifications,
            title: FlutterI18n.translate(
              context,
              'settings.notifications.title',
            ),
            subtitle: FlutterI18n.translate(
              context,
              'settings.notifications.body',
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () => SystemSetting.goto(SettingTarget.NOTIFICATION),
          ),
          Separator.divider(indent: 72),
        ],
      ),
    );
  }

  // Updates app's theme
  Future<void> _changeTheme(Themes theme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Saves new settings
    context.read<ThemeProvider>().theme = theme;
    prefs.setInt('theme', theme.index);

    // Updates UI
    setState(() => _themeIndex = theme);

    // Hides dialog
    Navigator.of(context).pop();
  }
}
