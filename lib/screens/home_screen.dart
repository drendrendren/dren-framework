import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taiwan_currency_converter/dogu/media_query.dart';
import 'package:taiwan_currency_converter/dogu/palette.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ---------- 나라 고정 데이터 ----------
  final String countryName = '🇹🇼 대만(Taiwan)';
  final String capital = '타이베이(臺北, Taipei)';
  final String population = '약 2,330만명';
  final String areaKm2 = '36,197km²';
  final String language = '표준 중국어(만다린)';
  final String currency = 'TWD(신 대만 달러)';
  final String shortIntro = '먹거리 천국이자 이국적 정취, 현대와 전통이 공존하는 활기찬 섬';

  // ------------------------------------------------------

  // ---------- 환율 고정 데이터 ----------
  static const double fixedRate = 47.31; // 2025.12.12 기준 환율
  static const String fixedDate = "2025-12-12"; // 고정 환율 기준 날짜
  // ------------------------------------------------------

  final twdController = TextEditingController();
  final krwController = TextEditingController();

  void convertFromTwd(String value) {
    if (value.isEmpty) {
      krwController.text = "";
      return;
    }
    double twd = double.tryParse(value) ?? 0;
    krwController.text = (twd * fixedRate).toStringAsFixed(2);
  }

  void convertFromKrw(String value) {
    if (value.isEmpty) {
      twdController.text = "";
      return;
    }
    double krw = double.tryParse(value) ?? 0;
    twdController.text = (krw / fixedRate).toStringAsFixed(2);
  }

  @override
  void dispose() {
    twdController.dispose();
    krwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: SizedBox(
          height: 40,
          child: Image.asset(
            'assets/images/appbar_logo.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Palette.backgroundPrimary, Palette.backgroundSecondary],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: SafeArea(
              child: SizedBox(
                width: MediaQueryDogu.width(context) * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Center(
                      child: Text(
                        countryName,
                        style: TextStyle(
                          color: Palette.textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 17),
                    countryDataWidget(),
                    const SizedBox(height: 30),
                    currencyConverterWidget(),
                    const SizedBox(height: 10),
                    // 주의 문구
                    const Text(
                      '※ 본 앱은 최신 API 기반 실시간 환율이 아니라, 고정된 환율 값을 기준으로 계산합니다. 실제 환율과 차이가 있을 수 있으니 중요한 거래에는 공식 환율을 확인하세요.',
                      style: TextStyle(
                        color: Palette.cautionTextPrimary,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget dataTextWidget({required String label, required String text}) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '$label : ',
            style: TextStyle(
              color: Palette.textPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          TextSpan(
            text: text,
            style: TextStyle(color: Palette.textPrimary, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget countryDataWidget() {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        width: MediaQueryDogu.width(context) * 0.65,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            dataTextWidget(label: '수도', text: capital),
            dataTextWidget(label: '인구수', text: population),
            dataTextWidget(label: '면적', text: areaKm2),
            dataTextWidget(label: '언어', text: language),
            dataTextWidget(label: '통화', text: currency),
            dataTextWidget(label: '한줄평', text: shortIntro),
          ],
        ),
      ),
    );
  }

  Widget currencyConverterWidget() {
    return Column(
      children: [
        // 고정 환율 정보
        Text(
          '고정 환율 기준 날짜: $fixedDate',
          style: const TextStyle(color: Palette.textSecondary, fontSize: 14),
        ),
        const SizedBox(height: 6),
        Text(
          '1 TWD = $fixedRate KRW',
          style: const TextStyle(
            color: Palette.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 30),
        // TWD 입력 textfield
        TextField(
          controller: twdController,
          keyboardType: TextInputType.number,
          cursorColor: Palette.cursorPrimary,
          decoration: const InputDecoration(
            labelText: 'TWD(신 대만 달러)',
            labelStyle: TextStyle(color: Palette.textPrimary),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Palette.borderPrimary, width: 2),
            ),
          ),
          onChanged: convertFromTwd,
        ),
        const SizedBox(height: 15),
        // KRW 입력
        TextField(
          controller: krwController,
          keyboardType: TextInputType.number,
          cursorColor: Palette.cursorPrimary,
          decoration: const InputDecoration(
            labelText: 'KRW(대한민국 원)',
            labelStyle: TextStyle(color: Palette.textPrimary),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Palette.borderPrimary, width: 2),
            ),
          ),
          onChanged: convertFromKrw,
        ),
      ],
    );
  }
}
