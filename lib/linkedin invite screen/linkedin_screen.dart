
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../generated/assets.dart';
import 'chip_widget.dart';
import 'cubit/linkedin_cubit.dart';
import 'utils/linkedin_model.dart';

class LinkedInScreen extends StatelessWidget {
  final String arg;
  static const routeName = "/linkedin_screen";

  LinkedInScreen({super.key,required this.arg});

  PageController pageController = PageController();
  List<LinkedinModel> model = [
    LinkedinModel(Assets.imagesProfileImage, "mhmd aghajani", 'Flutter Developer'),
    LinkedinModel(Assets.imagesProfileImage2, "Mary Jane", 'Software Engineer'),
    LinkedinModel(Assets.imagesProfileImage3, "Jotean Mahan Roy", 'Product Manager'),
    LinkedinModel(Assets.imagesProfileImage, "Jotean Mahan Roy", 'Product Manager'),
    LinkedinModel(Assets.imagesProfileImage3, "Jotean Mahan Roy", 'Product Manager'),
    LinkedinModel(Assets.imagesProfileImage, "Jotean Mahan Roy", 'Product Manager'),
    LinkedinModel(Assets.imagesProfileImage2, "Jotean Mahan Roy", 'Product Manager'),
  ];

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: BlocProvider(
        create: (context) => LinkedinCubit(),
        child: Builder(
          builder: (context) {
            return Scaffold(

                  appBar: AppBar(
                    title: const Text("Invitations"),
                    centerTitle: true,
                    actions: [
                      IconButton(onPressed: (){}, icon: const Icon(Icons.settings)),
                    ],
                    bottom: const TabBar(
                      tabs: [
                        Tab(text: "Received"),
                        Tab(text: "Sent"),
                        Tab(text: "Accepted"),
                      ],
                    ),
                  ),

                  body: TabBarView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 10,),
                            BlocBuilder<LinkedinCubit, int>(
                              builder: (context, state) {
                                return Row(
                                  children: List.generate(3, (index){
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                      child: ChipWidget(
                                        onTap: (){
                                          pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeInSine);
                                          BlocProvider.of<LinkedinCubit>(context).changeChipButtonIndex(index);
                                        },
                                        text: getText(index),
                                        fontColor: index == state ? Colors.white : Colors.black,
                                        backgroundColor: index == state ? Colors.blueAccent : Colors.white,
                                      ),
                                    );
                                  })
                                );
                              },
                            ),
                            const SizedBox(height: 30,),
                            Expanded(
                              child: PageView(
                                controller: pageController,
                                children: [
                                  AnimationLimiter(
                                    child: ListView.separated(
                                      itemCount: model.length,
                                      itemBuilder: (context, index){
                                        return AnimationConfiguration.staggeredList(
                                          position: index,
                                          duration: const Duration(milliseconds: 1000),
                                          child: SlideAnimation(
                                            verticalOffset: 10.0,
                                            child: FadeInAnimation(
                                              child: SizedBox(
                                                height: 150,
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundImage: AssetImage(model[index].image),
                                                      radius: 50,
                                                    ),
                                                    const SizedBox(width: 10,),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          model[index].name,
                                                          style: const TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 20,
                                                              fontWeight: FontWeight.bold
                                                          ),
                                                        ),
                                                        const SizedBox(height: 5,),

                                                        Text(
                                                          model[index].jobTitle,
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                        SizedBox(height: 5,),

                                                        const Text(
                                                          "Follows you, 23 mutual connections",
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                        SizedBox(height: 5,),

                                                        Row(
                                                          children: [
                                                            ElevatedButton(
                                                              onPressed: (){

                                                              },
                                                              style: ElevatedButton.styleFrom(
                                                                  backgroundColor: Colors.blueAccent
                                                              ),
                                                              child:  const Text(
                                                                "Accept",
                                                                style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontWeight: FontWeight.bold
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(width: 10,),
                                                            TextButton(
                                                              onPressed: (){

                                                              },
                                                              child:  const Text(
                                                                "Decline",
                                                                style: TextStyle(
                                                                    color: Colors.red,
                                                                    fontWeight: FontWeight.bold
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index){
                                        return const SizedBox(height: 10,);
                                      },
                                    ),
                                  ),
                                  AnimationLimiter(
                                    child: ListView.separated(
                                      itemCount: model.length,
                                      itemBuilder: (context, index){
                                        return AnimationConfiguration.staggeredList(
                                          position: index,
                                          duration: const Duration(milliseconds: 1000),
                                          child: SlideAnimation(
                                            verticalOffset: 10.0,
                                            child: FadeInAnimation(
                                              child: SizedBox(
                                                height: 150,
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundImage: AssetImage(model[index].image),
                                                      radius: 50,
                                                    ),
                                                    const SizedBox(width: 10,),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          model[index].name,
                                                          style: const TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 20,
                                                              fontWeight: FontWeight.bold
                                                          ),
                                                        ),
                                                        const SizedBox(height: 5,),

                                                        Text(
                                                          model[index].jobTitle,
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                        SizedBox(height: 5,),

                                                        const Text(
                                                          "Follows you, 23 mutual connections",
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                        SizedBox(height: 5,),

                                                        Row(
                                                          children: [
                                                            ElevatedButton(
                                                              onPressed: (){

                                                              },
                                                              style: ElevatedButton.styleFrom(
                                                                  backgroundColor: Colors.blueAccent
                                                              ),
                                                              child:  const Text(
                                                                "Accept",
                                                                style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontWeight: FontWeight.bold
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(width: 10,),
                                                            TextButton(
                                                              onPressed: (){

                                                              },
                                                              child:  const Text(
                                                                "Decline",
                                                                style: TextStyle(
                                                                    color: Colors.red,
                                                                    fontWeight: FontWeight.bold
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index){
                                        return const SizedBox(height: 10,);
                                      },
                                    ),
                                  ),
                                  AnimationLimiter(
                                    child: ListView.separated(
                                      itemCount: model.length,
                                      itemBuilder: (context, index){
                                        return AnimationConfiguration.staggeredList(
                                          position: index,
                                          duration: const Duration(milliseconds: 1000),
                                          child: SlideAnimation(
                                            verticalOffset: 10.0,
                                            child: FadeInAnimation(
                                              child: SizedBox(
                                                height: 150,
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundImage: AssetImage(model[index].image),
                                                      radius: 50,
                                                    ),
                                                    const SizedBox(width: 10,),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          model[index].name,
                                                          style: const TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 20,
                                                              fontWeight: FontWeight.bold
                                                          ),
                                                        ),
                                                        const SizedBox(height: 5,),

                                                        Text(
                                                          model[index].jobTitle,
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                        SizedBox(height: 5,),

                                                        const Text(
                                                          "Follows you, 23 mutual connections",
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                        SizedBox(height: 5,),

                                                        Row(
                                                          children: [
                                                            ElevatedButton(
                                                              onPressed: (){

                                                              },
                                                              style: ElevatedButton.styleFrom(
                                                                  backgroundColor: Colors.blueAccent
                                                              ),
                                                              child:  const Text(
                                                                "Accept",
                                                                style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontWeight: FontWeight.bold
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(width: 10,),
                                                            TextButton(
                                                              onPressed: (){

                                                              },
                                                              child:  const Text(
                                                                "Decline",
                                                                style: TextStyle(
                                                                    color: Colors.red,
                                                                    fontWeight: FontWeight.bold
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index){
                                        return const SizedBox(height: 10,);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),



                      Icon(Icons.directions_transit),
                      Icon(Icons.directions_bike),
                    ],
                  ),
                );
          }
        ),
      ),
    );
  }

  getText(index) {
    switch(index){
      case 0:
        return "All (27)";
      case 1:
        return "People (20)";
      case 2:
        return "Pages (7)";
    }
  }
}
