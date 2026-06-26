import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'OpenSans'
      ),
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 34, 38, 54),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isMobile = constraints.maxWidth < 600;
              return Column(
                children: [
                  TopBar(isMobile: isMobile, constraints: constraints,),
                  Container(color: const Color.fromARGB(255, 16, 21, 29), width: double.infinity, height: constraints.maxHeight * 0.001,),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: isMobile ? constraints.maxWidth * 1 : constraints.maxWidth * 0.45,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color.fromARGB(255, 34, 38, 54),
                                        Color.fromARGB(255, 34, 38, 54),
                                        Colors.transparent,
                                      ],
                                      stops: const [0.0, 0.7, 1.0],
                                    ).createShader(bounds);
                                  },
                                  blendMode: BlendMode.dstIn,
                                  child: Image.asset(
                                    'Assets/images/portfolioCrop.png',
                                    width: double.infinity,
                                    fit: BoxFit.fitWidth, 
                                    alignment: Alignment.topCenter,
                                  ),
                                ),
                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromRGBO(34, 38, 54,0.7),
                                          Color.fromRGBO(76, 82, 107, 0.694),
                                          Color.fromRGBO(34, 38, 54,0.7),
                                        ],
                                        begin: AlignmentGeometry.topCenter,
                                        end: AlignmentGeometry.bottomCenter 
                                      )
                                    ),
                                  ) 
                                ),
              
                                NameBar(isMobile: isMobile, constraints: constraints,),
                                Avatar(isMobile: isMobile, constraints: constraints,),
                              ],
                            ),
                          ),
                          Container(
                            color: Color.fromARGB(255, 34, 38, 54),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 32, 16, 24),
                              child: Column(
                                spacing: 32,
                                children: [
                                  PortfolioDivider(),
                                  Padding(
                                    padding: EdgeInsets.only(left: constraints.maxWidth * 0.06, right: constraints.maxWidth * 0.06),
                                    child: LayoutBuilder(
                                      builder: (context, constraints) {
                                        bool isWide = constraints.maxWidth > 600; // breakpoint
                                                  
                                        List<Widget> images = [
                                          Expanded(
                                            flex: isWide ? 1 : 0,
                                            child: ClipRRect(
                                              borderRadius: BorderRadiusGeometry.circular(20),
                                              
                                              child: Image.asset(
                                                'Assets/images/_2.gif',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: isWide ? 16 : 0, height: isWide ? 0 : 16),
                                          Expanded(
                                            flex: isWide ? 1 : 0,
                                            child: ClipRRect(
                                              borderRadius: BorderRadiusGeometry.circular(20),
                                              child: Image.asset(
                                                'Assets/images/2025-12-09 21-22-04 (2).gif',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ];
                                                  
                                        return isWide
                                          ? Row(
                                              children: images,
                                            )
                                          : Column(
                                              children: images,
                                            );
                                      },
                                    ),
                                  ),
                                  PortfolioDivider(),
                                  Padding(
                                    padding: EdgeInsets.only(left: constraints.maxWidth * 0.06, right: constraints.maxWidth * 0.06),
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(constraints.maxWidth * 0.02),
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 20, 22, 30),
                                        borderRadius: BorderRadius.circular(constraints.maxWidth * 0.015),
                                        border: Border.all(
                                          color: Color.fromARGB(255, 62, 71, 104),
                                        )
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            spacing: constraints.maxWidth * 0.003,
                                            children: [
                                              Text(
                                                "Projects",
                                                style: TextStyle(
                                                  color: Color.fromARGB(255, 185, 190, 210),
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: constraints.maxWidth * 0.01
                                                ),
                                              ),
                                              Container(
                                                width: constraints.maxWidth * 0.045,
                                                height: 1,
                                                color: Color.fromARGB(255, 185, 190, 210),
                                              )
                                            ],
                                          ),
                                          Text(
                                            "My Projects",
                                            style: TextStyle(
                                              color: Color.fromARGB(255, 217, 220, 231),
                                              fontWeight: FontWeight.w700,
                                              fontSize: constraints.maxWidth * 0.03
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 16.0),
                                            child: Center(
                                              child: Wrap(
                                                spacing: 24,
                                                runSpacing: 32,
                                                children: [
                                                  ProjectCard(isMobile: isMobile, constraints: constraints,),
                                                  ProjectCard(isMobile: isMobile, constraints: constraints,),
                                                  ProjectCard(isMobile: isMobile, constraints: constraints,)
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ),
                                  PortfolioDivider(),
                                  AboutMeSection(isMobile: isMobile, constraints: constraints,),
                                  PortfolioDivider(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.isMobile,
    required this.constraints
  });

  final bool isMobile;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: constraints.maxWidth * 0.25
      ),
      padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 11, 12, 16),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Color.fromARGB(255, 117, 125, 157),
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: constraints.maxWidth * 0.005,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10),
            child: Image.asset(
              "Assets/images/ruinRunners.png",
            ),
          ),
          Text(
            "Ruin Runners",
            style: TextStyle(
              color: const Color.fromARGB(255, 183, 224, 232),
              fontWeight: FontWeight.w600,
              fontSize: constraints.maxWidth * 0.012
            ),
          ),
          Text(
            "Ruin Runners is a 2 player co-op puzzle platformer game where both the players help each other to progress forward.",
            style: TextStyle(
              color: const Color.fromARGB(255, 142, 160, 163),
              fontWeight: FontWeight.w400,
              fontSize: constraints.maxWidth * 0.008
            ),
          ),
          Divider(color: Color.fromARGB(255, 94, 105, 107),),
          Row(
            spacing: constraints.maxWidth * 0.005,
            children: [
              ToolCard(isMobile: isMobile, constraints: constraints, imageLocation: "Assets/images/Unity.png", toolName: "Unity",),
              ToolCard(isMobile: isMobile, constraints: constraints, imageLocation: "Assets/images/c#.png", toolName: "C#",),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              spacing: constraints.maxWidth * 0.005,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "View Project",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 156, 198, 246),
                    fontWeight: FontWeight.w400,
                    fontSize: constraints.maxWidth * 0.008
                  ),
                ),
                Icon(Icons.arrow_right_alt, color: const Color.fromARGB(255, 156, 198, 246),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ToolCard extends StatelessWidget {
  const ToolCard({
    super.key,
    required this.isMobile,
    required this.constraints,
    required this.imageLocation,
    required this.toolName
  });

  final bool isMobile;
  final BoxConstraints constraints;
  final String imageLocation;
  final String toolName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color.fromARGB(255, 142, 160, 163),
        )
      ),
      child: Row(
        spacing: constraints.maxWidth * 0.005,
        children: [
          Image.asset(
            imageLocation,
            width: constraints.maxWidth * 0.012,
          ),
          Text(
            toolName,
            style: TextStyle(
              color: Color.fromARGB(255, 146, 156, 189),
              fontWeight: FontWeight.w500
            ),
          )
        ],
      ),
    );
  }
}

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({
    super.key,
    required this.isMobile,
    required this.constraints
  });

  final bool isMobile;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: constraints.maxWidth * 0.06, right: constraints.maxWidth * 0.06),
      child: Container(
        padding: EdgeInsets.all(constraints.maxWidth * 0.02),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 20, 22, 30),
          borderRadius: BorderRadius.circular(constraints.maxWidth * 0.015),
          border: Border.all(
            color: Color.fromARGB(255, 62, 71, 104),
          )
        ),
        child: Row(
          spacing: constraints.maxWidth * 0.015,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: constraints.maxWidth * 0.17,
                    child: Column(
                      children: [
                        Text(
                          "About Me",
                          style: TextStyle(
                            color: Color.fromARGB(255, 185, 190, 210),
                            fontWeight: FontWeight.w700,
                            fontSize: 56
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 32.0),
                          child: Container(
                            height: 3,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Color.fromARGB(255, 62, 71, 104),
                                  Colors.transparent
                                ],
                                stops: const [
                                  0.0, 0.1, 0.9
                                ]
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Color.fromARGB(255, 153, 155, 166),
                        fontSize: constraints.maxWidth * 0.013
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "My journey into game development began in the ",
                        ),
                        TextSpan(
                          text: "8th Grade",
                          style: TextStyle(
                            color: Color.fromARGB(255, 135, 149, 216),
                            fontWeight: FontWeight.w500
                          )
                        ),
                        TextSpan(
                          text: ", when I built my first game in "
                        ),
                        TextSpan(
                          text: "Unity",
                          style: TextStyle(
                            color: Color.fromARGB(255, 135, 149, 216),
                            fontWeight: FontWeight.w500
                          )
                        ),
                        TextSpan(
                          text: ". What started as curiosity grew into a passion for understanding how games work and the technology behind them.\n\n",
                        ),
                        TextSpan(
                          text: "Today, I specialize in "
                        ),
                        TextSpan(
                          text: "Gameplay Programming",
                          style: TextStyle(
                            color: Color.fromARGB(255, 135, 149, 216),
                            fontWeight: FontWeight.w500
                          )
                        ),
                        TextSpan(
                          text: ", focusing on "
                        ),
                        TextSpan(
                          text: "gameplay systems, clean architecture, and scalable code",
                          style: TextStyle(
                            color: Color.fromARGB(255, 135, 149, 216),
                            fontWeight: FontWeight.w500
                          )
                        ),
                        TextSpan(
                          text: ". I enjoy solving technical challenges and transforming game mechanics into polished player experiences.\n\n"
                        ),
                        TextSpan(
                          text: "Over the years, I've worked with "
                        ),
                        TextSpan(
                          text: "Unity, Unreal Engine, C#, C++, Lua (Roblox), JavaScript, Python, Flutter, HTML/CSS, and SQL",
                          style: TextStyle(
                            color: Color.fromARGB(255, 135, 149, 216),
                            fontWeight: FontWeight.w500
                          )
                        ),
                        TextSpan(
                          text: ". I also have experience in "
                        ),
                        TextSpan(
                          text: "3D hard-surface modeling",
                          style: TextStyle(
                            color: Color.fromARGB(255, 135, 149, 216),
                            fontWeight: FontWeight.w500
                          )
                        ),
                        TextSpan(
                          text: ", giving me a solid understanding of the technical art pipeline and effective collaboration with artists.\n\n"
                        ),
                        TextSpan(
                          text: "I'm always learning, exploring new technologies, and refining my skills to build games that are technically robust, engaging, and enjoyable to play."
                        ),
                      ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.download_rounded,
                        color: Color.fromARGB(255, 36, 46, 82),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 158, 170, 214),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(constraints.maxWidth * 0.005)
                        )
                      ),
                      label: Text(
                        "Download Resume",
                        style: TextStyle(
                          color: Color.fromARGB(255, 36, 46, 82),
                          fontWeight: FontWeight.w600
                        ),
                      )
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 2,
              height: constraints.maxWidth * 0.2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Color.fromARGB(255, 62, 71, 104),
                    Colors.transparent
                  ],
                  begin: AlignmentGeometry.topCenter,
                  end: AlignmentGeometry.bottomCenter,
      
                  stops: const [
                    0.1, 0.5, 0.9
                  ]
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                spacing: constraints.maxWidth * 0.03,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AM_Cards(isMobile: isMobile, constraints: constraints, icon: Icons.sports_esports, title: "Role", subTitle: "Gameplay Programmer", message: "Building Gameplay systems and tools",),
                  AM_Cards(isMobile: isMobile, constraints: constraints, icon: Icons.school_outlined, title: "Education", subTitle: "B.Sc. Game Design & Development", message: "ICAT Design & Media College",),
                  AM_Cards(isMobile: isMobile, constraints: constraints, icon: Icons.location_on, title: "Location", subTitle: "Chennai, India", message: "Available for remote opportunities",),
                  AM_Cards(isMobile: isMobile, constraints: constraints, icon: Icons.favorite_border, title: "Focus", subTitle: "Clean Code | Scalable Systems | Fun Games", message: "Performance, Optimization, Player Experience",),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PortfolioDivider extends StatelessWidget {
  const PortfolioDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.memory,
          color: Color.fromARGB(255, 158, 170, 214),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: Color.fromARGB(255, 158, 170, 214),
          ),
        ),
        Icon(
          Icons.memory,
          color: Color.fromARGB(255, 158, 170, 214),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: Color.fromARGB(255, 158, 170, 214),
          ),
        ),
        Icon(
          Icons.memory,
          color: Color.fromARGB(255, 158, 170, 214),
        ),
      ],
    );
  }
}

