import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:animated_background/animated_background.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:random_color/random_color.dart';

void main() => runApp(MaterialApp(home: CB()));

class CB extends StatefulWidget {
  @override
  CBS createState() => CBS();
}

RandomColor rc = RandomColor();
List<String> all = List.generate(21, (i) => "images/${i + 1}.png");

class Stk {
  Offset sfp, po, o;
  double ps = 1.25, ns = 1.25;
  int c, id;
  bool st = true;
  String t = 'Hello';
  Color txc = Colors.black;
  Stk({this.o, this.c, this.id, this.st});
}

class CBS extends State<CB> with TickerProviderStateMixin {
  GlobalKey krb = GlobalKey();
  Map<int, Stk> ss = Map();
  var cnt = 0;
  int r = -1;
  Color bg = Colors.orange;
  sb() => SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
          child: Column(
        children: [
          sb(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ic(Icons.text_fields, f: () {
                as(-1);
              }),
              ic(Icons.autorenew, f: () {
                ss.clear();
                st();
              }),
              ic(Icons.share, f: share),
            ],
          ),
          sb(),
          Expanded(
            child: RepaintBoundary(
              key: krb,
              child: GestureDetector(
                onTap: () {
                  bg = rc.randomColor();
                  st();
                },
                child: Container(
                  color: bg,
                  child: AnimatedBackground(
                    behaviour: RandomParticleBehaviour(),
                    vsync: this,
                    child: Stack(
                      children: ss.values.map((s) => cst(s)).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 100,
            color: Colors.black12,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: all.map((p) => si(p)).toList(),
            ),
          ),
        ],
      )),
    );
  }

  share() async {
    r = -1;
    st();
    RenderRepaintBoundary sf = rb();
    var d = await (await sf.toImage(pixelRatio: 3))
        .toByteData(format: ImageByteFormat.png);
    await EsysFlutterShare.shareImage('t.png', d, 'Share');
  }

  Widget cst(Stk s) {
    var h = (s.c == -1 ? 70 : 200) * s.ns;
    return Positioned(
      left: s.o.dx,
      top: s.o.dy,
      child: GestureDetector(
        onScaleStart: (d) => hss(d, s),
        onScaleUpdate: (d) => hsu(d, s),
        onTap: () => !s.st ? tc(s) : 0,
        onDoubleTap: () async {
          if (s.st) return;
          ss[s.id]?.t = await dlg(context, s.t) ?? s.t;
          st();
        },
        onLongPress: () {
          r == s.id ? r = -1 : r = s.id;
          st();
        },
        child: Container(
          height: h + 80,
          child: Column(
            children: [
              aso(s),
              ds(s, h),
            ],
          ),
        ),
      ),
    );
  }

  Widget ds(Stk s, double h) => s.st
      ? Image.asset('${all[s.c]}', height: h, fit: BoxFit.fitHeight)
      : Text(s.t,
          style: TextStyle(
              fontSize: h * 0.8, fontWeight: FontWeight.bold, color: s.txc));

  tc(Stk s) {
    s.txc = rc.randomColor();
    st();
  }

  Widget aso(Stk s) => r == s.id
      ? ic(Icons.remove_circle, f: () => rs(s), c: Colors.red)
      : Container();
  RenderBox rb() => krb?.currentContext?.findRenderObject();
  st() => setState(() {});

  hss(ScaleStartDetails d, Stk s) {
    s.sfp = d.focalPoint;
    s.po = s.o;
    s.ps = s.ns;
  }

  hsu(ScaleUpdateDetails d, Stk s) {
    double ns = s.ps * d.scale;
    if (ns < 0.5) return;
    final Offset nmo = (s.sfp - s.po) / s.ps, no = d.focalPoint - nmo * ns;
    ss[s.id].ns = ns;
    ss[s.id].o = no;
    st();
  }

  rs(Stk s) {
    ss.remove(s.id);
    st();
  }

  as(int i) {
    Size sz = rb().size;
    double sh = 250, sw = sh / 2;
    Offset p = Offset((sz.width - sw) / 2, (sz.height - sh) / 2);
    ss[cnt] = Stk(o: p, c: i, id: cnt, st: i != -1);
    cnt++;
    st();
  }

  Widget si(String p) => MaterialButton(
      onPressed: () => as(all.indexOf(p)), child: Image.asset(p, width: 80));

  Widget ic(IconData d, {var f, Color c = Colors.white}) =>
      IconButton(icon: Icon(d, color: c), onPressed: f);

  Future<String> dlg(BuildContext c, String t) async {
    final cl = TextEditingController(text: t);
    return showDialog<String>(
      context: c,
      builder: (BuildContext ct) => AlertDialog(
          backgroundColor: bg,
          content: TextField(
              autofocus: true, controller: cl, onChanged: (v) => t = v),
          actions: [ic(Icons.done, f: () => Navigator.of(ct).pop(t))]),
    );
  }
}
