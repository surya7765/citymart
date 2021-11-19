import 'package:citymart/models/product_model.dart';
import 'package:firestore_search/firestore_search.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return FirestoreSearchScaffold(
      searchTextColor: Colors.black,
      searchTextHintColor: Colors.grey,
      searchBackgroundColor: Colors.grey[200],
      scaffoldBackgroundColor: Colors.black54,
      searchBodyBackgroundColor: Colors.black87,
      firestoreCollectionName: 'products',
      searchBy: 'productName',
      scaffoldBody: const Center(
          child: Text(
        'Search Products',
        style: TextStyle(
          color: Colors.white,
        ),
      )),
      dataListFromSnapshot: ProductModel().dataListFromSnapshot,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<ProductModel>? dataList = snapshot.data;
          print(dataList);
          return ListView.builder(
            itemCount: dataList?.length ?? 0,
            itemBuilder: (context, index) {
              final ProductModel data = dataList![index];
              return ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(data.images!),
                ),
                title: Text(
                  '${data.productName}',
                  style: Theme.of(context).textTheme.headline6,
                ),
                subtitle: Text(
                  '${data.description}',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              );
            },
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(
                'No Results Found',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
