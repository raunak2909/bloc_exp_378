import 'package:bloc_exp_378/Lbloc/list_bloc.dart';
import 'package:bloc_exp_378/Lbloc/list_event.dart';
import 'package:bloc_exp_378/Lbloc/list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Page'),
      ),
      body: BlocBuilder<ListBloc, ListState>(builder: (_, state) {
        return state.mData.isNotEmpty ? ListView.builder(
          itemCount: state.mData.length,
            itemBuilder: (_, index) {

              return ListTile(
                title: Text(state.mData[index]['title']),
                subtitle: Text(state.mData[index]['desc']),
                trailing: SizedBox(
                  width: 110,
                  child: Row(
                    children: [
                      IconButton(onPressed: (){
                        context.read<ListBloc>().add(UpdateMapEvent(data: {
                          "title" : "Updated title",
                          "desc" : "Updated desc"
                        }, index: index));
                      }, icon: Icon(Icons.edit)),
                      IconButton(onPressed: (){
                        context.read<ListBloc>().add(DeleteMapEvent(index: index));
                      }, icon: Icon(Icons.delete, color: Colors.red,)),
                    ],
                  ),
                ),
              );

            }) : Center(child: Text('No Data yet..'),);
      }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<ListBloc>().add(AddMapEvent(data: {
          "title": "Life",
          "desc": "Live life King size..",
        }));
      }, child: Icon(Icons.add),),
    );
  }
}
