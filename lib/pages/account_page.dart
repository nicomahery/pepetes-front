import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:pepetes/entities/account.dart';
import 'package:pepetes/utils/StaticValues.dart';

class AccountPage extends StatelessWidget {
  final Account account;

  AccountPage({required this.account});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(flex: 4),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Balance',
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 20
                ),
              ),
              Text(
                '${NumberFormat.currency(locale: "fr_FR", symbol: "EUR")
                    .format(this.account.getAccountBalance())}',
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
          Spacer(flex: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 1),
              DataTable(
                columns: const <DataColumn>[
                  DataColumn(label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Details', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Amount', style: TextStyle(fontWeight: FontWeight.bold))),
                ],
                  rows: List<DataRow>.generate(
                      this.account.transactions.length,
                      (int index) => DataRow(
                        color: MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              if (!index.isEven) {
                                return Colors.indigo.withOpacity(0.1);
                              }
                              return null;
                            }
                        ),
                        cells: <DataCell>[
                          DataCell(Text(DateFormat(DEFAULT_DATE_FORMAT)
                              .format(this.account.transactions[index].dateTime))),
                          DataCell(Text(this.account.transactions[index].label)),
                          DataCell(Text(NumberFormat.currency(
                              locale: "fr_FR", symbol: "€").format(
                              this.account.transactions[index].amount).padLeft(11),
                              textAlign: TextAlign.right,
                              style: TextStyle(

                              ),
                            ),
                            
                          ),
                        ]
                      )
                  )
              ),
              Spacer(flex: 1)
            ],
          ),
          Spacer(flex: 20)
        ],
      ),
    );
  }
}
