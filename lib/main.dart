import 'package:axiom_admin/firebase_options.dart' show DefaultFirebaseOptions;
import 'package:axiom_admin/view/login/login.dart';
import 'package:axiom_admin/view/pg/bloc/pglist_bloc.dart';
import 'package:axiom_admin/view/pg/bloc/pglist_event.dart';
import 'package:axiom_admin/view/rental_list/bloc/propertylistbloc_bloc.dart';
import 'package:axiom_admin/view/rental_list/bloc/propertylistbloc_event.dart';
import 'package:axiom_admin/view/seller_list/bloc/selllistbloc_bloc.dart';
import 'package:axiom_admin/view/seller_list/bloc/selllistbloc_event.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, 
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PropertyBloc>(create: (_)=>PropertyBloc()..add(FetchProperties())),
        BlocProvider<SelllistblocBloc>(create: (_)=>SelllistblocBloc()..add(SellFetchProperties())),
        BlocProvider<PglistBloc>(create: (_)=>PglistBloc()..add(PgFetchProperties())),
      ],
      child: MaterialApp(
        title: 'Axiom_admin',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        debugShowCheckedModeBanner: false,
        home:
        SignInScreen(),
      ),
    );
  }
}
