import 'package:facebook_ui/Model/Model.dart';
import 'package:flutter/material.dart';

class Messenger_Page extends StatelessWidget {
  const Messenger_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.messenger),
            label: "Đoạn chat",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.call),
          label: "Cuộc gọi ",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contact_mail_sharp),
          label: "Danh bạ",
        ),

      ],),
      body: ListView(
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1535713875'
                          '002-d1d0cf377fde?ixlib=rb-1.2.1&ixid='
                          '%3D%3D&auto=format&fit=crop&w=500&q=60'),
                      fit: BoxFit.cover,
                    )),
              ),
              const Text(
                'Chats',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const Icon(Icons.edit),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.grey),
            child: const TextField(
              cursorColor: Colors.black45,
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black45,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(userStory.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      //padding: EdgeInsets.only(right: 10),
                      child: Stack(
                        children: [
                          userStory[index]['story'] ? Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 3, color: Colors.blue)),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                width: 73,
                                height: 73,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(userStory[index]['img']),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ) : Container(
                            width: 73,
                            height: 73,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(userStory[index]['img']),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          userStory[index]['online'] ?
                          Positioned(
                            left: 55,
                            bottom: 8,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                  border: Border.all(
                                    width: 3,
                                    color: Colors.white,
                                  )),
                            ),
                          ) : Container(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text(userStory[index]["name"]),
                  ],
                )
              );
            })),
          ),
          const SizedBox(height: 20,),
          Column(
            children: List.generate(userMessage.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [

                    Container(
                      width: 75,
                      height: 75,
                      //padding: EdgeInsets.only(right: 10),
                      child: Stack(
                        children: [
                          userMessage[index]['story'] ? Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 3, color: Colors.blue)),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                width: 73,
                                height: 73,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(userMessage[index]['img']),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ) : Container(
                            width: 73,
                            height: 73,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(userMessage[index]['img']),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          userMessage[index]['online'] ?
                          Positioned(
                            left: 55,
                            bottom: 8,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                  border: Border.all(
                                    width: 3,
                                    color: Colors.white,
                                  )),
                            ),
                          ) : Container(),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(userMessage[index]['name'], style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500
                        ),),
                        const SizedBox(height: 5,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width-140,
                          child: Text(userMessage[index]["Message"]+" - " + userMessage[index]['created_at'], style:
                            const TextStyle(
                              fontSize: 15
                            ),
                          ),
                        )
                        // Container(
                        //   width: MediaQuery.of(context).size.width - 140,
                        //   child: Text(userMessage[index]["Message"]),
                        // )
                      ],
                    )
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
