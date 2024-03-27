import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_player/app/common/widgets/app_background.dart';
import 'package:music_player/app/common/widgets/app_error_widget.dart';
import 'package:music_player/app/common/widgets/app_loader.dart';
import 'package:music_player/app/common/widgets/app_search_field.dart';
import 'package:music_player/app/features/authentication/repository/auth_repository.dart';
import 'package:music_player/app/features/home/models/song_model.dart';
import 'package:music_player/app/features/home/repository/songs_list_repository.dart';
import 'package:music_player/app/features/home/screens/song_screen.dart';
import 'package:music_player/app/features/home/widgets/song_item.dart';
import 'package:music_player/core/theme/app_colors.dart';
import 'package:music_player/utils/constants/app_strings.dart';
import 'package:music_player/utils/dialogs/logout_dialog.dart';
import 'package:music_player/utils/dialogs/models/alert_dialog_model.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _showSearch = false;
  double _textFieldWidth = 0.0;
  bool showSearchField = false;
  final TextEditingController _searchController = TextEditingController();

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
                SizedBox(height: 6.h),
                SafeArea(child: getAppBar(context, ref)),
                InkWell(
                  onTap: () {},
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
                else if (songsList.result != null)
                  Expanded(
                    child: ListWheelScrollView(
                      itemExtent: 100.0,
                      diameterRatio: 2.4,
                      physics: const BouncingScrollPhysics(),
                      children: _searchController.text.isEmpty
                          ? (songsList.result!)
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
                              .toList()
                          : getSearchResult(songsList.result!)
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
                else
                  Container(
                    margin: EdgeInsets.only(top: 50.h),
                    child: const AppErrorWidget(),
                  )
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

  Widget getAppBar(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          // ImageUtil.loadAssetImage(
          //   path: ImagePath.logoPath,
          //   height: 30.h,
          // ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            width: _textFieldWidth,
            height: 40.h,
            child: AppSearchField(
              controller: _searchController,
              show: _showSearch,
              onSubmit: (val) {},
              onChange: (val) {
                setState(() {});
              },
              hint: "Search",
            ),
          ),
          IconButton(
            onPressed: () {
              _textFieldWidth = 260.w;
              _searchController.clear();
              _showSearch = !_showSearch;
              setState(() {});
            },
            icon: Icon(
              _showSearch ? Icons.close : Icons.search,
              color: AppColor.white,
            ),
          ),
          IconButton(
            onPressed: () async {
              final logout =
                  await const LogoutDialog().present(context) ?? false;
              if (logout) {
                ref.read(authStateProvider.notifier).logOut();
              }
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: AppColor.white,
            ),
          ),
        ],
      ),
    );
  }

  List<SongModel> getSearchResult(List<SongModel> songsList) {
    String searchTerm = _searchController.text.toLowerCase();
    return songsList
        .where((element) =>
            (element.name!.toLowerCase().contains(searchTerm)) ||
            element.authorName!.toLowerCase().contains(searchTerm))
        .toList();
  }
}
