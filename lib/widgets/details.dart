import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:manga_ui/widgets/video_player.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Details extends StatefulWidget {
  final movie;

  const Details({this.movie});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.keyboard_backspace,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            pinned: true,
            floating: false,
            elevation: 0.0,
            expandedHeight: 220,
            flexibleSpace: FlexibleSpaceBar(
              //   collapseMode: CollapseMode.parallax,
              title: Text(
                widget.movie.title,
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w900),
              ),
              background: Stack(
                overflow: Overflow.visible,
                children: [
                  Hero(
                    tag: widget.movie.id,
                    child: CachedNetworkImage(
                      imageUrl: widget.movie.posterImage,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Center(
                        child: Center(
                          child: SpinKitRipple(
                            size: 50,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Center(
                        child: Icon(
                          Icons.error_outlined,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 180.0,
                    right: 20.0,
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(context, CupertinoPageRoute(builder:(_)=>VideoScreen(videoUrl: widget.movie?.youtubeId ?? "",)));
                      },
                      tooltip: 'Play',
                      backgroundColor: Theme.of(context).accentColor,
                      child: Center(
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index > 0) return null;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 25.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.movie.averageRating == null
                              ? Text('1.0')
                              : Text(
                                  (double.parse(widget.movie?.averageRating ??
                                              20) /
                                          10 /
                                          2)
                                      .toStringAsFixed(2),
                                  style: TextStyle(fontWeight: FontWeight.w900),
                                ),
                          SizedBox(width: 2.0),
                          SmoothStarRating(
                            rating: widget.movie.averageRating == null
                                ? 0.1
                                : (double.parse(widget.movie?.averageRating ??
                                            20.0) /
                                        10) /
                                    2,
                            allowHalfRating: true,
                            onRated: (v) {},
                            starCount: 5,
                            size: 14.0,
                            isReadOnly: true,
                            color: Theme.of(context).accentColor,
                            borderColor: Theme.of(context).accentColor,
                            spacing: 0.0,
                          )
                        ],
                      ),
                      SizedBox(height: 5.0),
                      ListTile(
                        title: Text(
                          'overview'.toUpperCase(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(widget.movie.description),
                      ),
                      SizedBox(height: 5.0),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Age Rating:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17.0),
                          ),
                          SizedBox(width: 2.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              widget.movie?.ageRatingGuide ?? "1+",
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 5.0),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Episodes:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17.0),
                          ),
                          SizedBox(width: 2.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3.0),
                            child: widget.movie.episodeCount == null
                                ? Text(
                                    'Still-Filming',
                                    style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                : Text(
                                    widget.movie.episodeCount.toString(),
                                    style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Released Date:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17.0),
                          ),
                          SizedBox(width: 2.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3.0),
                            child: widget.movie.endDate == null
                                ? Text('Not Available')
                                : Text(
                                    DateFormat("dd/MM/yy").format(
                                      DateTime.parse(widget.movie.endDate),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                      ListTile(
                        title: widget.movie.averageRating == null
                            ? Text(
                                'Popularity Rank 0.0%',
                                style: TextStyle(fontWeight: FontWeight.w900),
                              )
                            : Text(
                                "Popularity Rank".toUpperCase() +
                                    "  ${widget.movie.averageRating.toString()}%",
                                style: TextStyle(fontWeight: FontWeight.w900),
                              ),
                        subtitle: Padding(
                          padding: const EdgeInsets.symmetric(vertical:5.0),
                          child: LinearPercentIndicator(
                            animation: true,
                            lineHeight: 15.0,
                            animationDuration: 2500,
                            percent: widget.movie.averageRating == null
                                ? 0.0
                                : (double.parse(
                                            widget.movie?.averageRating ?? 10) /
                                        100)
                                    .toDouble(),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
