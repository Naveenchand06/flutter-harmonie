import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_player/app/common/widgets/app_background.dart';
import 'package:music_player/app/common/widgets/app_banner.dart';
import 'package:music_player/app/common/widgets/app_error_widget.dart';
import 'package:music_player/app/common/widgets/app_loader.dart';
import 'package:music_player/app/features/home/repository/songs_list_repository.dart';
import 'package:music_player/app/features/home/screens/song_screen.dart';
import 'package:music_player/app/features/home/widgets/song_item.dart';
import 'package:music_player/utils/constants/app_strings.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(songsListProvider.notifier).getSongsList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final songsList = ref.watch(songsListProvider);

    return Scaffold(
      backgroundColor: Colors.green.shade300,
      body: SingleChildScrollView(
        child: AppBackground(
          child: Padding(
            padding: EdgeInsets.all(0.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(child: getAppBar(context, ref)),
                SizedBox(height: 10.h),
                InkWell(
                  onTap: () {
                    ref.read(songsListProvider.notifier).getSongsList();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "${getGreeting()}.",
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ),
                ),
                if (songsList.isLoading)
                  Container(
                    margin: EdgeInsets.only(top: 80.sp),
                    child: const AppLoader(),
                  )
                else if (songsList.error != null)
                  const AppErrorWidget()
                else
                  Expanded(
                    child: ListWheelScrollView(
                      itemExtent: 100.0,
                      diameterRatio: 2.4,
                      physics: const BouncingScrollPhysics(),
                      children: songsList.result!
                          .map(
                            (e) => SongItemWidget(
                              song: e,
                              onPress: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => SongScreen(
                                      song: e,
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                          .toList(),
                    ),
                  )
                // else
                //   Expanded(
                //     child: ListView.separated(
                //       itemCount: songsList.result != null
                //           ? songsList.result!.length
                //           : 0,
                //       shrinkWrap: true,
                //       separatorBuilder: (context, index) {
                //         return SizedBox(height: 10.h);
                //       },
                //       itemBuilder: (context, index) {
                //         return SongItemWidget(
                //           song: songsList.result![index],
                //           onPress: () {
                //             Navigator.of(context).push(
                //               MaterialPageRoute(
                //                 builder: (context) => SongScreen(
                //                   song: songsList.result![index],
                //                 ),
                //               ),
                //             );
                //           },
                //         );
                //       },
                //     ),
                //   ),
              ],
            ),
          ),
        ),
      ),
      // Center(
      //   child: GestureDetector(
      //     onTap: () {
      //       ref.read(themeProvider.notifier).toggleTheme();
      //       ref.read(authStateProvider.notifier).logOut();
      //     },
      //     child: Text(
      //       "All is well",
      //       style: Theme.of(context).textTheme.headlineLarge,
      //     ),
      //   ),
      // ),
    );
  }

  String getGreeting() {
    final now = DateTime.now();
    final hour = now.hour;

    if (hour < 12) {
      return AppStrings.goodMorning;
    } else if (hour < 17) {
      return AppStrings.goodAfternoon;
    } else if (hour < 20) {
      return AppStrings.goodEvening;
    } else {
      return AppStrings.goodNight;
    }
  }
}
