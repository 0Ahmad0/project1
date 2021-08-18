import 'package:flutter/material.dart';
import 'package:project1/constants/const.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: K1Color1A73CA,
        leading: IconButton(
          //TODO: OnClick Do Something
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Profile',
          style: TextStyle(fontSize: size.width * 0.07),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          SizedBox(
            width: size.width * 0.02,
          )
        ],
      ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/background.jpg')
          )
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: size.width,
              height: size.height * 0.7,
              padding: EdgeInsets.only(
                top: size.width * 0.2,
                left: size.width *0.05,
                right: size.width *0.05,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(75.0),
                  topLeft: Radius.circular(75.0),
                ),
                gradient: LinearGradient(
                    begin: AlignmentDirectional.topEnd,
                    colors: [
                      Colors.white,
                      K4Color7FAEDD,
                    ]),
              ),
              child: ListView(
                children: [
                  Center(
                    child: Text('Rama Re',style: TextStyle(
                        fontSize: size.width * 0.08,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                  BuildTextProfileInformation(
                    size: size,
                    icon: Icons.person,
                    constText: 'UserName',
                    userText: 'Rama Re',
                  ),
                  Divider(),
                  BuildTextProfileInformation(
                    size: size,
                    icon: Icons.phone,
                    constText: 'Number',
                    userText: '+963954872922',
                  ),
                  Divider(),
                  BuildTextProfileInformation(
                    size: size,
                    icon: Icons.email,
                    constText: 'Email',
                    userText: 'ah97916@gmail.com',
                  ),
                  Divider(),
                  BuildTextProfileInformation(
                    size: size,
                    icon: Icons.location_on,
                    constText: 'Location',
                    userText: 'Damascus-Syria',
                  ),
                  // Divider(),
                  //TODO: شو الفائدة من تغيير الباسوورد هون؟؟؟
                  // Container(
                  //   margin: EdgeInsets.symmetric(horizontal: size.width *0.05),
                  //   child: Row(
                  //     children: [
                  //       Text('Change Password?',textAlign: TextAlign.end,style: TextStyle(
                  //         fontSize: size.width *0.04,
                  //         color: Colors.blue
                  //       ),),
                  //     ],
                  //   ),
                  // ),
                  Divider(),
                  BuildTextProfileInformation(
                    size: size,
                    icon: Icons.event_note_outlined,
                    constText: 'About',
                    userText: 'Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,Hello,',
                  ),
                ],
              ),
            ),
           Container(
             margin: EdgeInsets.only(bottom: size.width * 1.3),
             child: Stack(
               children: [
                 Container(
                   width: size.width *0.3,
                   height: size.width *0.3,
                   decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       image: DecorationImage(
                           fit: BoxFit.cover,
                           image: AssetImage('assets/images/01.jpg')
                       )
                   ),
                 ),
                 Container(
                   margin: EdgeInsets.only(
                     top: size.width * 0.22,
                     left: size.width * 0.23,
                   ),
                   width: size.width * 0.08,
                   height: size.width * 0.08,
                   decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       color: K1Color1A73CA
                   ),
                   child: Icon(Icons.add,size: size.width * 0.065,color: Colors.white,),
                 )
               ],
             ),
           )
          ],
        )
      ),
    );
  }
}
class BuildTextProfileInformation extends StatelessWidget {
  final IconData icon;
  final String constText;
  final String userText;
  final Size size;

  const BuildTextProfileInformation({Key key, this.icon, this.constText, this.userText, this.size}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(constText,style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.width * 0.055),),
      subtitle: Text(userText,style: TextStyle(fontSize: size.width * 0.04),),
    );
  }
}
