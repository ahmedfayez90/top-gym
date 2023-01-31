import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../core/config/theme/app_color.dart';
import '../model/mode.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/image3.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0, left: 20),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Hey,",
                          style: GoogleFonts.bebasNeue(
                            fontSize: 32,
                            color: Colors.white,
                            letterSpacing: 1.8,
                          ),
                        ),
                        Text(
                          "Zezo",
                          style: GoogleFonts.bebasNeue(
                            fontSize: 32,
                            color: AppColor.primaryColor,
                            letterSpacing: 1.8,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        border: Border.all(
                          width: 3,
                          color: AppColor.primaryColor,
                        ),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/emely.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.1),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Center(
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.play_arrow,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Find ",
                          style: GoogleFonts.lato(
                            fontSize: 26,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "your Workout",
                          style: GoogleFonts.lato(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.filter_alt_outlined,
                      size: 40,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  width: 353,
                  height: 46,
                  decoration: BoxDecoration(
                    color: const Color(0xFF232441),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "SEARCH WORKOUT",
                        hintStyle: TextStyle(
                          color: Colors.white54,
                        ),
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Popular",
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Hard workout",
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Full body",
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Crossfit",
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Text(
                      "Popular Workout",
                      style: GoogleFonts.lato(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: ListView.builder(
                      itemCount: Category. catego.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            children: [
                              Container(
                                height: 172,
                                width: 141,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(Category.catego[index].imagUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                Category.   catego[index].name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
