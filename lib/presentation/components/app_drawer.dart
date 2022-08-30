import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/presentation/controllers/cubit/app_moode_cubit.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              trailing: IconButton(
                icon: const Icon(Icons.brightness_4_outlined),
                onPressed: () {
                  BlocProvider.of<AppMoodeCubit>(context).changeAppMode();
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: Text(
                'Favourite Locations',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              trailing: const Icon(Icons.info_outline),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.location_on, size: 16),
              title: Text(
                'weather.cityName'.toUpperCase(),
                softWrap: true,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.circle_rounded,
                    color: Colors.yellow,
                  ),
                  Text(
                    '33°',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
              onTap: () {},
            ),
            const Divider(
              thickness: 2,
            ),
            ListTile(
              leading: Icon(Icons.add_location_outlined),
              title: Text(
                'Other Locations',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: SizedBox(),
              title: Text(
                'Saint Cathrine',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.circle_rounded,
                    color: Colors.yellow,
                  ),
                  Text(
                    '29°',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
              onTap: () {},
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                // style: ElevatedButton.styleFrom(
                //   // Foreground color
                //   onPrimary: Theme.of(context).colorScheme.onSecondaryContainer,
                //   // Background color
                //   primary: Theme.of(context).colorScheme.secondaryContainer,
                // ).copyWith(
                //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //         RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(18.0),
                //     )),
                //     elevation: ButtonStyleButton.allOrNull(0.0)),
                onPressed: () {},
                child: const Text('Manage Locations'),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text(
                'Report Wrong Location',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.call_outlined),
              title: Text(
                'Contact us',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
