import 'package:axiom_admin/model/settings_model.dart';
import 'package:axiom_admin/view/settingspage/bloc/settings_event.dart';
import 'package:axiom_admin/view/settingspage/bloc/settings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PolicyBloc extends Bloc<PolicyEvent, PolicyState> {
  PolicyBloc() : super(PolicyLoading()) {
    on<LoadPolicy>(_onLoadPolicy);
  }

  Future<void> _onLoadPolicy(
    LoadPolicy event,
    Emitter<PolicyState> emit,
  ) async {
    await Future.delayed(const Duration(milliseconds: 600)); 

    emit(
      PolicyLoaded(
        SettingsModel(
          aboutus: '''
Axiom is a modern real estate property management application designed to simplify the way properties are listed, managed, and serviced. Our platform brings together property owners, service providers, and users into a single, reliable ecosystem that emphasizes transparency, efficiency, and trust.

In today’s fast-moving real estate environment, managing properties, handling inquiries, tracking bookings, and maintaining clear communication can be complex and time-consuming. Axiom was built to solve these challenges by providing a streamlined digital solution that makes property management smarter and more accessible.

Our Mission

Our mission is to empower property owners and service providers with technology that reduces complexity and improves operational efficiency, while offering users a seamless and trustworthy experience when searching for, booking, or managing properties.

What We Do

Axiom enables users to:
• Discover and explore real estate properties with clear and accurate information  
• Communicate efficiently through integrated chat and notification systems  
• Manage bookings, payments, and transaction records securely  
• Maintain organized property data and service workflows in one place  

For property managers and service providers, Axiom offers tools to manage listings, respond to inquiries, track engagements, and deliver services more effectively.

Our Values

Transparency – Clear information, honest communication, and reliable data  
Efficiency – Reducing manual work through intuitive digital workflows  
Security – Protecting user data and transactions with strong safeguards  
User-Centric Design – Building features that solve real-world problems  

Our Vision

We envision Axiom as a trusted digital partner in real estate management—one that continuously evolves with industry needs and sets a higher standard for how properties and services are managed in the digital age.
''',

          privacyPolicy: '''
This application is committed to protecting the privacy of its users and ensuring that personal information is handled in a secure and responsible manner.

We collect only the information necessary to provide and improve our services, such as account details, usage data, and communication preferences. Personal data is never sold, rented, or shared with third parties for marketing purposes.

All collected information is stored using industry-standard security measures to prevent unauthorized access, disclosure, or misuse. Users have the right to access, update, or request deletion of their personal information at any time.

By continuing to use this application, you acknowledge and agree to the practices described in this Privacy Policy.
''',

          termsConditions: '''
By accessing or using this application, you agree to comply with and be bound by these Terms and Conditions.

The platform is intended solely for lawful use in accordance with applicable regulations. Users are responsible for maintaining the confidentiality of their account credentials and for all activities conducted through their accounts.

Any misuse, unauthorized access, or attempt to disrupt system operations may result in suspension or termination of access. The application reserves the right to modify, suspend, or discontinue any part of the service at any time without prior notice.

Continued use of the platform after updates constitutes acceptance of the revised terms.
''',

          dataUsage: '''
The data collected through this application is used exclusively to support operational functionality, enhance user experience, and improve service performance.

Usage data may be analyzed to identify trends, diagnose technical issues, and develop new features. All analytics are performed using aggregated or anonymized data wherever possible.

Strict access controls are implemented to ensure that only authorized personnel can view or manage sensitive information. Data is retained only for as long as necessary to fulfill its intended purpose or comply with legal requirements.

We regularly review our data handling practices to maintain transparency, security, and compliance with applicable data protection standards.
''',
        ),
      ),
    );
  }
}
