import 'package:axiom_admin/view/settingspage/bloc/settings_bloc.dart';
import 'package:axiom_admin/view/settingspage/bloc/settings_event.dart';
import 'package:axiom_admin/view/settingspage/bloc/settings_state.dart';
import 'package:axiom_admin/view/widget/info_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminSettingsPage extends StatelessWidget {
  const AdminSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PolicyBloc()..add(LoadPolicy()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('About us & Terms and condition '),
        ),
        body: BlocBuilder<PolicyBloc, PolicyState>(
          builder: (context, state) {
            if (state is PolicyLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is PolicyLoaded) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      InfoSection(
                      title: 'About Us',
                      content: state.policy.aboutus,
                    ),
                    InfoSection(
                      title: 'Privacy Policy',
                      content: state.policy.privacyPolicy,
                    ),
                    InfoSection(
                      title: 'Terms & Conditions',
                      content: state.policy.termsConditions,
                    ),
                    InfoSection(
                      title: 'Data Usage Policy',
                      content: state.policy.dataUsage,
                    ),
                  ],
                ),
              );
            }

            return const Center(child: Text('Failed to load policies'));
          },
        ),
      ),
    );
  }

  // Widget _buildSection({
  //   required String title,
  //   required String content,
  // }) {
  //   return Container(
  //     margin: const EdgeInsets.only(bottom: 24),
  //     padding: const EdgeInsets.all(20),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(12),
  //       boxShadow: const [
  //         BoxShadow(
  //           blurRadius: 10,
  //           color: Colors.black12,
  //         ),
  //       ],
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           title,
  //           style: const TextStyle(
  //             fontSize: 18,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         const SizedBox(height: 12),
  //         Text(
  //           content,
  //           style: const TextStyle(
  //             fontSize: 14,
  //             height: 1.6,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
