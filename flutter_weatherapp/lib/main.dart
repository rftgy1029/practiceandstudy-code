import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp([super.key]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key})

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final String serviceKey = "042d21234294c93136fb3ea51c0ff3f89c78e525fc4486f991a8e533381a1bc4";

  String cityName = "대전광역시"
  String temperature = "--";
  bool isLoading = false;
  String errorMessages = "";

  Future<void> fetchKMAWeather() async {
    setState(() {
      isLoading = true;
      errorMessage = "";
    },);

    DateTime now = DateTime.now();

    if (now.minute < 40) {
      now = now.subtract(const Duration(hours: 1));
    }

    String baseDate = DateFormat('yyyyMMdd').format(now);
    String baseTime = DateFormat('HH00').format(now);

    final String url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst'
      '?serviceKey=$serviceKey'
      '&pageNo=1'
      '&numOfRows=10'
      '&dataType=JSON'
      '&base_date=$baseDate'
      '&base_time=$baseTime'
      '&nx=67'
      '&ny=100';
    
    try{
      final response = await http.get(Uri.parse(Uri.decodeFull(url)));

      if
    }

  }
}