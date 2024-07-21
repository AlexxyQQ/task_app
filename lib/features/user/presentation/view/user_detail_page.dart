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
      BlocProvider.of<PhotoCubit>(context).getAllPhotosOfUser(userId: userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoCubit, PhotoState>(
      builder: (context, photoState) {
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
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 12.h,
                        ),
                        child: _userDetails(userSate),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      albumState.isLoading
                          ? _loadingAlbumsSkeleton()
                          : _albums(albumState),
                      SizedBox(
                        height: 20.h,
                      ),
                      // Photos
                      photoState.isLoading
                          ? _loadingPhotosSkeleton()
                          : _photos(
                              photoState,
                            ),
                    ],
                  ),
                );
              },
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

  _loadingAlbumsSkeleton() {
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

  _photos(PhotoState state) {
    // Grid of photos
    return Expanded(
      // height: 0.5.sh,
      // width: 1.sw,
      child: RefreshIndicator(
        onRefresh: () async {
          final userId =
              BlocProvider.of<UserCubit>(context).state.selectedUser?.id;
          if (userId != null) {
            BlocProvider.of<PhotoCubit>(context)
                .getAllPhotosOfUser(userId: userId);
          }
        },
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 8.h,
          ),
          itemCount: state.userPhotos.length,
          itemBuilder: (context, index) {
            return Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                color: AppColors(inverseDarkMode: true).primaryContainer,
              ),
              child: Image.network(
                state.userPhotos[index].url ?? '',
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  }
                },
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return Icon(Icons.error);
                },
              ),
            );
          },
        ),
      ),
    );
  }

  _loadingPhotosSkeleton() {
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
        itemCount: 15,
        itemBuilder: (context, index) {
          return Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
              color: PrimitiveColors.grey800,
            ),
            child: Center(
                child: Container(
              width: 50.w,
              height: 16.h,
              color: PrimitiveColors.grey800,
            )),
          );
        },
      ),
    );
  }
}
