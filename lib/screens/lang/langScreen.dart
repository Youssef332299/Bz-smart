import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/colors/appColors.dart';
import '../../core/routes/routes.dart';
import '../../core/shared/nextBtn.dart';
import '../../generated/l10n.dart';
import 'Provider/langProvder.dart';

class LangScreen extends StatelessWidget {
  const LangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // title: Text(
        //   S.of(context).lang,
        //   style: const TextStyle(color: Colors.black),
        // ),
        leading: Image.asset(
          "assets/images/logo.PNG",
          scale: 8,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(S.of(context).lang,style: const
            TextStyle(fontSize: 22,fontWeight: FontWeight.w900),),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            width:  MediaQuery.of(context).size.width / 0.1,
            child: ListView.builder(
                itemCount: context.watch<LangProvider>().state.langList.length,
                itemBuilder: (context, i) {
                  return Consumer<LangProvider>(builder: (context, o, child) { // o is object
                    return InkWell(
                      onTap: (){
                        o.onTapRadio(i,o.state.langList[i]);
                        o.choseLang(i);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 8,
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 18, left: MediaQuery.of(context).size.width / 40, right: MediaQuery.of(context).size.width / 40,
                      ),
                        decoration: BoxDecoration(
                            color: o.state.radio[i]
                                ?AppColors.primary100
                                :Colors.white,
                            border: Border.all(
                                color: o.state.radio[i]
                                    ?AppColors.primary900
                                    :AppColors.neutral300,
                                width: 1.4),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.65,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 13,
                                      ),
                                      SizedBox(
                                        height: 17,
                                        width: MediaQuery.of(context).size.width / 3.65,
                                        child: Text(o.state.langList[i]["country"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              color: AppColors.neutral900),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 13,
                                      ),
                                      Text(
                                        o.state.langList[i]["code"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            color: AppColors.neutral500),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width / 4,),
                            Container(
                              height: 19,
                              width: 19,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: o.state.radio[i]
                                      ?AppColors.primary900
                                      :AppColors.neutral400,
                                ),
                                borderRadius: BorderRadius.circular(18),),
                              child: Container(
                                height: 13,
                                width: 13,
                                decoration: BoxDecoration(
                                  color: o.state.radio[i]
                                      ?AppColors.primary900
                                      :Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },);
                }),
          ),
          const SizedBox(height: 10,),
          NextButton(onPressed: (){
            Navigator.of(context).pushNamedAndRemoveUntil(Routes.onboarding, (route) => false);
          },text: S.of(context).start),
          // Lottie.asset("assets/lottie/visaCard.json"),
        ],
      ),
    );
  }
}
