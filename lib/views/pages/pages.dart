import 'dart:async';

import 'package:dietaryminder/auth/auth.dart';
import 'package:dietaryminder/controller/controller.dart';
import 'package:dietaryminder/models/models.dart';
import 'package:dietaryminder/models/stellaris/user.dart';
import 'package:dietaryminder/shared/shared.dart';
import 'package:dietaryminder/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:lazy_loading_list/lazy_loading_list.dart';
import 'package:oauth2_client/access_token_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'loginregister/loginpage.dart';
part 'loginregister/registerpage.dart';
part 'main/mainmenupage.dart';
part 'main/home/homepage.dart';
part 'main/calculate/calculatepage.dart';
part 'main/calculate/calculateresultpage.dart';
part 'main/foods/foodspage.dart';
part 'main/foods/fooddetailpage.dart';
part 'main/schedule/schedulepage.dart';
part 'main/schedule/addschedulepage.dart';
part 'splashscreenpage.dart';
