import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProviders extends ChangeNotifier {
  //**********************FETCH CARDS*****************//
  bool fetchCardsisLoading = false;
  var fetchCardsStatus;
  var fetchCardsMessage;

  List cards = [];

  Future<String?> fetchUserCards({
    required BuildContext context,
  }) async {
    fetchCardsisLoading = true;
    notifyListeners();

    try {
      var response = await http.get(
        Uri.parse(
            'https://credbevyinterview.jbenergyservices.com/public/api/user/interview/cards'),
        headers: {
          'Accept': 'application/json',
        },
      );
      print('this is fetch cards ${response.statusCode}');

      fetchCardsisLoading = false;
      notifyListeners();
      var data = response.body;
      print(data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        String responseString = response.body;
        fetchCardsStatus = jsonDecode(responseString)['error'].toString();
        cards = jsonDecode(responseString)['data'];

        notifyListeners();

        return fetchCardsStatus;
      } else {
        String responseString = response.body;
        fetchCardsStatus = jsonDecode(responseString)['error'].toString();
        fetchCardsMessage = jsonDecode(responseString)['message'];
        notifyListeners();
        return fetchCardsStatus;
      }
    } catch (error) {
      fetchCardsisLoading = false;
      notifyListeners();
      print(error);
    }
    notifyListeners();
    return fetchCardsStatus;
  }

///////////////////**********************FETCH CARDS*****************////////////////////

  //**********************FETCH TRXNS*****************//
  bool fetchTrxnsisLoading = false;
  var fetchTrxnsStatus;
  var fetchTrxnsMessage;

  bool fetchTrxns = false;
  List trxns = [];

  Future<String?> fetchUserTrxns({
    required BuildContext context,
  }) async {
    fetchTrxnsisLoading = true;
    notifyListeners();

    try {
      var response = await http.get(
        Uri.parse(
            'https://credbevyinterview.jbenergyservices.com/public/api/user/interview/myexpenses'),
        headers: {
          'Accept': 'application/json',
        },
      );
      print('this is fetch trxns ${response.statusCode}');

      fetchTrxnsisLoading = false;
      notifyListeners();
      var data = response.body;
      print(data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        String responseString = response.body;
        fetchTrxnsStatus = jsonDecode(responseString)['error'].toString();
        trxns = jsonDecode(responseString)['data'];

        notifyListeners();

        return fetchTrxnsStatus;
      } else {
        String responseString = response.body;
        fetchTrxnsStatus = jsonDecode(responseString)['error'].toString();
        fetchTrxnsMessage = jsonDecode(responseString)['message'];
        notifyListeners();
        return fetchTrxnsStatus;
      }
    } catch (error) {
      fetchTrxnsisLoading = false;
      notifyListeners();
      print(error);
    }
    notifyListeners();
    return fetchTrxnsStatus;
  }

///////////////////**********************FETCH TRXNS*****************////////////////////

  //**********************FETCH BALANCE*****************//
  bool fetchBalisLoading = false;
  var fetchBalStatus;
  var fetchBalMessage;

  bool fetchBal = false;
  var balance;

  Future<String?> fetchUserBal({
    required BuildContext context,
  }) async {
    fetchBalisLoading = true;
    notifyListeners();

    try {
      var response = await http.get(
        Uri.parse(
            'https://credbevyinterview.jbenergyservices.com/public/api/user/interview/balance'),
        headers: {
          'Accept': 'application/json',
        },
      );
      print('this is fetch bal ${response.statusCode}');

      fetchBalisLoading = false;
      notifyListeners();
      var data = response.body;
      print(data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        String responseString = response.body;
        fetchBalStatus = jsonDecode(responseString)['error'].toString();
        balance = jsonDecode(responseString)['data'];

        notifyListeners();

        return fetchBalStatus;
      } else {
        String responseString = response.body;
        fetchBalStatus = jsonDecode(responseString)['error'].toString();
        fetchBalMessage = jsonDecode(responseString)['message'];
        notifyListeners();
        return fetchBalStatus;
      }
    } catch (error) {
      fetchBalisLoading = false;
      notifyListeners();
      print(error);
    }
    notifyListeners();
    return fetchBalStatus;
  }

///////////////////**********************FETCH BALANCE*****************////////////////////

  //**********************FETCH BENEFICIARIES*****************//
  bool fetchBeneficiariiesisLoading = false;
  var fetchBeneficiariiesStatus;
  var fetchBeneficiariiesMessage;

  bool fetchBeneficiariies = false;
  List beneficiaries = [];

  Future<String?> fetchBeneficiaries({
    required BuildContext context,
  }) async {
    fetchBeneficiariiesisLoading = true;
    notifyListeners();

    try {
      var response = await http.get(
        Uri.parse(
            'https://credbevyinterview.jbenergyservices.com/public/api/user/interview/beneficiaries'),
        headers: {
          'Accept': 'application/json',
        },
      );
      print('this is fetch bene ${response.statusCode}');

      fetchBeneficiariiesisLoading = false;
      notifyListeners();
      var data = response.body;
      print(data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        String responseString = response.body;
        fetchBeneficiariiesStatus =
            jsonDecode(responseString)['error'].toString();
        beneficiaries = jsonDecode(responseString)['data'];

        notifyListeners();

        return fetchBeneficiariiesStatus;
      } else {
        String responseString = response.body;
        fetchBeneficiariiesStatus =
            jsonDecode(responseString)['error'].toString();
        fetchBeneficiariiesMessage = jsonDecode(responseString)['message'];
        notifyListeners();
        return fetchBeneficiariiesStatus;
      }
    } catch (error) {
      fetchBeneficiariiesisLoading = false;
      notifyListeners();
      print(error);
    }
    notifyListeners();
    return fetchBeneficiariiesStatus;
  }

///////////////////**********************FETCH BENEFICIARIES*****************////////////////////

  /////////////////////**********************PAY************//////////////////

  bool payIsLoading = false;
  var payStatus, payMessage;

  Future<String?> pay({
    required BuildContext context,
  }) async {
    payIsLoading = true;
    notifyListeners();

    var payload = {"receiver_id": '2', "amount": '20'};
    print(payload);
    try {
      var response = await http.post(
        Uri.parse(
            'https://credbevyinterview.jbenergyservices.com/public/api/user/interview/transfer'),
        body: payload,
        headers: {
          'Accept': 'application/json',
        },
      );
      print('this is pay ${response.statusCode}');

      payIsLoading = false;
      notifyListeners();
      var data = response.body;
      print(data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        String responseString = response.body;
        payStatus = jsonDecode(responseString)['error'].toString();
        payMessage = jsonDecode(responseString)['message'];

        notifyListeners();

        return payStatus;
      } else {
        String responseString = response.body;
        payStatus = jsonDecode(responseString)['error'].toString();
        payMessage = jsonDecode(responseString)['message'];
        notifyListeners();
        return payStatus;
      }
    } catch (error) {
      payIsLoading = false;
      notifyListeners();
      print(error);
    }
    notifyListeners();
    return payStatus;
  }

/////////////////////**********************PAY************//////////////////
}
