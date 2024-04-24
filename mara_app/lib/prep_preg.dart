import 'package:flutter/material.dart';

class PrepPage extends StatefulWidget {
  final String initialLanguage;

  PrepPage({Key? key, required this.initialLanguage}) : super(key: key);

  @override
  _PrepPageState createState() => _PrepPageState();
}

class _PrepPageState extends State<PrepPage> {
  late String _currentLanguage;

  @override
  void initState() {
    super.initState();
    _currentLanguage = widget.initialLanguage;
  }

  final Map<String, Map<String, String>> _translations = {
    'Preparing for a Healthy Pregnancy': {
      'Kiswahili': 'Kujiandaa kwa ujauzito wenye afya',
      'Dholuo': 'Yikruok ne ich man gi ngima',
      'English': 'Preparing for a Healthy Pregnancy',
    },
    'Are you ready? Tap each check mark to learn about ways to promote a healthy pregnancy.': {
      'Kiswahili': 'Uko tayari? Gusa kila alama ya hundi ili kujifunza kuhusu njia za kukuza mimba yenye afya.', 
      'Dholuo': 'Iyikori? Mul check mark mondo ipuonjri ewi yore manyalo kelo ich man gi ngima.', 
      'English': 'Are you ready? Tap each check mark to learn about ways to promote a healthy pregnancy.'
    }, 
    'content1': {
      'Kiswahili': 'Ikiwa unajaribu kuwa mjamzito au unajamiiana bila kinga, kuchukua multivitamini kunaweza kusaidia kuzuia shida za ujauzito. Unaweza kuuliza mfamasia au mtoa huduma kuhusu chaguo bora zaidi.',
      'Dholuo': 'Ka itemo mako ich kata ibedo e achiel maonge rabo yunga, muonyo multivitamin nyalo konyi geng\'o chandruok mag ich. inyalo penjo katij od yath kata jachiw thieth ewi yo maber.',
      'English': 'If you are trying to become pregnant or are having unprotected sex, taking a multivitamin can help prevent pregnancy problems. You can ask a pharmacist or provider about the best options.'
    },
    'content2': {
      'Kiswahili': 'Ili kufanya ujauzito wako kuwa yenye afya nzuri uwezekanavyo, zungumza na mtoa huduma kuhusu hali yoyote ya afya uliyo nayo au dawa unazotumia. Ni muhimu kuacha kunywa pombe au kutumia dawa yoyote.', 
      'Dholuo': 'Mondo imi ich ma in godo obed man gi ngima maber kaka nyalore, wuo gi jachiw thieth ni ewi tuo moro amora ma in godo kata yedhe ma imuonyo. en gima ber weyo madho kong\'o kata tiyo gi yedhe mamero ji moro amora',
      'English': 'To make your pregnancy as healthy as possible, talk to a provider about any health conditions you have or medications you are taking. It is important to stop drinking alcohol or using any drugs.'
    },
    'content3': {
      'Kiswahili': 'Unapokosa hedhi, ni vyema ukapima ujauzito. Unaweza kuchukua moja kwenye duka la dawa au kwenda kliniki. Kuanza huduma katika ujauzito mapema na kuhudhuria ziara zako zote ni msingi mzuri wa ujauzito wenye afya!', 
      'Dholuo': 'Ka ok ineno rembi mar dwe, en gima ber mondo ipim ich. Inyalo kao gir pim moro achiel e od yath kata idhi e klinik. Chako klinik mar mine mapek chon kendo dhi e limbeni te en chakruok maberne ich man gi ngima. ', 
      'English': 'When you miss a period, it is a good idea to take a pregnancy test. You can pick one up at a pharmacy or go to a clinic. Starting antenatal care early and attending all your visits is a good foundation for a healthy pregnancy!'
    },
    'content4': {
      'Kiswahili': 'Jitunze. Pata usingizi wa kutosha, kula matunda na mboga mboga, na umwone mhudumu katika kipindi chote cha ujauzito wako. Unastahili!', 
      'Dholuo': 'Ritri. Yud nindo moromo, cham olemo kod alode, kendo ine jachiw thieth ekindeni ma in gi ich. Ibergo!', 
      'English': 'Take care of yourself. Get enough sleep, eat fruits and vegetables, and see a provider throughout your pregnancy. You deserve it!'
    }
  };

  String _t(String key) {
    return _translations[key]?[_currentLanguage] ?? key;
  }

  void _changeLanguage(String language) {
    setState(() {
      _currentLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          onPressed: () => Navigator.of(context).pop(), 
        ),
        title: Text(_t('Preparing for a Healthy Pregnancy')),
      ),
      body: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ['Kiswahili', 'Dholuo', 'English']
                .map((language) => languageButton(language))
                .toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/preg_woman_new.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _t('Preparing for a Healthy Pregnancy'),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        _t('Are you ready? Tap each check mark to learn about ways to promote a healthy pregnancy.'),
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          contentBox('content1'),
          contentBox('content2'),
          contentBox('content3'),
          contentBox('content4'),
        ],
      ),
    );
  }

  Widget languageButton(String language) {
    bool isSelected = _currentLanguage == language;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () => _changeLanguage(language),
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.grey : null,
        ),
        child: Text(language),
      ),
    );
  }

  Widget contentBox(String contentKey) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.lightbulb_outline, color: Colors.amber, size: 24.0),
            SizedBox(width: 10.0),
            Expanded(
              child: Text(
                _t(contentKey),
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
