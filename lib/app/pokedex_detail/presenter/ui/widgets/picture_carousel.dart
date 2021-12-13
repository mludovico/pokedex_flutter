import 'package:flutter/material.dart';
import 'package:pokedex/app/pokedex_detail/domain/entities/pokemon.dart';

class PictureCarousel extends StatefulWidget {
  final Pokemon pokemon;
  PictureCarousel({Key? key, required this.pokemon}) : super(key: key);

  @override
  _PictureCarouselState createState() => _PictureCarouselState();
}

class _PictureCarouselState extends State<PictureCarousel> {
  final controller = ScrollController();
  int offset = 0;

  @override
  Widget build(BuildContext context) {
    final availableWidth = MediaQuery.of(context).size.width - 48;
    print(widget.pokemon.types);
    print(widget.pokemon.sprites);
    return SizedBox(
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ListView(
            controller: controller,
            physics: PageScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemExtent: availableWidth,
            children: [
              Image.network(
                widget.pokemon.sprites!.main!,
                fit: BoxFit.fitHeight,
              ),
              Image.network(
                widget.pokemon.sprites!.back!,
                fit: BoxFit.fitHeight,
              ),
              Image.network(
                widget.pokemon.sprites!.front!,
                fit: BoxFit.fitHeight,
              ),
            ],
          ),
          offset == 0
              ? Container()
              : Positioned(
                  left: 0,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        offset--;
                      });
                      controller.animateTo(
                        availableWidth * offset,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.fastOutSlowIn,
                      );
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
          offset == 2
              ? Container()
              : Positioned(
                  right: 0,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        offset++;
                      });
                      controller.animateTo(
                        availableWidth * offset,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.fastOutSlowIn,
                      );
                    },
                    icon: Icon(Icons.arrow_forward),
                  ),
                ),
        ],
      ),
    );
  }
}