class AM_Cards extends StatelessWidget {
  const AM_Cards({
    super.key,
    required this.isMobile,
    required this.constraints,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.message
  });

  final bool isMobile;
  final BoxConstraints constraints;
  final IconData icon;
  final String title;
  final String subTitle;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: constraints.maxWidth * 0.005,
      children: [
        Container(
          width: constraints.maxWidth * 0.04,
          height: constraints.maxWidth * 0.04,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 26, 29, 40),
            borderRadius: BorderRadius.circular(constraints.maxWidth * 0.005),
            // border: Border.all(
            //   color: Color.fromARGB(255, 62, 71, 104),
            // )
          ),
          child: Center(
            child: Icon(
              icon,
              color: Color.fromARGB(255, 62, 71, 104),
              size: constraints.maxWidth * 0.03,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Color.fromARGB(255, 115, 128, 174),
                fontSize: constraints.maxWidth * 0.01,
                fontWeight: FontWeight.w500
              ),
            ),
            Text(
              subTitle,
              style: TextStyle(
                color: Color.fromARGB(255, 191, 194, 203),
                fontSize: constraints.maxWidth * 0.01,
                fontWeight: FontWeight.w500
              ),
            ),
            Text(
              message,
              style: TextStyle(
                color: Color.fromARGB(255, 145, 146, 150),
                fontSize: constraints.maxWidth * 0.01,
                fontWeight: FontWeight.w400
              ),
            )
          ],
        )
      ],
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.isMobile,
    required this.constraints
  });

  final bool isMobile;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: isMobile ? constraints.maxWidth * 0.45 : constraints.maxWidth * 0.18,
      child: Padding(
        padding: EdgeInsets.only(bottom: constraints.maxHeight * 0),
        child: CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 11, 8, 24),
          radius: constraints.maxHeight * (isMobile ? 0.1 : 0.15),
          child: CircleAvatar(
            radius: constraints.maxHeight * (isMobile ? 0.098 : 0.148),
            backgroundImage: AssetImage("Assets/images/square-image (1).jpg"),
          ),
        ),
      ),
    );
  }
}

