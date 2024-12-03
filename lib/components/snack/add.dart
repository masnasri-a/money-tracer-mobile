import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';

enum ToastType {
  success,
  error,
  warning,
  info,
}

class Snack {
  static void add(BuildContext context) {
    CurrencyTextFieldController controller = CurrencyTextFieldController(
      currencySymbol: 'Rp. ',
      startWithSeparator: false,
    );

    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10),
                    const TextField(
                      autocorrect: false,
                      autofocus: true,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 8, 61, 119),
                      ),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Enter Transaction Name',
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 8, 61, 119),
                        ),
                        focusColor: Color.fromARGB(255, 8, 61, 119),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          int selectedIndex = -1;
                          return Row(
                            children: List.generate(5, (index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: GFButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedIndex = index;
                                      print(selectedIndex);
                                    });
                                  },
                                  text: [
                                    'Eat',
                                    'Transport',
                                    'WFC',
                                    'Primary',
                                    'Other'
                                  ][index],
                                  icon: [
                                    const Icon(Icons.fastfood_sharp,
                                        color: Colors.white, size: 15),
                                    const Icon(Icons.bike_scooter_sharp,
                                        color: Colors.white, size: 15),
                                    const Icon(Icons.coffee_sharp,
                                        color: Colors.white, size: 15),
                                    const Icon(
                                        Icons.account_balance_wallet_sharp,
                                        color: Colors.white,
                                        size: 15),
                                    const Icon(Icons.more_horiz_sharp,
                                        color: Colors.white, size: 15),
                                  ][index],
                                  shape: GFButtonShape.pills,
                                    color: selectedIndex == index
                                      ? GFColors.FOCUS
                                      : GFColors.PRIMARY,
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: controller,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: const InputDecoration(
                        focusColor: Color.fromARGB(255, 8, 61, 119),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'Rp. 0',
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: GFButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: 'Add Transaction',
                        borderShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                        color: Color.fromARGB(255, 8, 61, 119),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ));
  }
}
