import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:todo_app/Utils.dart';
import 'package:todo_app/create_todo_view.dart';

//stl= stateless widget
//stf= stateful widget

class Homeview extends StatefulWidget {
  const Homeview({ Key? key }) : super(key: key);

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  String selectedItem = 'todo';

  final  List<Map<String,dynamic>>  _unCompletedData = [];

  final List<Map<String,dynamic>>  _completedData = [];

  final List<Map<String,dynamic>> data = [
    {
      'title': 'Donec quis sapien felis. Sed ac ultricies orci',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quis sapien felis. Sed ac ultricies orci. Sed quam justo, commodo eget leo sit amet, consequat suscipit lacus. Ut dapibus nunc ac nisi consectetur pharetra. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent purus arcu, efficitur in eros vitae, scelerisque euismod nisi. Mauris eleifend convallis nulla vel consectetur. Cras sollicitudin ante tellus. Aenean auctor nulla vitae dui aliquet, ac tincidunt lectus tempus. In non consectetur lorem. Vivamus commodo ullamcorper dolor. Integer maximus quam eu neque accumsan, ac accumsan neque fringilla. Quisque dignissim semper lacinia.',
      'date_time': 'Today',
      'status': true, 
    },
    {
      'title': 'Lorem ipsum dolor sit amet, consectetur adipiscing eli',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quis sapien felis. Sed ac ultricies orci. Sed quam justo, commodo eget leo sit amet, consequat suscipit lacus. Ut dapibus nunc ac nisi consectetur pharetra. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent purus arcu, efficitur in eros vitae, scelerisque euismod nisi. Mauris eleifend convallis nulla vel consectetur. Cras sollicitudin ante tellus. Aenean auctor nulla vitae dui aliquet, ac tincidunt lectus tempus. In non consectetur lorem. Vivamus commodo ullamcorper dolor. Integer maximus quam eu neque accumsan, ac accumsan neque fringilla. Quisque dignissim semper lacinia.',
      'date_time': 'Yesterday',
      'status': true, 
    },
   {
      'title': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quis sapien felis. Sed ac ultricies orci. Sed quam justo, commodo eget leo sit amet, consequat suscipit lacus. Ut dapibus nunc ac nisi consectetur pharetra. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent purus arcu, efficitur in eros vitae, scelerisque euismod nisi. Mauris eleifend convallis nulla vel consectetur. Cras sollicitudin ante tellus. Aenean auctor nulla vitae dui aliquet, ac tincidunt lectus tempus. In non consectetur lorem. Vivamus commodo ullamcorper dolor. Integer maximus quam eu neque accumsan, ac accumsan neque fringilla. Quisque dignissim semper lacinia.',
      'date_time': 'Tomorrow',
      'status': false, 

    },  
    { 
      'title': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quis sapien felis. Sed ac ultricies orci. Sed quam justo, commodo eget leo sit amet, consequat suscipit lacus. Ut dapibus nunc ac nisi consectetur pharetra. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent purus arcu, efficitur in eros vitae, scelerisque euismod nisi. Mauris eleifend convallis nulla vel consectetur. Cras sollicitudin ante tellus. Aenean auctor nulla vitae dui aliquet, ac tincidunt lectus tempus. In non consectetur lorem. Vivamus commodo ullamcorper dolor. Integer maximus quam eu neque accumsan, ac accumsan neque fringilla. Quisque dignissim semper lacinia.',
      'date_time': 'Today',
      'status': false, 

    },
    {
      'title': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quis sapien felis. Sed ac ultricies orci. Sed quam justo, commodo eget leo sit amet, consequat suscipit lacus. Ut dapibus nunc ac nisi consectetur pharetra. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent purus arcu, efficitur in eros vitae, scelerisque euismod nisi. Mauris eleifend convallis nulla vel consectetur. Cras sollicitudin ante tellus. Aenean auctor nulla vitae dui aliquet, ac tincidunt lectus tempus. In non consectetur lorem. Vivamus commodo ullamcorper dolor. Integer maximus quam eu neque accumsan, ac accumsan neque fringilla. Quisque dignissim semper lacinia.',
      'date_time': 'friday. 11 Dec',
      'status': false, 
    }
  ];
  @override
  void initState() {
    for(Map<String,dynamic>element in data){
      if(!element['status']) {
      _unCompletedData.add(element);
   }else {
     _completedData.add(element);
   }
 }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('My Tasks',
         style: TextStyle(fontWeight: FontWeight.bold,
         fontSize: 21),
      ),
     leading: const Center(child: FlutterLogo(size: 15,)),
     actions: [
       PopupMenuButton<String>(
         icon: const Icon(Icons.menu),
         onSelected: (value){
           setState(() {
             selectedItem = value;
             });
           },
         itemBuilder: (context) {
           return [
             const PopupMenuItem(child: Text('Todo'),value: 'todo',),
             const PopupMenuItem(child: Text('completed'),value: 'completed',),
           ];
         
       }),
       IconButton (onPressed: (){},icon: const Icon(Icons.search),)
     ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return   CreateTodoView();
          }));
          
        },
      child: const Icon(Icons.add),
     ),
     body: ListView.separated(
       padding:const  EdgeInsets.all(16),
       itemBuilder: (context,index){
       return TaskCardWidget(
         dateTime:  selectedItem =='todo'
                    ? _unCompletedData[index]['date_time'] 
                    :_completedData[index]['date_time'],
          title:  selectedItem =='todo'
                    ? _unCompletedData[index]['title']
                    :_completedData[index]['title'], 
                    description: selectedItem =='todo'
                    ? _unCompletedData[index]['description']
                    :_completedData[index]['description'],      
         );
     }, 
     separatorBuilder: (context,index) {
       return const SizedBox(
         height: 10
         );
     }, 
     itemCount: selectedItem == 'todo' ?_unCompletedData.length: _completedData.length),
     bottomNavigationBar: SafeArea(
       child: Padding(
         padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16,),
         child: InkWell(
           onTap: (){
            showBarModalBottomSheet(
              context: context, 
              builder: (context){
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemBuilder: (context,index){
                  return TaskCardWidget(
                    dateTime: _completedData[index]['date_time'],
                    description: _completedData[index]['description'],
                    title: _completedData[index]['title'],
                    );
        
     }, 
              separatorBuilder: (context,index){
                return const SizedBox(height: 5,);
              },
              itemCount: _completedData.length);

            }); 
           },

           child: Material(
             borderRadius: BorderRadius.circular(10),
             color: Colors.blue,
             child: Padding(
               padding: const EdgeInsets.all(15),
               child: Row (
                 children:  [
                   const Icon(Icons.check_circle,
                   size: 30,color: Colors.white,
                   ),
                    const SizedBox(width: 15,),
                   const Text ('completed',style: TextStyle(color:Colors.white,fontSize:20,fontWeight: FontWeight.bold),
                   ),
                  const Spacer(),
                   Text(
                     '${_completedData.length}',
                    style:const TextStyle(fontSize: 18,color:Colors.white),),
                 ]
               ),
             )
           ),
         ),
       ),
     )
     );
 } 
}

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({Key? key, required this.title,required this.description,required this.dateTime}) : super(key: key,);

  final String title;
  final String description;
  final String dateTime;
  

  

  @override
  Widget build(BuildContext context) {
    return Card(
    margin:const EdgeInsets.all(16),
      
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
           Icon(
            Icons.check_circle_outline_outlined,
            size: 35,
            color: customColor(date: dateTime),
            
            ),
          const SizedBox(
            width: 10,
          ),
         Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text( 
                  title, 
                 
                  maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
                Text(
                  description,
                   
                   maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:const TextStyle(fontSize: 16,color: Colors.grey),),
              ],
            ),
          ),
         const SizedBox(
            width: 15,
          ),
          Row(
            children:  [
              Icon(Icons.notifications_outlined,
            color: customColor(
            date: dateTime),
             ),
            
                Text( 
                  dateTime,
              style: TextStyle(
                color: customColor(
                  date: dateTime)),
            ),
              
           ],
            ),
        ]
        ),
    ),
     );
  }
}
