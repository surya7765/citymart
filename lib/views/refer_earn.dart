import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'dart:ui' as ui;
import 'package:flutter_svg/flutter_svg.dart';

class ReferEarn extends StatelessWidget {
  ReferEarn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff39383a),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: -1.0, end: 1.0),
            Pin(size: 610.0, start: 0.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
                color: const Color(0xff457862),
                border: Border.all(width: 1.0, color: const Color(0xff457862)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 260.0, start: 50.0),
            Pin(size: 74.0, start: 60.0),
            child: BlendMask(
              blendMode: BlendMode.multiply,
              child: Text(
                'Refer your friends\nand Earn',
                style: TextStyle(
                  fontFamily: 'Cambria',
                  fontSize: 32,
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 139.0, middle: 0.5018),
            Pin(size: 172.0, middle: 0.2348),
            child:
                // Adobe XD layer: 'gift (2)' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/gift.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 64.0, middle: 0.4451),
            Pin(size: 42.0, middle: 0.4326),
            child: Text(
              '100',
              style: TextStyle(
                fontFamily: 'Cambria',
                fontSize: 32,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 178.0, middle: 0.42),
            Pin(size: 37.0, middle: 0.486),
            child: Text(
              'Loyal Points',
              style: TextStyle(
                fontFamily: 'Cambria',
                fontSize: 26,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 14.0, end: 16.0),
            Pin(size: 42.0, middle: 0.5502),
            child: Text(
              'Your friend get 100 points on SignUp\nand you get 100 points too everytime you share',
              style: TextStyle(
                fontFamily: 'Cambria',
                fontSize: 14,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 194.0, middle: 0.4303),
            Pin(size: 42.0, middle: 0.6213),
            child: ClipRect(
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border:
                        Border.all(width: 1.0, color: const Color(0xff707070)),
                  ),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 78.0, middle: 0.3371),
            Pin(size: 21.0, middle: 0.6225),
            child: Text(
              'ABCD123',
              style: TextStyle(
                fontFamily: 'Cambria',
                fontSize: 18,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 86.0, middle: 0.3281),
            Pin(size: 15.0, middle: 0.6017),
            child: Text(
              'your referral code',
              style: TextStyle(
                fontFamily: 'Cambria',
                fontSize: 10,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 1.0, middle: 0.5023),
            Pin(size: 23.0, middle: 0.6174),
            child: SvgPicture.string(
              _svg_k48zit,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 32.0, middle: 0.5765),
            Pin(size: 24.0, middle: 0.6187),
            child: Text(
              'Copy\nCode',
              style: TextStyle(
                fontFamily: 'Cambria',
                fontSize: 10,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 19.7, middle: 0.6725),
            Pin(size: 20.0, middle: 0.6181),
            child:
                // Adobe XD layer: 'Icon feather-copy' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 14.5, end: 0.0),
                  Pin(size: 14.4, end: 0.0),
                  child: SvgPicture.string(
                    _svg_watwi,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 14.9, start: 0.0),
                  Pin(size: 13.5, start: 0.0),
                  child: SvgPicture.string(
                    _svg_l6mxjm,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 100.0, start: 27.0),
            Pin(size: 36.0, middle: 0.7786),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: const Color(0xff00fe33),
                border: Border.all(width: 1.0, color: const Color(0xff00fe33)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x6600fe33),
                    offset: Offset(0, 3),
                    blurRadius: 5,
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 20.7, start: 36.3),
            Pin(size: 20.1, middle: 0.7735),
            child:
                // Adobe XD layer: 'Icon simple-whatsapp' (shape)
                SvgPicture.string(
              _svg_cldmqg,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 100.0, middle: 0.4963),
            Pin(size: 36.0, middle: 0.7786),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: const Color(0xff0057fe),
                border: Border.all(width: 1.0, color: const Color(0xff0057fe)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x660057fe),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 100.0, end: 28.0),
            Pin(size: 36.0, middle: 0.7786),
            child: SvgPicture.string(
              _svg_wbwkxb,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 25.5, middle: 0.4011),
            Pin(size: 20.2, middle: 0.7733),
            child:
                // Adobe XD layer: 'Icon awesome-telegr…' (shape)
                SvgPicture.string(
              _svg_uejq0q,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 23.5, middle: 0.7069),
            Pin(size: 23.4, middle: 0.7744),
            child:
                // Adobe XD layer: 'Icon awesome-instag…' (shape)
                SvgPicture.string(
              _svg_tvxqvj,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 62.0, middle: 0.1876),
            Pin(size: 16.0, middle: 0.773),
            child: Text(
              'WhatsApp',
              style: TextStyle(
                fontFamily: 'Cambria',
                fontSize: 12,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 60.0, middle: 0.5423),
            Pin(size: 16.0, middle: 0.772),
            child: Text(
              'Telegram',
              style: TextStyle(
                fontFamily: 'Cambria',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 65.0, end: 32.0),
            Pin(size: 16.0, middle: 0.772),
            child: Text(
              'Instagram',
              style: TextStyle(
                fontFamily: 'Cambria',
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 246.0, middle: 0.4948),
            Pin(size: 23.0, middle: 0.6946),
            child: Text(
              'Share your referral code via',
              style: TextStyle(
                fontFamily: 'Cambria',
                fontSize: 20,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 234.0, start: 5.0),
            Pin(size: 23.0, end: 109.0),
            child: Text(
              'Frequently asked questions',
              style: TextStyle(
                fontFamily: 'Cambria',
                fontSize: 20,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 96.0, start: 48.0),
            Pin(size: 16.0, end: 84.0),
            child: Text(
              'How it works?',
              style: TextStyle(
                fontFamily: 'Cambria',
                fontSize: 14,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 182.0, start: 50.0),
            Pin(size: 16.0, end: 63.0),
            child: Text(
              'Where can I get loyal points?',
              style: TextStyle(
                fontFamily: 'Cambria',
                fontSize: 14,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 142.0, start: 50.0),
            Pin(size: 16.0, end: 42.0),
            child: Text(
              'What is this program?',
              style: TextStyle(
                fontFamily: 'Cambria',
                fontSize: 14,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_k48zit =
    '<svg viewBox="214.5 515.5 1.0 23.0" ><path transform="translate(214.5, 515.5)" d="M 0 0 L 0 23" fill="none" stroke="#000000" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_watwi =
    '<svg viewBox="12.8 16.6 14.5 14.4" ><path transform="translate(-0.75, 3.14)" d="M 15.73744010925293 13.5 L 25.8059253692627 13.5 C 27.04162979125977 13.5 28.04336547851562 14.48930358886719 28.04336547851562 15.70966911315918 L 28.04336547851562 25.65318489074707 C 28.04336547851562 26.8735523223877 27.04162979125977 27.86285591125488 25.8059253692627 27.86285591125488 L 15.73744010925293 27.86285591125488 C 14.50173568725586 27.86285591125488 13.5 26.8735523223877 13.5 25.65318489074707 L 13.5 15.70966911315918 C 13.5 14.48930358886719 14.50173759460449 13.5 15.73744010925293 13.5 Z" fill="none" stroke="#000000" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_l6mxjm =
    '<svg viewBox="7.6 11.0 14.9 13.5" ><path transform="translate(4.63, 7.96)" d="M 6.431643486022949 16.53778076171875 L 5.28776216506958 16.53778076171875 C 4.024265766143799 16.53778076171875 3.000000238418579 15.60530948638916 3.000000238418579 14.45504570007324 L 3.000000238418579 5.082735538482666 C 3.000000238418579 3.932472229003906 4.024266719818115 2.999999523162842 5.287762641906738 3 L 15.58269023895264 3 C 16.84618759155273 3 17.87045288085938 3.932472705841064 17.87045288085938 5.082735538482666 L 17.87045288085938 6.12410306930542" fill="none" stroke="#000000" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_cldmqg =
    '<svg viewBox="39.3 648.2 20.7 20.1" ><path transform="translate(39.33, 648.17)" d="M 15.09897804260254 12.03547382354736 C 14.83924674987793 11.90994644165039 13.57423973083496 11.30993175506592 13.33866786956787 11.22708415985107 C 13.1030969619751 11.14256381988525 12.93051719665527 11.10155773162842 12.75793743133545 11.35261058807373 C 12.58794689178467 11.59947872161865 12.09264373779297 12.15932750701904 11.94336223602295 12.32502269744873 C 11.79235458374023 12.488205909729 11.64221000671387 12.50076007843018 11.38593006134033 12.38778591156006 C 11.12706089019775 12.26225852966309 10.29609107971191 11.99865245819092 9.31238842010498 11.14507389068604 C 8.546135902404785 10.47978401184082 8.031847953796387 9.663861274719238 7.879979610443115 9.412809371948242 C 7.72983455657959 9.16175651550293 7.863583564758301 9.023677825927734 7.9921555519104 8.898151397705078 C 8.10951042175293 8.785177230834961 8.251887321472168 8.609440803527832 8.381321907043457 8.460482597351074 C 8.507304191589355 8.309014320373535 8.548725128173828 8.208593368530273 8.637602806091309 8.045408248901367 C 8.723892211914062 7.86967134475708 8.679884910583496 7.731592655181885 8.616030693054199 7.606902122497559 C 8.551312446594238 7.481375694274902 8.036163330078125 6.251216411590576 7.820438861846924 5.76082706451416 C 7.613343238830566 5.272110939025879 7.40020751953125 5.334037303924561 7.240571022033691 5.334037303924561 C 7.092153072357178 5.321484565734863 6.920436382293701 5.321484565734863 6.747857570648193 5.321484565734863 C 6.575277328491211 5.321484565734863 6.296561717987061 5.383410930633545 6.060127735137939 5.621910572052002 C 5.824556827545166 5.872963905334473 5.15839958190918 6.475490093231201 5.15839958190918 7.69309663772583 C 5.15839958190918 8.910703659057617 6.081699848175049 10.09065246582031 6.210271835327148 10.26638889312744 C 6.33884334564209 10.42957210540771 8.026670455932617 12.94010162353516 10.61104869842529 14.01962947845459 C 11.22715663909912 14.27068328857422 11.70692825317383 14.42131328582764 12.08142566680908 14.54600429534912 C 12.69753360748291 14.73596668243408 13.25928115844727 14.70918846130371 13.70367240905762 14.64726161956787 C 14.19897556304932 14.5711088180542 15.2284107208252 14.0438985824585 15.44327449798584 13.45392417907715 C 15.66331195831299 12.86394882202148 15.66331195831299 12.37439727783203 15.59859466552734 12.26142311096191 C 15.53474140167236 12.1484489440918 15.36561298370361 12.08568477630615 15.10674381256104 11.97271156311035 M 10.40740489959717 18.20133209228516 L 10.39359855651855 18.20133209228516 C 8.866271018981934 18.20133209228516 7.352748394012451 17.79964828491211 6.031651973724365 17.04648971557617 L 5.721008777618408 16.86740493774414 L 2.485143661499023 17.68332862854004 L 3.352355480194092 14.63303375244141 L 3.146123170852661 14.31921863555908 C 2.291854858398438 13.00035381317139 1.837970733642578 11.48148441314697 1.837970733642578 9.917426109313965 C 1.837970733642578 5.360816478729248 5.682178497314453 1.645233035087585 10.41689682006836 1.645233035087585 C 12.70702743530273 1.645233035087585 14.85650444030762 2.511365652084351 16.47529792785645 4.080446243286133 C 18.09323310852051 5.636136531829834 18.98546600341797 7.720713138580322 18.98546600341797 9.929977416992188 C 18.98201560974121 14.48575019836426 15.13694381713867 18.20216751098633 10.41258144378662 18.20216751098633 M 17.7066535949707 2.886271238327026 C 15.73924827575684 1.041869044303894 13.15055561065674 -2.777456415969937e-07 10.39359855651855 -2.777456415969937e-07 C 4.714008331298828 -2.777456415969937e-07 0.08974131941795349 4.463720321655273 0.0871526375412941 9.952572822570801 C 0.0871526375412941 11.70659637451172 0.5608832836151123 13.4171028137207 1.463473916053772 14.92760276794434 L 0 20.084228515625 L 5.46645450592041 18.7017650604248 C 6.973073959350586 19.49090766906738 8.667803764343262 19.91016578674316 10.39359855651855 19.91267585754395 L 10.39877605438232 19.91267585754395 C 16.08095359802246 19.91267585754395 20.70694732666016 15.44728469848633 20.70953750610352 9.95759391784668 C 20.70953750610352 7.29978084564209 19.6395435333252 4.798457145690918 17.69371032714844 2.918908596038818" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_wbwkxb =
    '<svg viewBox="286.0 640.0 111.0 36.0" ><defs><filter id="shadow"><feDropShadow dx="0" dy="3" stdDeviation="6"/></filter></defs><path transform="translate(286.0, 640.0)" d="M 15 0 L 96 0 C 104.2842712402344 0 111 6.715728759765625 111 15 L 111 21 C 111 29.28427124023438 104.2842712402344 36 96 36 L 15 36 C 6.715728759765625 36 0 29.28427124023438 0 21 L 0 15 C 0 6.715728759765625 6.715728759765625 0 15 0 Z" fill="#fe004c" stroke="#fe004c" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" filter="url(#shadow)"/></svg>';
const String _svg_uejq0q =
    '<svg viewBox="164.2 647.8 26.5 20.2" ><path transform="translate(164.25, 643.26)" d="M 26.46040534973145 6.371486186981201 L 22.45612525939941 23.55472183227539 C 22.15402793884277 24.76746559143066 21.36620330810547 25.06930351257324 20.24666404724121 24.49796676635742 L 14.14547157287598 20.4069766998291 L 11.20149707794189 22.98338317871094 C 10.87570571899414 23.27983093261719 10.6032247543335 23.52776908874512 9.975335121154785 23.52776908874512 L 10.41367244720459 17.87368965148926 L 21.72161293029785 8.575984954833984 C 22.21326065063477 8.177126884460449 21.614990234375 7.956138134002686 20.95748138427734 8.354995727539062 L 6.978049755096436 16.3644962310791 L 0.959786057472229 14.65048503875732 C -0.3493048250675201 14.27857685089111 -0.372998833656311 13.45930194854736 1.232266664505005 12.88796329498291 L 24.7722110748291 4.635914325714111 C 25.86213302612305 4.264006614685059 26.8158130645752 4.856903553009033 26.46040534973145 6.371485710144043 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_tvxqvj =
    '<svg viewBox="294.3 646.2 23.5 23.4" ><path transform="translate(294.26, 644.01)" d="M 11.75054931640625 7.948951721191406 C 8.415341377258301 7.948951721191406 5.725149154663086 10.63260173797607 5.725149154663086 13.95970058441162 C 5.725149154663086 17.28679847717285 8.415341377258301 19.9704475402832 11.75054931640625 19.9704475402832 C 15.0857572555542 19.9704475402832 17.77594757080078 17.28679656982422 17.77594757080078 13.95970058441162 C 17.77594757080078 10.63260364532471 15.0857572555542 7.948951721191406 11.75054931640625 7.948951721191406 Z M 11.75054931640625 17.86746978759766 C 9.595249176025391 17.86746978759766 7.833252906799316 16.11498832702637 7.833252906799316 13.9596996307373 C 7.833252906799316 11.80440902709961 9.590005874633789 10.05192852020264 11.75055027008057 10.05192852020264 C 13.91109371185303 10.05192852020264 15.6678466796875 11.80440902709961 15.6678466796875 13.9596996307373 C 15.6678466796875 16.11498832702637 13.90585041046143 17.86746978759766 11.75055027008057 17.86746978759766 Z M 19.42782020568848 7.703081130981445 C 19.42782020568848 8.482542991638184 18.79853439331055 9.105066299438477 18.02241706848145 9.105066299438477 C 17.24105644226074 9.105066299438477 16.61701583862305 8.477311134338379 16.61701583862305 7.703081130981445 C 16.61701583862305 6.928851127624512 17.24629974365234 6.30109691619873 18.02241706848145 6.30109691619873 C 18.79853439331055 6.30109691619873 19.42782020568848 6.928851127624512 19.42782020568848 7.703081130981445 Z M 23.41853141784668 9.125991821289062 C 23.32938385009766 7.247960090637207 22.89937210083008 5.584410667419434 21.52018928527832 4.213813781738281 C 20.1462516784668 2.843216896057129 18.47864723205566 2.414251327514648 16.59603881835938 2.320088386535645 C 14.65574645996094 2.210231304168701 8.840107917785645 2.210231304168701 6.899813652038574 2.320088386535645 C 5.022448062896729 2.409020185470581 3.354843854904175 2.837985754013062 1.975662350654602 4.208582401275635 C 0.5964806079864502 5.579178810119629 0.1717132180929184 7.242728233337402 0.0773206427693367 9.120759963989258 C -0.03280415385961533 11.05633640289307 -0.03280415385961533 16.85783195495605 0.0773206427693367 18.79340744018555 C 0.1664692759513855 20.67144012451172 0.5964804291725159 22.33498764038086 1.975662350654602 23.7055835723877 C 3.354843854904175 25.07617950439453 5.017204284667969 25.50514793395996 6.899813652038574 25.59930801391602 C 8.840107917785645 25.70916557312012 14.65574645996094 25.70916557312012 16.59603881835938 25.59930801391602 C 18.4786491394043 25.51037788391113 20.14625358581543 25.08141136169434 21.52019119262695 23.7055835723877 C 22.89413070678711 22.33498573303223 23.32414054870605 20.67143630981445 23.41853332519531 18.79340553283691 C 23.52865791320801 16.85783004760742 23.52865791320801 11.06156635284424 23.41853332519531 9.12598991394043 Z M 20.9118824005127 20.8702278137207 C 20.50284767150879 21.89555931091309 19.71099662780762 22.68548393249512 18.67792320251465 23.0987548828125 C 17.13093185424805 23.7108154296875 13.46010589599609 23.56957054138184 11.75054931640625 23.56957054138184 C 10.04099273681641 23.56957054138184 6.364922046661377 23.7055835723877 4.823174476623535 23.0987548828125 C 3.795342922210693 22.69071578979492 3.003493547439575 21.90079116821289 2.589214324951172 20.8702278137207 C 1.975661993026733 19.32699966430664 2.117250919342041 15.66509914398193 2.117250919342041 13.95970058441162 C 2.117250919342041 12.25430202484131 1.980906128883362 8.587169647216797 2.589214324951172 7.049171447753906 C 2.998249292373657 6.023838996887207 3.790099143981934 5.233915328979492 4.823174476623535 4.820643424987793 C 6.370165824890137 4.208582878112793 10.04099273681641 4.349827766418457 11.75054931640625 4.349827766418457 C 13.46010589599609 4.349827766418457 17.13617515563965 4.213813781738281 18.67792320251465 4.820643424987793 C 19.70575332641602 5.228683471679688 20.49760437011719 6.018607139587402 20.9118824005127 7.049171447753906 C 21.52543449401855 8.592400550842285 21.38384628295898 12.25430107116699 21.38384628295898 13.95970058441162 C 21.38384628295898 15.66509914398193 21.52543449401855 19.33223152160645 20.9118824005127 20.8702278137207 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
