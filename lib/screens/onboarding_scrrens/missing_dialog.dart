import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sunshine/dataProviders/app_data.dart';
import 'package:sunshine/models/usermodel.dart';

class MissingDialog extends StatefulWidget {
  const MissingDialog({Key? key}) : super(key: key);

  @override
  State<MissingDialog> createState() => _MissingDialogState();
}

class _MissingDialogState extends State<MissingDialog> {
  final name = TextEditingController();
  final nickName = TextEditingController();
  final gender = TextEditingController();
  final dob = TextEditingController();
  final college = TextEditingController();
  final graduationYear = TextEditingController();
  final instaId = TextEditingController();
  final mailId = TextEditingController();
  final phoneNo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppData>(context);
    name.text = provider.name;

    List<Map<String, dynamic>> controllersList = [
      {"name": "Name", "controller": name},
      {"name": "Nick Name", "controller": nickName},
      {"name": "Gender", "controller": gender},
      {"name": "D.O.B", "controller": dob},
      {"name": "College", "controller": college},
      {"name": "Year of graduation", "controller": graduationYear},
      {"name": "Insta ID", "controller": instaId},
      {"name": "Mail Id", "controller": mailId},
      {"name": "Phone No", "controller": phoneNo},
    ];
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 22),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Fill the missing details',
              textAlign: TextAlign.start,
              style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            Text(
              'The more details your are able to provide the faster we will be able to match you.',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 11, color: Color(0xFF797A79)),
            ),
            SizedBox(
              height: 14,
            ),
            PromiseBox(
              promiseNo: '3',
              text: 'We encrypt the data to ensure your details are safe.',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 20),
              child: Column(
                children: [
                  ...controllersList.map((e) => Row(
                        children: [
                          Text(
                            e['name'] as String,
                            style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          TextFormField(
                            controller:
                                e['controller'] as TextEditingController,
                          ),
                        ],
                      ))
                ],
              ),
            ),
            InkWell(
              onTap: () {
                UserModel userModel = UserModel(
                    name: name.text,
                    nick_name: nickName.text,
                    gender: gender.text,
                    dob: DateTime.parse(dob.text),
                    college: college.text,
                    year_of_gradutaion: int.parse(graduationYear.text),
                    instaId: instaId.text,
                    mailId: mailId.text,
                    phoneNo: int.parse(phoneNo.text));
                Provider.of<AppData>(context, listen: false)
                    .updateCrush(userModel);
              },
              child: Container(
                width: 87,
                height: 25,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFFE0100), Color(0xFFA70E0D)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Color(0xFFECE6F0), width: 0.3)),
                child: Text(
                  'Submit',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PromiseBox extends StatelessWidget {
  final String promiseNo;
  final String text;
  const PromiseBox({
    super.key,
    required this.promiseNo,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
      decoration: BoxDecoration(color: Color(0xFFE8FFE5), boxShadow: [
        // BoxShadow(
        //     color: Colors.black.withOpacity(0.25),
        //     offset: Offset(0, 4),
        //     blurRadius: 4)
      ]),
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            color: Color(0xFF7A10C3),
          ),
          SizedBox(
            width: 4.5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Promise $promiseNo:',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF00210B)),
                ),
                Text(
                  text,
                  style: TextStyle(
                    letterSpacing: -0.17,
                    color: Color(0xFF0B7601),
                    fontSize: 12,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
