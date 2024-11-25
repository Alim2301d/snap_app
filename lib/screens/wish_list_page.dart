import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:snap_app/models/wish.dart';
import 'package:snap_app/services/wish_dao.dart';
import 'package:snap_app/widgets/beveled_button.dart';

class WistListPage extends StatefulWidget {
  const WistListPage({super.key});
  static const String routeName = "/WistListPage";

  @override
  State<WistListPage> createState() => _WistListPageState();
}

class _WistListPageState extends State<WistListPage> {
  final _titleCntrl = TextEditingController();
  final Future<FirebaseApp> _future = Firebase.initializeApp();
  final ScrollController _scrollController = ScrollController();
  String key = '';
  final WishDao wishDao = WishDao();
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Wish List"),
      ),
      body: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return Card(
                elevation: 10,
                color: Colors.orange.withOpacity(0.7),
                margin: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: _titleCntrl,
                        decoration: const InputDecoration(
                            hintText: "Enter Wish", labelText: "Wish"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: BeveledButton(
                              title: "Add Wish", onTap: _saveData)),
                      const SizedBox(
                        height: 10,
                      ),
                      _getWishList(),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }

  Widget _getWishList() {
    return Expanded(
        child: FirebaseAnimatedList(
            query: wishDao.getWishQuery(),
            itemBuilder: (context, snapshot, animation, index) {
              final json = snapshot.value as Map<dynamic, dynamic>;
              final wish = Wish.fromJson(json);
              return Card(
                elevation: 10,
                color: Colors.black45,
                child: ListTile(
                  leading: Theme(
                    data: ThemeData(
                      primarySwatch: Colors.red,
                      unselectedWidgetColor: Colors.blue,
                    ),
                    child: Checkbox(value: wish.isDone, onChanged: (value) {}),
                  ),
                  title: Text(
                    "Wish - ${wish.title}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                ),
              );
            }));
  }

  void _saveData() {
    String title = _titleCntrl.text.toString();

    Wish wish = Wish(title: title, isDone: false);
    wishDao.saveWish(wish);
    _titleCntrl.clear();
  }
}
