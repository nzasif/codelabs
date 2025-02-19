// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../models/data.dart' as data;
import '../models/user.dart';
import 'email_widget.dart';
import 'search_bar.dart';

class EmailListView extends StatelessWidget {
  const EmailListView({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
    required this.currentUser,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView(
        children: [
          const Padding(padding: EdgeInsets.only(bottom: 8.0)),
          SearchBar(currentUser: currentUser),
          const Padding(padding: EdgeInsets.only(bottom: 8.0)),
          ...List.generate(data.emails.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: EmailWidget(
                email: data.emails[index],
                onSelected: () {
                  onSelected(index);
                },
                selected: selectedIndex == index,
              ),
            );
          }),
        ],
      ),
    );
  }
}
