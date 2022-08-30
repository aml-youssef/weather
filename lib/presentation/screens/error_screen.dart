import 'package:flutter/material.dart';
import 'package:weather/core/utlis/constants.dart';

class ErrorScreen extends StatelessWidget {
  final String messege;
  final Future<void> Function() onRefresh;

  const ErrorScreen(
      {Key? key,
      required this.messege,
      required this.onRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Icon(
              Icons.warning_amber_rounded,
              size: 50,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              messege,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          const Text(
            AppConstants.pleaseTryAgain,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          Container(
            height: 55,
            width: MediaQuery.of(context).size.height * 0.55,
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                // primary: AppColors.primary,
                // onPrimary: Theme.of(context).primaryColor,
                elevation: 500,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: onRefresh,
              child: const Text(
                AppConstants.reloadScreen,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
