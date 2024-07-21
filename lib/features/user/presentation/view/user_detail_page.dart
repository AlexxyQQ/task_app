import 'package:task_app/core/common/exports.dart';

class UserDetailPage extends StatefulWidget {
  const UserDetailPage({super.key});

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  @override
  void initState() {
    super.initState();
    final userId = BlocProvider.of<UserCubit>(context).state.selectedUser?.id;
    if (userId != null) {
      BlocProvider.of<AlbumCubit>(context).getAllAlbumOfUser(userId: userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumCubit, AlbumState>(
      builder: (context, albumState) {
        return BlocBuilder<UserCubit, UserState>(
          builder: (context, userSate) {
            return Scaffold(
              appBar: CustomAppBar(
                title: userSate.selectedUser?.username.toTitleCase(
                      nullValue: 'N/A',
                    ) ??
                    '',
              ),
              body: Column(
                children: [
                  _userDetails(userSate),
                  SizedBox(
                    height: 20.h,
                  ),
                  // Albums
                  albumState.isLoading
                      ? _loadingAlbumsSkeleton(
                          albumState,
                        )
                      : _albums(albumState),
                  SizedBox(
                    height: 20.h,
                  ),
                  // Photos
                  _photos(),
                ],
              ),
            );
          },
        );
      },
    );
  }

  _userDetails(UserState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            // User Avatar
            Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                color: AppColors(inverseDarkMode: true).primaryContainer,
                borderRadius: BorderRadius.circular(500.r),
              ),
              child: Center(
                child: Text(
                  state.selectedUser?.username
                          ?.substring(0, 1)
                          .toTitleCase(nullValue: "U") ??
                      'U',
                  style: AllTextStyle.f32W8.copyWith(
                    color: PrimitiveColors.grey1000,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 50.w,
            ),
            // Albums Count
            Column(
              children: [
                Text(
                  "50",
                  style: AllTextStyle.f18W6.copyWith(
                    color: PrimitiveColors.grey100,
                  ),
                ),
                Text(
                  "Albums",
                  style: AllTextStyle.f14W4.copyWith(
                    color: PrimitiveColors.grey300,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 50.w,
            ),
            // Todo Count
            Column(
              children: [
                Text(
                  "50",
                  style: AllTextStyle.f18W6.copyWith(
                    color: PrimitiveColors.grey100,
                  ),
                ),
                Text(
                  "Todos",
                  style: AllTextStyle.f14W4.copyWith(
                    color: PrimitiveColors.grey300,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        // Name
        Text(
          state.selectedUser?.name.toTitleCase(
                nullValue: 'N/A',
              ) ??
              '',
          style: AllTextStyle.f18W6.copyWith(
            color: PrimitiveColors.grey0,
          ),
        ),
      ],
    );
  }

  _albums(AlbumState state) {
    return SizedBox(
      height: 120.h,
      width: 1.sw,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              BlocProvider.of<AlbumCubit>(context).selectAlbum(
                album: state.userAlbums[index],
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Album Cover
                Container(
                  margin: EdgeInsets.only(
                    right: 12.w,
                  ),
                  width: 80.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                    color: AppColors(inverseDarkMode: true).primaryContainer,
                    borderRadius: BorderRadius.circular(500.r),
                  ),
                  child: Center(
                    child: Text(
                      state.userAlbums[index].title
                              ?.substring(0, 1)
                              .toTitleCase(nullValue: "A") ??
                          'A',
                      style: AllTextStyle.f32W6.copyWith(
                        color: PrimitiveColors.grey1000,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                // Album Name
                SizedBox(
                  width: 80.w,
                  child: Text(
                    state.userAlbums[index].title.toTitleCase(
                      nullValue: 'N/A',
                    ),
                    overflow: TextOverflow.ellipsis,
                    style: AllTextStyle.f14W6.copyWith(
                      color: PrimitiveColors.grey0,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _loadingAlbumsSkeleton(AlbumState state) {
    return SizedBox(
      height: 120.h,
      width: 1.sw,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Album Cover
              Container(
                margin: EdgeInsets.only(
                  right: 12.w,
                ),
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                  color: PrimitiveColors.grey800,
                  borderRadius: BorderRadius.circular(500.r),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              // Album Name
              Container(
                width: 50.w,
                height: 16.h,
                color: PrimitiveColors.grey800,
              ),
            ],
          );
        },
      ),
    );
  }

  _photos() {
    // Grid of photos
    return Expanded(
      // height: 0.5.sh,
      // width: 1.sw,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.w,
          mainAxisSpacing: 8.h,
        ),
        itemCount: 80,
        itemBuilder: (context, index) {
          return Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
              color: AppColors(inverseDarkMode: true).primaryContainer,
            ),
            child: Center(
              child: Text(
                "Photo $index",
                style: AllTextStyle.f14W6.copyWith(
                  color: PrimitiveColors.grey1000,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
