import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.selectedPageIndex,
    required this.onSelect,
  });

  final int selectedPageIndex;
  final Function(int) onSelect;

  @override
  Widget build(BuildContext context) {
    final barheight = MediaQuery.sizeOf(context).height * 0.06;
    final style = Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: 10,
          fontWeight: FontWeight.bold,
        );

    return BottomAppBar(
      color: selectedPageIndex == 0 ? Colors.black : Colors.white,
      child: SizedBox(
        height: barheight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _bottomNavBarItem(0, 'Home', style, Icons.home_outlined),
            _bottomNavBarItem(1, 'Discover', style, Icons.search_outlined),
            _addVideoNavItem(barheight),
            _bottomNavBarItem(2, 'Inbox', style, Icons.inbox_outlined),
            _bottomNavBarItem(3, 'Profile', style, Icons.person_2_outlined),
          ],
        ),
      ),
    );
  }

  _bottomNavBarItem(
    int index,
    String label,
    TextStyle textStyle,
    IconData icon,
  ) {
    bool isSelected = selectedPageIndex == index;
    Color iconAndTextColor = isSelected ? Colors.black : Colors.grey;

    if (isSelected && selectedPageIndex == 0) {
      iconAndTextColor = Colors.white;
    }

    return Expanded(
      child: InkWell(
        onTap: () => onSelect(index),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconAndTextColor),
            const SizedBox(height: 3),
            Text(
              label,
              style: textStyle.copyWith(color: iconAndTextColor),
            ),
          ],
        ),
      ),
    );
  }

  _addVideoNavItem(double height) {
    return Center(
      child: Container(
        height: height - 15,
        width: 48,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blueAccent,
              Colors.redAccent,
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Center(
          child: Container(
            width: 41,
            height: height - 15,
            decoration: BoxDecoration(
              color: selectedPageIndex == 0 ? Colors.white : Colors.black,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Icon(
              Icons.add,
              color: selectedPageIndex == 0 ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
