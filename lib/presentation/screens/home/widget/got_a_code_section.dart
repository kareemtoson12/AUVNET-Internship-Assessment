import 'package:flutter/material.dart';

class GotACodeSection extends StatelessWidget {
  const GotACodeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.099),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      padding: EdgeInsets.all(screenWidth * 0.03),
      child: Row(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/Security Vault.png',
                height: screenWidth * 0.2,
                width: screenWidth * 0.20,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: screenWidth * 0.07,
                width: screenWidth * 0.07,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    'assets/images/innerfor securityValut.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: screenWidth * 0.02),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Got a code !',
                  style: TextStyle(
                    fontSize: screenHeight * 0.025,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Add your code and save on your order',
                  style: TextStyle(
                    fontSize: screenHeight * 0.018,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