class NameBar extends StatelessWidget {
  const NameBar({
    super.key,
    required this.isMobile,
    required this.constraints
  });

  final bool isMobile;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return isMobile ? 
    Positioned(
      bottom: 0,
      left: constraints.maxWidth * 0.08,
      right: constraints.maxWidth * 0.08,
      child: Container(
        height: constraints.maxWidth * 0.6,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 34, 38, 54),
          border: Border.all(
            color: Color.fromARGB(255, 81, 94, 142),
          ),
          borderRadius: BorderRadius.circular(20)
        ),
        child: NameBarContent(isMobile: isMobile, constraints: constraints),
      ) 
    )
    : Positioned(
      bottom: 0,
      left: constraints.maxWidth * 0.3,
      right: constraints.maxWidth * 0.3,
      child: Container(
        height: constraints.maxWidth * 0.23,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 34, 38, 54),
          border: Border.all(
            color: Color.fromARGB(255, 81, 94, 142),
          ),
          borderRadius: BorderRadius.circular(20)
        ),
        child: NameBarContent(isMobile: isMobile, constraints: constraints),
      ),
    );
  }
}

class NameBarContent extends StatelessWidget {
  const NameBarContent({
    super.key,
    required this.isMobile,
    required this.constraints,
  });

  final bool isMobile;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(32, constraints.maxWidth * (isMobile ? 0.08 : 0.03), 32, 24),
      child: Column(
        children: [
          SizedBox(height: 32,),
          Text(
            "Gopinath S",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color.fromARGB(255, 188, 196, 211),
              fontWeight: FontWeight.w700,
              fontSize: constraints.maxWidth * (isMobile ? 0.07 : 0.03)
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Color.fromARGB(255, 81, 94, 142),
                height: 1,
                width: constraints.maxWidth * 0.03,
              ),
              Text(
                "Gameplay Programmer",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 159, 173, 226),
                  fontWeight: FontWeight.w400,
                  fontSize: constraints.maxWidth * (isMobile ? 0.05 : 0.025)
                ),
              ),
              Container(
                color: Color.fromARGB(255, 81, 94, 142),
                height: 1,
                width: constraints.maxWidth * 0.03,
              ),
            ],
          ),
          Text(
            "3D Hard Surface Modeler",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color.fromARGB(255, 179, 183, 190),
              fontWeight: FontWeight.w400,
              fontSize: constraints.maxWidth * (isMobile ? 0.045 : 0.02)
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: constraints.maxWidth * (isMobile ? 0.05 : 0.02), 
            left: constraints.maxWidth * 0.1,
            right: constraints.maxWidth * 0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NameBarIcons(constraints: constraints, isMobile: isMobile, isNormalIcon: false, normalIcon: Icons.no_encryption, faIcon: FontAwesomeIcons.github,),
                NameBarIcons(constraints: constraints, isMobile: isMobile, isNormalIcon: false, normalIcon: Icons.no_encryption, faIcon: FontAwesomeIcons.linkedin,),
                NameBarIcons(constraints: constraints, isMobile: isMobile, isNormalIcon: true, normalIcon: Icons.mail, faIcon: FontAwesomeIcons.github,),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NameBarIcons extends StatelessWidget {
  const NameBarIcons({
    super.key,
    required this.constraints,
    required this.isMobile,
    required this.isNormalIcon,
    required this.normalIcon,
    required this.faIcon
  });

  final BoxConstraints constraints;
  final bool isMobile;

  final bool isNormalIcon;
  final IconData normalIcon;
  final FaIconData faIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: constraints.maxWidth * (isMobile ? 0.08 : 0.03),
      height: constraints.maxWidth * (isMobile ? 0.08 : 0.03),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(255, 81, 94, 142),
        ),
        borderRadius: BorderRadius.circular(constraints.maxWidth * (isMobile ? 0.01 : 0.005))
      ),
      child: Center(
        child: isNormalIcon ? 
        Icon(
          normalIcon,
          color: Color.fromARGB(255, 81, 94, 142),
          size: constraints.maxWidth * (isMobile ? 0.05 : 0.02),
        )
        :FaIcon(
          faIcon,
          color: Color.fromARGB(255, 81, 94, 142),
          size: constraints.maxWidth * (isMobile ? 0.05 : 0.02),
        ),
      )
      );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
    required this.isMobile,
    required this.constraints
  });

  final bool isMobile;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: constraints.maxHeight * 0.06,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 34, 38, 54),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        spacing: 8,
        children: [
          Expanded(
            child: Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Gopinath S",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                      )
                    ),
                    TextSpan(
                      text: " | Programmer Portfolio",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey
                      )
                    )
                  ]
                )
              ),
            ),
          ),
          isMobile ? IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.menu, color: const Color.fromARGB(255, 203, 215, 225),)
          ) : 
          Row(
            children: [
              MenuButtons(text: "About Me",),
              MenuButtons(text: "Skills",),
              MenuButtons(text: "Projects",),
              MenuButtons(text: "Contact",),
            ],
          )
        ],
      ),
    );
  }
}

class MenuButtons extends StatelessWidget {
  final String text; 
  const MenuButtons({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        backgroundColor: Color.fromARGB(0, 37, 101, 133),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10)
        )
      ),
      child: Text(
        text,
        style: TextStyle(
          color: const Color.fromARGB(255, 209, 209, 209),
          fontWeight: FontWeight.w400
        ),
      ),
          
    );
  }
}
