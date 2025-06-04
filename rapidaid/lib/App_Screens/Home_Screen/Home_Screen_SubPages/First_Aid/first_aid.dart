import 'package:flutter/material.dart';
import 'package:rapidaidv2/App_Components/App_Style/colors.dart';
import 'package:rapidaidv2/App_Functions/First_Aid_Logic/first_aid_list.dart';
import 'package:rapidaidv2/App_Screens/Home_Screen/Home_Screen_SubPages/First_Aid/first_aid_detail.dart';
import 'package:unicons/unicons.dart';

class FirstAid extends StatefulWidget {
  const FirstAid({super.key});

  @override
  State<FirstAid> createState() => _FirstAidState();
}

class _FirstAidState extends State<FirstAid> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final filteredList =
        firstAidList
            .where(
              (situation) =>
                  situation.title.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: AppBar(
          backgroundColor: myMainColor,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(UniconsLine.medkit, size: 40, color: Colors.white),
                  SizedBox(height: 8),
                  Text(
                    'FIRST AID',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          leading: IconButton(
            icon: const Icon(UniconsLine.estate, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search situation...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (val) {
                setState(() => query = val);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final situation = filteredList[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 12.0,
                  ),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadowColor: myMainColor,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 10.0,
                    ),
                    title: Text(
                      situation.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 300),
                          pageBuilder:
                              (_, animation, __) => FadeTransition(
                                opacity: animation,
                                child: FirstAidDetail(situation: situation),
                              ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
