import 'dart:html';
import 'package:sqljocky/sqljocky.dart';

import 'package:sqljocky/utils.dart';
import 'package:options_file/options_file.dart';
import 'dart:async';

main() async {
  // displays text on the webpage
  querySelector('#text').text = 'Hello from Dart!';

  // creates a connection pool
  var pool = new ConnectionPool(
      host: 'us-cdbr-iron-east-03.cleardb.net', port: 3306,
      user: 'b8b8138eb3ef54', password: '48144a6d',
      db: 'heroku_98371f7bb084e1f', max: 5);

  //mysql://b8b8138eb3ef54:48144a6d@us-cdbr-iron-east-03.cleardb.net/heroku_98371f7bb084e1f?reconnect=true

  print(pool.hashCode());
  // execute a query to get all usernames and corr. passwords
  //var results = await pool.query('select username from test');

  // print all the results
  /*results.forEach((row) {
    print('Username: ${row[0]}, Password: ${row[1]}');
  });*/

  /*pool.getConnection();
  pool.ping();

  var results = pool.query('select name, email from users');

  results.forEach((row) {
    querySelector('#text').text = 'Name: ${row[0]}, email: ${row[1]}';
  });*/
}
