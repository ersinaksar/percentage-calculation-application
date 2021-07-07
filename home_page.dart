import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yuzde_hesapla/buttons.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //var _restoranAdresiController = TextEditingController();
  var _meblagController = TextEditingController();
  var _yuzdeController = TextEditingController();
  //TextEditingController _meblagController;
  //TextEditingController _yuzdeController;
  String _meblag;
  String _yuzde;
  //TextEditingController _sonuc;
  double _sonuc = 0.0;
  int _hesapYontemi;

  var toggleValues = [true, false, false];

  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*REKLAM SON HALİ
    AdmobIslemleri.myBannerAd = AdmobIslemleri.buildBannerAd();
    AdmobIslemleri.myBannerAd
      ..load()
      ..show(anchorOffset: 180);
    print(
        " #################### banner kullanıcı sayfasında gosterilecek ######################");
     */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildTutarGirdisi(),
            _buildYuzdeGirdisi(),
            _buildHesapYontemiSec(),
            _hesaplaButonu(),
            _buildSonucGoster(),
          ],
        ),
      ),
    );
  }

/*
  TextFormField(
  controller: _controller,
  keyboardType: TextInputType.number,
  inputFormatters: <TextInputFormatter>[
  WhitelistingTextInputFormatter.digitsOnly
  ],
  decoration: InputDecoration(
  labelText:"whatever you want",
  hintText: "whatever you want",
  icon: Icon(Icons.phone_iphone)
  )
  )*/
  Widget _buildTutarGirdisi() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _meblagController,
        keyboardType:
            TextInputType.number, //bu satır input kalvyesini sayı yapıyor
        inputFormatters: <TextInputFormatter>[
          WhitelistingTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
            labelText: "Meblağ",
            hintText: "Başlangıç Tutarını Girin",
            border: OutlineInputBorder(),
            icon: Transform.scale(
                scale: 1.5,
                child: Icon(Icons.input)), //input yanında çıkan iconun rengi
            fillColor: Colors.deepPurple), //input yanında çıkan ikon
        style: TextStyle(
            fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildYuzdeGirdisi() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _yuzdeController,
        keyboardType:
            TextInputType.number, //bu satır input kalvyesini sayı yapıyor
        inputFormatters: <TextInputFormatter>[
          WhitelistingTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
            labelText: "Yüzde",
            hintText: "Yüzde Değişimi Girin",
            border: OutlineInputBorder(),
            icon: Transform.scale(
                scale: 1.5,
                child:
                    Icon(Icons.calculate)), //input yanında çıkan iconun rengi
            fillColor: Colors.deepPurple), //input yanında çıkan ikon
        style: TextStyle(
            fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSonucGoster() {
    var sonucGoster = _sonuc.toString();
    if (sonucGoster == null) {
      sonucGoster = "";
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        sonucGoster,
        style: TextStyle(
            fontSize: 40.0, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      /*TextFormField(
        //controller: _meblag,
        //keyboardType: TextInputType.number, //bu satır input kalvyesini sayı yapıyor
        //inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly],
        readOnly: true,
        decoration: InputDecoration(
            labelText: "Sonuç",
            hintText: "Hesaplama Sonucu",
            // border: OutlineInputBorder(),
            icon: Transform.scale(
                scale: 1.5,
                child: Icon(Icons.score)), //input yanında çıkan iconun rengi
            fillColor: Colors.deepPurple), //input yanında çıkan icon
        style: TextStyle(
            fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),
      ),*/
    );
  }

  Widget _buildHesapYontemiSec() {
    var sembolAraligi = 1.0;
    var islemAraligi = 30.0;
    var yaziSize = 20.0;
    return Center(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Text(
                    "",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
              SizedBox(width: sembolAraligi),
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  groupValue: _hesapYontemi,
                  value: 1,
                  onChanged: (t) {
                    setState(() {
                      _hesapYontemi = t;
                    });
                  },
                ),
              ),
              //Icon(Icons.add),
              SizedBox(width: sembolAraligi),
              Text(
                "+ %",
                style: TextStyle(
                    fontSize: yaziSize,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: islemAraligi),
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  groupValue: _hesapYontemi,
                  value: 2,
                  onChanged: (t) {
                    setState(() {
                      _hesapYontemi = t;
                    });
                  },
                ),
              ),
              //Icon(Icons.minimize_outlined),
              SizedBox(width: sembolAraligi),
              Text(
                "- %",
                style: TextStyle(
                    fontSize: yaziSize,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: islemAraligi),
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  groupValue: _hesapYontemi,
                  value: 3,
                  onChanged: (t) {
                    setState(() {
                      _hesapYontemi = t;
                      print("_hesapYontemi: " + _hesapYontemi.toString());
                    });
                  },
                ),
              ),
              SizedBox(width: sembolAraligi),
              Text(
                "= %",
                style: TextStyle(
                    fontSize: yaziSize,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: sembolAraligi),
              Expanded(
                child: Container(
                  child: Text(
                    "",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: yaziSize,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _hesaplaButonu() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 4,
      ),
      child: RawMaterialButton(
        elevation: 0,
        fillColor: Colors.deepPurple,
        /*child:Icon(
          Icons.check,
          size: 35,
          color: Colors.white,
        ),*/
        child: Text(
          "Hesapla",
          style: Theme.of(context).textTheme.subtitle.copyWith(
                color: Colors.white,
                fontSize: 20.0,
              ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: () async {
          _sonuc = await _hesapla();
          setState(() {
            _buildSonucGoster();
          });
        },
      ),
    );
  }

  double _hesapla() {
    var meblag;
    var yuzde;
    var sonuc;
    print("_meblag: " + _meblagController.toString());
    if (_meblagController.text.trim().length > 0) {
      if (_yuzdeController.text.trim().length > 0) {
        _meblag = _meblagController.text;
        meblag = int.parse(_meblag);

        _yuzde = _yuzdeController.text;
        yuzde = int.parse(_yuzde);
        if (meblag > 0) {
          if (yuzde > 0) {
            print("meblag 0 dan büyük: " + meblag.toString());
            print("yuzde 0 dan büyük: " + yuzde.toString());
            if (_hesapYontemi == 1) {
              sonuc = ((100 + yuzde) * meblag) / 100;
              _sonuc = sonuc;
              print("_hesapYontemi: " + _hesapYontemi.toString());
              print("_sonuc: " + _sonuc.toString());
              return sonuc;
            } else if (_hesapYontemi == 2) {
              sonuc = ((100 - yuzde) * meblag) / 100;
              _sonuc = sonuc;
              print("_hesapYontemi: " + _hesapYontemi.toString());
              print("_sonuc: " + _sonuc.toString());
              return sonuc;
            } else if (_hesapYontemi == 3) {
              sonuc = (yuzde * meblag) / 100;
              _sonuc = sonuc;
              print("_hesapYontemi: " + _hesapYontemi.toString());
              print("_sonuc: " + _sonuc.toString());
              return sonuc;
            } else {
              print("------------Hesap yöntemi bulunamadı----------");
              return null;
            }
          }
        }
      }
    }
  }
}

/*
Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Center(
                        child: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              _hesapYontemi = 3;
                            });
                          },
                        ),
                      ),
                    ),
 */
