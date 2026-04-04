import 'package:flutter/material.dart';
import 'package:firstapp/widgets/liquid_background.dart';
import 'package:firstapp/widgets/glass_card.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LiquidBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                    const Text(
                      'Settings',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                _buildSettingItem('Account', Icons.person_outline),
                const SizedBox(height: 16),
                _buildSettingItem('Privacy', Icons.lock_outline),
                const SizedBox(height: 16),
                _buildSettingItemWithToggle('Notifications', Icons.notifications_none, true),
                const SizedBox(height: 16),
                _buildSettingItem('Theme', Icons.palette_outlined),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem(String title, IconData icon) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      borderRadius: 16,
      child: Row(
        children: [
          Icon(icon, color: Colors.white70),
          const SizedBox(width: 16),
          Text(title, style: const TextStyle(fontSize: 18, color: Colors.white)),
          const Spacer(),
          const Icon(Icons.chevron_right, color: Colors.white38),
        ],
      ),
    );
  }

  Widget _buildSettingItemWithToggle(String title, IconData icon, bool value) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      borderRadius: 16,
      child: Row(
        children: [
          Icon(icon, color: Colors.white70),
          const SizedBox(width: 16),
          Text(title, style: const TextStyle(fontSize: 18, color: Colors.white)),
          const Spacer(),
          Switch(
            value: value,
            onChanged: (v) {},
            activeThumbColor: const Color(0xFF9181EE),
            trackColor: WidgetStateProperty.all(Colors.white.withOpacity(0.1)),
          ),
        ],
      ),
    );
  }
}
