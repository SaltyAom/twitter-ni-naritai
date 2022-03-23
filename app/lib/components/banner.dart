import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrouter/vrouter.dart';

class ProfileBanner extends HookConsumerWidget {
  const ProfileBanner({
    Key? key,
    this.cover =
        "https://pbs.twimg.com/profile_banners/1014472751883563008/1560084671/1500x500",
    this.image =
        "https://pbs.twimg.com/profile_images/1501586627906338818/0WKZDMPZ_400x400.jpg",
    required this.scrollController,
    required this.child,
    required this.name,
    required this.totalTweet,
  }) : super(key: key);

  final String cover;
  final String image;
  final ScrollController scrollController;
  final Widget child;
  final String name;
  final int totalTweet;

  static const _ratio = 3 / 1;
  static const _appBarHeight = 48.0;
  static const _profileSize = 72.0;
  static const _profileSmallSize = 48.0;
  static const _blurEffect = 16.0;
  static const _blackOpacity = 0.3;
  static const _titleHeight = 60;

  static _roundPercent(double v) {
    double percent = v;

    if (percent < 0) {
      percent = 0;
    } else if (percent > 1) {
      percent = 1;
    }

    return percent;
  }

  @override
  build(context, ref) {
    final query = MediaQuery.of(context);
    final width = query.size.width;
    final height = width / _ratio;
    final safeTop = query.padding.top;
    final minHeight = _appBarHeight + safeTop;
    final nameStart = minHeight;
    final nameStop = minHeight + _titleHeight;

    final appBarHeight = useState<double>(height);
    final appBarTop = useState<double>(0);
    final showTopAppBar = useState(false);
    final profileSize = useState(_profileSize);
    final profileMargin = useState(0.0);
    final effectPercent = useState(0.0);
    final titleMargin = useState(0.0);

    useEffect(() {
      scrollController.addListener(() {
        final offset = scrollController.offset;
        appBarTop.value = offset;

        final newHeight = height - offset;

        if (newHeight < minHeight) {
          appBarHeight.value = minHeight;
          showTopAppBar.value = true;
        } else {
          appBarHeight.value = newHeight;
          showTopAppBar.value = false;
        }

        final percent =
            _roundPercent((newHeight - minHeight) / (height - minHeight));

        profileSize.value =
            _profileSize - ((1 - percent) * (_profileSize - _profileSmallSize));

        profileMargin.value = _profileSize - profileSize.value;

        effectPercent.value =
            _roundPercent((offset - nameStart) / (nameStop - nameStart));

        titleMargin.value =
            _appBarHeight - (_appBarHeight * effectPercent.value);
      });

      return () {};
    }, []);

    return n.Stack([
      n.Image.network(cover)
        ..cover
        ..w = width
        ..h = appBarHeight.value
        ..useParent((v) => v..top = appBarTop.value),
      n.Column([
        n.Box()
          ..fullSize
          ..ratio = _ratio,
        n.Row([
          n.Button.outlined(const Text("Edit"))..rounded,
        ])
          ..mainEnd
          ..pt = 4
          ..px = 16,
        child,
      ])
        ..freezed,
      n.Image.network(image)
        ..w = profileSize.value
        ..h = profileSize.value
        ..rounded
        ..useParent((p0) => p0
          ..p = 4
          ..bg = Colors.white
          ..rounded
          ..mt = (profileMargin.value) + height + 4 - 30
          ..ml = 16 - 4),
      if (showTopAppBar.value)
        n.Image.network(cover)
          ..cover
          ..w = width
          ..h = minHeight
          ..useParent((v) => v..top = appBarTop.value),
      if (showTopAppBar.value)
        n.Column([
          n.Column([
            n.Text(name)
              ..color = Colors.white
              ..w800
              ..fontSize = 18
              ..mt = titleMargin.value,
            n.Text("$totalTweet Tweet")
              ..color = Colors.white
              ..w500
              ..fontSize = 14,
          ])
            ..useParent((p0) => p0..opacity = effectPercent.value),
        ])
          ..useParent((v) => v
            ..useScrollView(
              scrollPhysics: const NeverScrollableScrollPhysics(),
            ))
          ..center
          ..w = width
          ..h = _appBarHeight
          ..pt = safeTop
          ..useParent((v) => v
            ..bgBlur = _blurEffect * effectPercent.value
            ..bg = Colors.black.withOpacity(_blackOpacity * effectPercent.value)
            ..rect
            ..top = appBarTop.value),
      n.Row([
        n.IconButton(Icons.arrow_back)
          ..color = Colors.white
          ..onPressed = () {
            context.vRouter.historyBack();
          }
          ..iconSize = 24
          ..p = 8,
        n.IconButton(Icons.search)
          ..color = Colors.white
          ..onPressed = () {}
          ..iconSize = 24
          ..p = 8,
      ])
        ..spaceBetween
        ..w = width
        ..pt = safeTop
        ..useParent((v) => v..top = appBarTop.value),
    ]);
  }
}
