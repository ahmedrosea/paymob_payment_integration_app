import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment_integration/core/constants/payment_constants.dart';
import 'package:payment_integration/model/authentication_model.dart';
import 'package:payment_integration/model/kiosk_ref_code_model.dart';
import 'package:payment_integration/model/order_registration_model.dart';
import 'package:payment_integration/model/payment_token_model.dart';
import 'package:payment_integration/view_model/database/network/dio_helper.dart';
import 'package:payment_integration/view_model/database/network/end_points.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  AuthenticationModel? authData;
  OrderRegistrationModel? orderRegisterData;
  PaymentTokenModel? paymentTokenData;

  //loader
  bool loading = false;

  void getAuthData({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String price,
  }) {
    var body = {
      "api_key": apiKey,
    };
    loading = true;
    emit(LoadingOn());
    DioHelper.postData(url: authEndPoint, body: body).then((response) {
      authData = AuthenticationModel.fromJson(response.data);
      authtoken = authData!.token;
      registerOrder(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        price: price,
      );
      emit(RegisterAuthSuccessed());
    }).catchError((error) {
      print(error);
      emit(RegisterAuthFailed());
    });
  }

  void registerOrder({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String price,
  }) {
    var body = {
      "auth_token": authtoken,
      "delivery_needed": "false",
      "amount_cents": price,
      "currency": "EGP",
      "items": [],
      "shipping_data": {
        "apartment": "NA",
        "email": email,
        "floor": "NA",
        "first_name": firstName,
        "street": "NA",
        "building": "NA",
        "phone_number": phone,
        "postal_code": "NA",
        "extra_description": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": lastName,
        "state": "NA",
      }
    };
    DioHelper.postData(url: orderRegistrationEndpoint, body: body)
        .then((response) {
      orderRegisterData = OrderRegistrationModel.fromJson(response.data);
      orderID = orderRegisterData!.id.toString();
      getPaymentKey(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        price: price,
      );
      emit(RegisterOrderSuccessed());
    }).catchError((e) {
      emit(RegisterOrderFailed());
    });
  }

  void getPaymentKey({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String price,
  }) {
    var body = {
      "auth_token": authtoken,
      "amount_cents": price,
      "order_id": orderID,
      "billing_data": {
        "apartment": "NA",
        "email": email,
        "floor": "NA",
        "first_name": firstName,
        "street": "NA",
        "building": "NA",
        "phone_number": phone,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": lastName,
        "state": "NA",
      },
      "currency": "EGP",
      "integration_id": cardIntegrationID,
      "lock_order_when_paid": "false",
    };
    loading = false;
    emit(LoadingOff());
    DioHelper.postData(url: paymentKeyEndPoint, body: body).then((json) {
      paymentTokenData = PaymentTokenModel.fromJson(json.data);
      paymentToken = paymentTokenData!.token;
      emit(PaymentTokenSuccessed());
    }).catchError((e) {
      emit(PaymentTokenFailed());
    });
  }

  void getRefCode() {
    var body = {
      "source": {"identifier": "AGGREGATOR", "subtype": "AGGREGATOR"},
      "payment_token": paymentToken,
    };

    DioHelper.postData(url: refCodeEndPoint, body: body).then((response) {
      kioskRefCode = response.data['id'].toString();
      emit(KioskRefCodeSuccessed());
    }).catchError((e) {
      emit(KioskRefCodeFailed());
    });
  }
}
