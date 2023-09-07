import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login/pages/login_page.dart';
import 'package:login/pages/main_page.dart';
import 'package:login/widgets/gradient_background_widget.dart';
import 'package:login/widgets/text_field_widget.dart';

class RegisterPage extends StatefulWidget {
  final bool isAlumni;
  const RegisterPage({super.key, required this.isAlumni});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final PageController _pageController = PageController();

  final GlobalKey<FormState> studentDetailsformKey = GlobalKey<FormState>();
  final GlobalKey<FormState> verifyEmailformKey = GlobalKey<FormState>();
  final GlobalKey<FormState> setPasswordformKey = GlobalKey<FormState>();
  final GlobalKey<FormState> additionalPreferencesformKey = GlobalKey<FormState>();

  final TextEditingController studentNameController = TextEditingController();
  final TextEditingController studentContactController = TextEditingController();
  final TextEditingController studentRollNoController = TextEditingController();
  final TextEditingController collegeNameController = TextEditingController();
  final TextEditingController collegeCodeController = TextEditingController();
  final TextEditingController degreeController = TextEditingController();
  final TextEditingController streamController = TextEditingController();
  final TextEditingController yearOfStudyController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController studentEmailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController foodPreferenceController = TextEditingController();
  final TextEditingController accommodationRequiredController = TextEditingController();

  int _currentPage = 0;

  void _initializeRegistration() {
    // Write Registration Logic here
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const MainPage(), // Replace with your LoginPage class
      ),
    );
  }

  void _validatePage() {
    switch (_currentPage) {
      case 0:
        if (studentDetailsformKey.currentState!.validate()) {
          _nextPage();
        }
        break;
      case 1:
        if (verifyEmailformKey.currentState!.validate()) {
          _nextPage();
        }
        break;
      case 2:
        if (setPasswordformKey.currentState!.validate()) {
          _nextPage();
        }
        break;
      case 3:
        if (additionalPreferencesformKey.currentState!.validate()) {
          _initializeRegistration();
        }
        break;
      default:
    }
  }

  void _nextPage() {
    if (_currentPage == 0) {}
    if (_currentPage < 3) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
      setState(() {
        _currentPage++;
      });
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      setState(() {
        _currentPage--;
      });
    }
  }

  Widget buildRegistrationStep(String stepTitle, List<Widget> stepWidgets) {
    final ScrollController pageViewController = ScrollController();
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8.0),
      children: [
        Center(
          child: Text(
            stepTitle,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFFFEB139),
            ),
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Scrollbar(
          controller: pageViewController,
          thumbVisibility: true,
          thickness: 5,
          child: SingleChildScrollView(
            controller: pageViewController,
            child: Column(
              children: stepWidgets,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    const Map<String, String> collegeCode = {
      "Adaikalamatha College": "login6455",
      "Adhiparasakthi College Of Arts And Science": "login4243",
      "Adhiparasakthi Engineering College": "login1169",
      "Adhiyamaan College of Engineering": "login2495",
      "Alagappa Chettiar College of Engineering and Technology": "login3635",
      "Ambal Professional Group of Institutions": "login7414",
      "Amity University - Lucknow": "login7307",
      "Amity University - Gwalior": "login8961",
      "Amity University - Haryana": "login1500",
      "Amrita College of Engineering and Technology": "login1573",
      "Amrita School of Arts & Sciences": "login5864",
      "Amrita University - Coimbatore": "login3686",
      "Amrita University - Mysure": "login8998",
      "Anjalai Ammal Mahalingam Engineering College": "login1316",
      "Anna University - Coimbatore": "login2225",
      "Anna University -Tiruchirappalli": "login5997",
      "Annai Mathammal Sheela Engineering College": "login8617",
      "Annapoorana Engineering College": "login4636",
      "Apollo Engineering College": "login2468",
      "Arasu Engineering College": "login1840",
      "ARJ College of Engineering and Technology": "login2706",
      "ARM College of Engineering and Technology": "login4067",
      "ARS College of Engineering ": "login6377",
      "Arulanandar College": "login3839",
      "Arulmigu Meenakshi Amman College of Engineering": "login1416",
      "Arunai Engineering College": "login9919",
      "Asan Memorial College Of Arts And Science": "login4062",
      "AVC College of Engineering": "login9017",
      "Avinashilingam University for Women": "login5732",
      "Birla Institute of Technology & Science": "login1545",
      "Bishop Heber College": "login3150",
      "BITS Pilani": "login3448",
      "C. Abdul Hakeem College of Engineering & Technology": "login5496",
      "C.S.I Institute Of Technology": "login3040",
      "Chennai Institute of Technology": "login8584",
      "Christ University science": "login1583",
      "Coimbatore Insititute Of Management And Technology": "login4264",
      "Coimbatore Institute of Technology": "login9602",
      "College Of Engineering: Guindy": "login7914",
      "CSI Bishop Appasamy College Of Arts And Science": "login9776",
      "Dr. Mahalingam College of Engineering & Technology": "login3995",
      "Dr. NGP Arts and Science College": "login2676",
      "Dr. NGP Institute Of Technology": "login9242",
      "Dr. SNS Rajalakshmi College Of Arts And Science": "login2980",
      "EGS Pillay Engineering College": "login6992",
      "Erode Arts & Science College": "login1667",
      "Government College For Men": "login9459",
      "Government Thirumagal Mills College": "login6946",
      "GRT Institute of Engineering and Technology": "login5632",
      "Hindusthan College Of Arts And Science": "login8863",
      "Hindusthan College of Engineering and Technology": "login6533",
      "Holy Cross College": "login2224",
      "IIT - Bombay": "login3990",
      "IIT - Delhi": "login3391",
      "IIT - Dharwad": "login7795",
      "IIT - Goa": "login2840",
      "IIT - Guwahati": "login7432",
      "IIT - Hyderabad": "login1313",
      "IIT - Indore": "login5347",
      "IIT - Jammu": "login6167",
      "IIT - Jharkhand": "login5423",
      "IIT - Jodhpur": "login1532",
      "IIT - Kanpur": "login3787",
      "IIT - Chennai": "login2274",
      "IIT - Palakkad": "login8597",
      "IIT - Patna": "login9085",
      "IIT - Rajpur": "login2227",
      "IIT - Roorkee": "login3680",
      "IIT - Ropar": "login1562",
      "IIT - Varanasi": "login6037",
      "Indira Institute of Engineering and Technology": "login1139",
      "Info Institute Of Engineering": "login8461",
      "Institute Of Road And Transport Technology": "login1168",
      "Jadavpur University": "login6852",
      "Jamal Mohamed College": "login4843",
      "Jaya Engineering College": "login3439",
      "Jayam College of Engineering and Technology ": "login5139",
      "Jayaram College of Engineering and Technology": "login1352",
      "JBAS College For Women": "login4322",
      "Jeppiaar Engineering College": "login5903",
      "Jerusalem College of Engineering": "login7502",
      "JKK Nadaraja Women Arts And Science": "login8267",
      "JNTUH Institute Of Science And Technology": "login9288",
      "Joy University": "login1919",
      "Kalaignar Karunanidhi Institute of Technology": "login3069",
      "Kalasalingam University": "login3406",
      "Kamaraj College": "login1914",
      "Karpaga Vinayaga College of Engineering And Technology": "login8022",
      "Karpagam Arts And Science College": "login8592",
      "Karpagam College of Engineering": "login7321",
      "Karunya University": "login8503",
      "Kathir college of Engineering": "login3291",
      "KCG College of Technology": "login8500",
      "KGISL Institute Of Information Management": "login9950",
      "KGISL Institute of Technology": "login3940",
      "Khadir Mohideen College": "login8474",
      "Kingston Engineering College": "login6808",
      "KLN College of Engineering": "login7540",
      "Kongu Arts And Science College": "login1279",
      "Kongu Engineering College": "login5268",
      "Krishnasamy College of Engineering and Technology": "login5533",
      "KRS College of Engineering": "login5673",
      "KSR College of Engineering": "login6810",
      "Kumaraguru College of Technology": "login7847",
      "Kurinji College Of Arts And Science": "login1994",
      "Lady Doak College": "login8012",
      "Lord Jegannath College of Engineering and Technology": "login5585",
      "Loyola College": "login1103",
      "Loyola Institute Of Technology": "login7372",
      "M. Kumarasamy College of Engineering": "login1793",
      "Madha Engineering College": "login4479",
      "Madras Christian College": "login4950",
      "Madras Institute of Technology": "login1403",
      "Mahendra Engineering College": "login8231",
      "Mailam Engineering College": "login5551",
      "MAM College of Engineering": "login9642",
      "Marudhar Kesari Jain College For Women": "login1536",
      "Measi Institute Of Information Technology": "login1794",
      "Meenakshi College For Women": "login6779",
      "Meenakshi College of Engineering ": "login9693",
      "Meenakshi Ramaswamy Engineering College": "login3582",
      "Mepco Schlenk Engineering College": "login6812",
      "Mohamed Sathak College Of Arts And Science": "login7804",
      "Mohamed Sathak Engineering College": "login7687",
      "MP Nachimuthu M Jaganathan Engineering College": "login7705",
      "Muthayammal Engineering College ": "login2814",
      "Nadar Saraswathi College Of Arts & Science": "login6034",
      "Nandha Engineering College": "login1772",
      "National Engineering College": "login7636",
      "Nehru College Of Management": "login5928",
      "Nehru Institute of Engineering and Technology": "login1135",
      "Nehru Institute of Information Technology and Management": "login7855",
      "Nesamony Memorial Christian College": "login7046",
      "New Prince Shri Bhavani College of Engineering And Technology": "login6408",
      "NIT - Allahabad": "login8586",
      "NIT - Andhra Pradesh": "login8432",
      "NIT - Bhopal": "login7030",
      "NIT - Calicut": "login4716",
      "NIT - Delhi": "login7547",
      "NIT - Durgapur": "login3676",
      "NIT - Goa": "login4290",
      "NIT - Hamirpur": "login5710",
      "NIT - Jaipur": "login9745",
      "NIT - Jalandhar": "login7168",
      "NIT - Jamshedpur": "login1498",
      "NIT - Karnataka": "login8995",
      "NIT - Manipur": "login2536",
      "NIT - Meghalaya": "login3237",
      "NIT - Mizoram": "login2042",
      "NIT - Nagpur": "login3514",
      "NIT - Patna": "login1023",
      "NIT - Pudhucherry": "login3524",
      "NIT - Raipur": "login4302",
      "NIT - Rourkela": "login8928",
      "NIT - Sikkim": "login8764",
      "NIT - Silchar": "login2986",
      "NIT - Surat": "login6370",
      "NIT - Trichy": "login6159",
      "NIT - Uttarakhand": "login9454",
      "NIT -Warangal": "login7757",
      "NIT - Haryana": "login6722",
      "NIT - Tripura": "login3810",
      "NIT - Papum Pare": "login3835",
      "Oxford College of Engineering": "login9795",
      "Paavai Engineering College": "login1669",
      "Pallavan College of Engineering": "login4059",
      "Park College Of Engineering And Technology": "login7478",
      "Pavendar Bharathidasan College Of Engineering And Technology": "login4825",
      "PEE GEE College Of Arts & Science": "login5326",
      "PET Engineering College ": "login7316",
      "PGP College Of Arts And Science": "login5783",
      "PGP College of Engineering and Technology": "login8160",
      "PKR Arts College For Women": "login4287",
      "Pondicherry University": "login8509",
      "PR Engineering College": "login4536",
      "Presidency College": "login9189",
      "Prince Shri Venkateshwara Padmavathy Engineering College": "login3968",
      "Priyadarshini Engineering College": "login5622",
      "Professional Group Of Institutions": "login1911",
      "PSG College Of Arts And Science": "login4709",
      "PSGR Krishnammal College for Women": "login8433",
      "PSN College of Engineering And Technology ": "login4982",
      "PSNA College of Engineering and Technology": "login3796",
      "Quaid-E-Milliath Government College For Women": "login7343",
      "Queen Mary's College": "login2749",
      "R V College of Engineering": "login4899",
      "Rajalakshmi Engineering College": "login1225",
      "Rajiv Gandhi College of Engineering": "login8813",
      "Rathinam College of Arts and Science": "login1648",
      "RMK Engineering College": "login1145",
      "Roever Engineering College ": "login9515",
      "RVS College Of Arts And Science": "login9078",
      "RVS College of Computer Application": "login7209",
      "RVS College of Engineering": "login6354",
      "SA Engineering College": "login6048",
      "S Veerasamy Chettiar College of Engineering and Technology": "login1800",
      "SRM Arts And Science College": "login6898",
      "Sacred Heart College": "login9877",
      "Salem Sowdeswari College": "login3881",
      "San International Info School": "login8648",
      "Sankara College Of Science And Commerce": "login1079",
      "Sarah Tucker College For Women": "login9030",
      "Sardar Raja College of Engineering": "login7530",
      "Sastra University": "login2023",
      "Sasurie College Of Engineering": "login6772",
      "Sathyabama University": "login7182",
      "Scott Christian College": "login2685",
      "Selvam College of Technology": "login1746",
      "Sengunthar Arts and Science College": "login7446",
      "Sengunthar College Of Engineering": "login9770",
      "Shanmuga Industries Arts & Science College": "login9358",
      "Shreenivasa Engineering College": "login7064",
      "SIGA College of Management and Computer Science": "login7700",
      "Sivanthi Aditanar College": "login2074",
      "SKSS Arts College": "login2350",
      "SNS College of Engineering": "login6497",
      "SNS College of Technology": "login2361",
      "Sona College of Technology": "login9160",
      "Sourashtra College": "login6622",
      "Sree Amman Arts & Science College": "login5537",
      "Sree Saraswathi Thyagaraja College": "login6751",
      "SRG Engineering College": "login2409",
      "Sri Balaji Chockalingam Engineering College": "login5620",
      "Sri Chandrasekharendra Saraswathi Viswa Maha Vidyalaya": "login6986",
      "Sri Krishna Arts and Science College": "login1834",
      "Sri Krishna College of Engineering and Technology": "login5824",
      "Sri Meenakshi Government Arts college for women ": "login5631",
      "Sri Muthukumaran Institute of Technology": "login2424",
      "Sri Ramakrishna College Of Arts & Science For Women": "login5671",
      "Sri Ramakrishna College of Arts and Science": "login5769",
      "Sri Ramakrishna Engineering College": "login5230",
      "Sri Ramakrishna Mission Vidyalaya College Of Arts & Science": "login4915",
      "Sri SaiRam Engineering College": "login9303",
      "Sri Sairam Institute of Technology": "login4262",
      "Sri Sankara Arts and Science College-MSC": "login1029",
      "Sri Sarada College For Women": "login3446",
      "Sri Sarada Niketan College Of Science For Women": "login9815",
      "Sri Shanmugha College of Engineering and Technology": "login5018",
      "Sri Subramaniaswamy Government Arts College": "login6424",
      "Sri Venkateswara College of Engineering": "login1868",
      "SRM - Delhi": "login1894",
      "ST Hindu College": "login7283",
      "St. Joseph College of Engineering Chennai": "login7340",
      "St. Joseph College of Engineering Kanchipuram": "login9509",
      "St. Joseph College of Engineering Bengaluru": "login6575",
      "St. Xaviers Catholic College of Engineering": "login3088",
      "Stella Maris College": "login3288",
      "STET School Of Management": "login3243",
      "Tagore Engineering College": "login2188",
      "Tamilnadu College Of Engineering": "login7715",
      "Tamilavel Uma Maheswaranar Karanthai Arts College": "login1776",
      "Thangavelu Engineering College": "login1612",
      "Thanthai Periyar Government Institute Of Technology": "login9584",
      "Thassim Beevi Abdul Kader College For Women": "login2507",
      "The American College": "login8511",
      "The Ethiraj College For Women": "login1473",
      "The Kavery Engineering College": "login6045",
      "The New College": "login8448",
      "The Rajas Engineering College": "login8353",
      "The Standard Fireworks Rajaratnam College For Women": "login3463",
      "Theivani Ammal College For Women": "login1935",
      "Thiagarajar College of Engineering": "login3486",
      "Thirumalai Engineering College": "login9332",
      "Thiruvalluvar College of Engineering and Technology": "login7246",
      "Tranquebar Bishop Manikam Lutheran College": "login5799",
      "Trichy Engineering College": "login9207",
      "Udaya School of Engineering": "login8629",
      "United Institute Of Technology": "login7315",
      "University of Delhi": "login9937",
      "University of Hyderabad": "login2838",
      "University of Kerala": "login1078",
      "University of Lucknow": "login4952",
      "University of Madras": "login8460",
      "University Of Mysore": "login3891",
      "V.V. Vanniaperumal College For Women": "login2268",
      "Valliammal College for Women": "login3300",
      "Varuvan Vadivelan Institute of Technology": "login7086",
      "Vel Tech High Tech Dr. Rangarajan Dr.  Sakunthala Engineering College ": "login8664",
      "Velalar College of Engineering and Technology": "login8644",
      "Velammal Engineering College": "login4286",
      "Vellalar College For Women": "login5050",
      "VHN Senthikumara Nadar College": "login7413",
      "Vidyaa Vikas College of Engineering and Technology": "login4397",
      "Virudhunagar Hindu Nadar's Senthikumara Nadar College": "login5303",
      "VIT - Amaravathi": "login3625",
      "VIT -Chennai": "login4546",
      "VIT - Vellore": "login9628",
      "Vivekanandha College Of Arts And Science For Women": "login2133",
      "VSB Engineering College": "login3225",
      "Womens Christian College": "login5484",
      "Prathyusha Engineering College": "login4029",
      "Velammal College of Engineering and Technology": "login8185",
      "Kamaraja College Of Engineering & Technology": "login5655",
      "Solamalai College of Engineering": "login9629",
      "Fatima Michael College of Engineering and Technology": "login3432",
      "Latha Mathavan Group of Institution": "login7878",
      "Syed Ammal Engineering college": "login3898",
      "Tagore Institute of Engineering and Technology": "login4840",
      "Global institute of technology": "login7244",
      "Saveetha engineering college": "login7546",
      "Ranipettai Engineering College: Vellore": "login3516",
      "Priyadarshini Engineering College - Tirupattur": "login3566",
      "Bharathidasan Engineering College": "login9185",
      "ULTRA College of Engineering & Technology": "login9588",
      "Sri Sai Ram Institute of Technology": "login8938",
      "MRK Institute of technology": "login7313",
      "Arulmigu Meenakshi Amman College of Engineering Kanchipuram": "login5471",
      "EGS Pillay Engineering College Nagapattinam": "login4232",
      "Sembodai Rukmani Varatharajan Engineering College": "login8182",
      "Sir Issac Newton College of Engineering And Technology": "login1660",
      "JKKN Educational Institutions": "login2835",
      "Government College of Engineering": "login4374",
      "Arunachala College of Engineering for Women": "login1460",
      "Sri Sivasubramaniya Nadar College of Engineering": "login3806",
      "Joy University Tirunelveli": "login5333",
      "Ajeenkya DY Patil University": "login7203",
      "MIT World Peace University": "login9275",
      "GD Goenka University": "login9793",
      "Bharath Institute of Higher Education and Research": "login2142",
      "AC College of Engineering & Technology": "login7950",
      "Periyar Maniammai Institute of Science & Technology": "login3521",
      "Pachaiyappa's College": "login3431",
      "RMD Engineering College": "login4848",
      "Vinayaka Mission's Kirupananda Variyar Engineering College": "login8218",
      "SSM College of Engineering": "login3699"
    };
    const colleges = [
      "Adaikalamatha College",
      "Adhiparasakthi College Of Arts And Science",
      "Adhiparasakthi Engineering College",
      "Adhiyamaan College of Engineering",
      "Alagappa Chettiar College of Engineering and Technology",
      "Ambal Professional Group of Institutions",
      "Amity University - Lucknow",
      "Amity University - Gwalior",
      "Amity University - Haryana",
      "Amrita College of Engineering and Technology",
      "Amrita School of Arts & Sciences",
      "Amrita University - Coimbatore",
      "Amrita University - Mysure",
      "Anjalai Ammal Mahalingam Engineering College",
      "Anna University - Coimbatore",
      "Anna University -Tiruchirappalli",
      "Annai Mathammal Sheela Engineering College",
      "Annapoorana Engineering College",
      "Apollo Engineering College",
      "Arasu Engineering College",
      "ARJ College of Engineering and Technology",
      "ARM College of Engineering and Technology",
      "ARS College of Engineering",
      "Arulanandar College",
      "Arulmigu Meenakshi Amman College of Engineering",
      "Arunai Engineering College",
      "Asan Memorial College Of Arts And Science",
      "AVC College of Engineering",
      "Avinashilingam University for Women",
      "Birla Institute of Technology & Science",
      "Bishop Heber College",
      "BITS Pilani",
      "C. Abdul Hakeem College of Engineering & Technology",
      "C.S.I Institute Of Technology",
      "Chennai Institute of Technology",
      "Christ University science",
      "Coimbatore Insititute Of Management And Technology",
      "Coimbatore Institute of Technology",
      "College Of Engineering, Guindy",
      "CSI Bishop Appasamy College Of Arts And Science",
      "Dr. Mahalingam College of Engineering & Technology",
      "Dr. NGP Arts and Science College",
      "Dr. NGP Institute Of Technology",
      "Dr. SNS Rajalakshmi College Of Arts And Science",
      "EGS Pillay Engineering College",
      "Erode Arts & Science College",
      "Government College For Men",
      "Government Thirumagal Mills College",
      "GRT Institute of Engineering and Technology",
      "Hindusthan College Of Arts And Science",
      "Hindusthan College of Engineering and Technology",
      "Holy Cross College",
      "IIT - Bombay",
      "IIT - Delhi",
      "IIT - Dharwad",
      "IIT - Goa",
      "IIT - Guwahati",
      "IIT  - Hyderabad",
      "IIT - Indore",
      "IIT - Jammu",
      "IIT - Jharkhand",
      "IIT - Jodhpur",
      "IIT - Kanpur",
      "IIT - Chennai",
      "IIT - Palakkad",
      "IIT - Patna",
      "IIT - Rajpur",
      "IIT - Roorkee",
      "IIT - Ropar",
      "IIT - Varanasi",
      "Indira Institute of Engineering and Technology",
      "Info Institute Of Engineering",
      "Institute Of Road And Transport Technology",
      "Jadavpur University",
      "Jamal Mohamed College",
      "Jaya Engineering College",
      "Jayam College of Engineering and Technology",
      "Jayaram College of Engineering and Technology",
      "JBAS College For Women",
      "Jeppiaar Engineering College",
      "Jerusalem College of Engineering",
      "JKK Nadaraja Women Arts And Science",
      "JNTUH Institute Of Science And Technology",
      "Joy University",
      "Kalaignar Karunanidhi Institute of Technology",
      "Kalasalingam University",
      "Kamaraj College",
      "Karpaga Vinayaga College of Engineering And Technology",
      "Karpagam Arts And Science College",
      "Karpagam College of Engineering",
      "Karunya University",
      "Kathir college of Engineering",
      "KCG College of Technology",
      "KGISL Institute Of Information Management",
      "KGISL Institute of Technology",
      "Khadir Mohideen College",
      "Kingston Engineering College",
      "KLN College of Engineering",
      "Kongu Arts And Science College",
      "Kongu Engineering College",
      "Krishnasamy College of Engineering and Technology",
      "KRS College of Engineering",
      "KSR College of Engineering",
      "Kumaraguru College of Technology",
      "Kurinji College Of Arts And Science",
      "Lady Doak College",
      "Lord Jegannath College of Engineering and Technology",
      "Loyola College",
      "Loyola Institute Of Technology",
      "M. Kumarasamy College of Engineering",
      "Madha Engineering College",
      "Madras Christian College",
      "Madras Institute of Technology",
      "Mahendra Engineering College",
      "Mailam Engineering College",
      "MAM College of Engineering",
      "Marudhar Kesari Jain College For Women",
      "Measi Institute Of Information Technology",
      "Meenakshi College For Women",
      "Meenakshi College of Engineering",
      "Meenakshi Ramaswamy Engineering College",
      "Mepco Schlenk Engineering College",
      "Mohamed Sathak College Of Arts And Science",
      "Mohamed Sathak Engineering College",
      "MP Nachimuthu M Jaganathan Engineering College",
      "Muthayammal Engineering College",
      "Nadar Saraswathi College Of Arts & Science",
      "Nandha Engineering College",
      "National Engineering College",
      "Nehru College Of Management",
      "Nehru Institute of Engineering and Technology",
      "Nehru Institute of Information Technology and Management",
      "Nesamony Memorial Christian College",
      "New Prince Shri Bhavani College of Engineering And Technology",
      "NIT - Allahabad",
      "NIT - Andhra Pradesh",
      "NIT - Bhopal",
      "NIT - Calicut",
      "NIT - Delhi",
      "NIT - Durgapur",
      "NIT - Goa",
      "NIT - Hamirpur",
      "NIT - Jaipur",
      "NIT - Jalandhar",
      "NIT - Jamshedpur",
      "NIT - Karnataka",
      "NIT - Manipur",
      "NIT - Meghalaya",
      "NIT - Mizoram",
      "NIT - Nagpur",
      "NIT - Patna",
      "NIT - Pudhucherry",
      "NIT - Raipur",
      "NIT - Rourkela",
      "NIT - Sikkim",
      "NIT - Silchar",
      "NIT - Surat",
      "NIT - Trichy",
      "NIT - Uttarakhand",
      "NIT -Warangal",
      "NIT - Haryana",
      "NIT - Tripura",
      "NIT - Papum Pare",
      "Oxford College of Engineering",
      "Paavai Engineering College",
      "Pallavan College of Engineering",
      "Park College Of Engineering And Technology",
      "Pavendar Bharathidasan College Of Engineering And Technology",
      "PEE GEE College Of Arts & Science",
      "PET Engineering College",
      "PGP College Of Arts And Science",
      "PGP College of Engineering and Technology",
      "PKR Arts College For Women",
      "Pondicherry University",
      "PR Engineering College",
      "Presidency College",
      "Prince Shri Venkateshwara Padmavathy Engineering College",
      "Priyadarshini Engineering College",
      "Professional Group Of Institutions",
      "PSG College Of Arts And Science",
      "PSGR Krishnammal College for Women",
      "PSN College of Engineering And Technology",
      "PSNA College of Engineering and Technology",
      "Quaid-E-Milliath Government College For Women",
      "Queen Mary's College",
      "R V College of Engineering",
      "Rajalakshmi Engineering College",
      "Rajiv Gandhi College of Engineering",
      "Rathinam College of Arts and Science",
      "RMK Engineering College",
      "Roever Engineering College",
      "RVS College Of Arts And Science",
      "RVS College of Computer Application",
      "RVS College of Engineering",
      "SA Engineering College",
      "S Veerasamy Chettiar College of Engineering and Technology",
      "SRM Arts And Science College",
      "Sacred Heart College",
      "Salem Sowdeswari College",
      "San International Info School",
      "Sankara College Of Science And Commerce",
      "Sarah Tucker College For Women",
      "Sardar Raja College of Engineering",
      "Sastra University",
      "Sasurie College Of Engineering",
      "Sathyabama University",
      "Scott Christian College",
      "Selvam College of Technology",
      "Sengunthar Arts and Science College",
      "Sengunthar College Of Engineering",
      "Shanmuga Industries Arts & Science College",
      "Shreenivasa Engineering College",
      "SIGA College of Management and Computer Science",
      "Sivanthi Aditanar College",
      "SKSS Arts College",
      "SNS College of Engineering",
      "SNS College of Technology",
      "Sona College of Technology",
      "Sourashtra College",
      "Sree Amman Arts & Science College",
      "Sree Saraswathi Thyagaraja College",
      "SRG Engineering College",
      "Sri Balaji Chockalingam Engineering College",
      "Sri Chandrasekharendra Saraswathi Viswa Maha Vidyalaya",
      "Sri Krishna Arts and Science College",
      "Sri Krishna College of Engineering and Technology",
      "Sri Meenakshi Government Arts college for women",
      "Sri Muthukumaran Institute of Technology",
      "Sri Ramakrishna College Of Arts & Science For Women",
      "Sri Ramakrishna College of Arts and Science",
      "Sri Ramakrishna Engineering College",
      "Sri Ramakrishna Mission Vidyalaya College Of Arts & Science",
      "Sri SaiRam Engineering College",
      "Sri Sairam Institute of Technology",
      "Sri Sankara Arts and Science College-MSC",
      "Sri Sarada College For Women",
      "Sri Sarada Niketan College Of Science For Women",
      "Sri Shanmugha College of Engineering and Technology",
      "Sri Subramaniaswamy Government Arts College",
      "Sri Venkateswara College of Engineering",
      "SRM - Delhi",
      "ST Hindu College",
      "St. Joseph College of Engineering Chennai",
      "St. Joseph College of Engineering Kanchipuram",
      "St. Joseph College of Engineering Bengaluru",
      "St. Xaviers Catholic College of Engineering",
      "Stella Maris College",
      "STET School Of Management",
      "Tagore Engineering College",
      "Tamilnadu College Of Engineering",
      "Tamilavel Uma Maheswarnar Karanthai Arts College",
      "Thangavelu Engineering College",
      "Thanthai Periyar Government Institute Of Technology",
      "Thassim Beevi Abdul Kader College For Women",
      "The American College",
      "The Ethiraj College For Women",
      "The Kavery Engineering College",
      "The New College",
      "The Rajas Engineering College",
      "The Standard Fireworks Rajaratnam College For Women",
      "Theivani Ammal College For Women",
      "Thiagarajar College of Engineering",
      "Thirumalai Engineering College",
      "Thiruvalluvar College of Engineering and Technology",
      "Tranquebar Bishop Manikam Lutheran College",
      "Trichy Engineering College",
      "Udaya School of Engineering",
      "United Institute Of Technology",
      "University of Delhi",
      "University of Hyderabad",
      "University of Kerala",
      "University of Lucknow",
      "University of Madras",
      "University Of Mysore",
      "V.V. Vanniaperumal College For Women",
      "Valliammal College for Women",
      "Varuvan Vadivelan Institute of Technology",
      "Vel Tech High Tech Dr. Rangarajan Dr.  Sakunthala Engineering College",
      "Velalar College of Engineering and Technology",
      "Velammal Engineering College",
      "Vellalar College For Women",
      "VHN Senthikumara Nadar College",
      "Vidyaa Vikas College of Engineering and Technology",
      "Virudhunagar Hindu Nadar's Senthikumara Nadar College",
      "VIT - Amaravathi",
      "VIT -Chennai",
      "VIT - Vellore",
      "Vivekanandha College Of Arts And Science For Women",
      "VSB Engineering College",
      "Womens Christian College",
      "Prathyusha Engineering College",
      "Velammal College of Engineering and Technology",
      "KAMARAJ COLLEGE OF ENGINEERING & TECHNOLOGY",
      "Solamalai College of Engineering",
      "Fatima Michael College of Engineering and Technology",
      "Latha Mathavan Group of Institution",
      "Syed Ammal Engineering college",
      "Tagore Institute of Engineering and Technology",
      "global institute of technology",
      "saveetha engineering college",
      "Ranipettai Engineering College, Vellore",
      "Priyadarshini Engineering College - Tirupattur",
      "Bharathidasan Engineering College",
      "ULTRA College of Engineering & Technology",
      "Sri Sai Ram Institute of Technology",
      "MRK Institute of technology",
      "Arulmigu Meenakshi Amman College of Engineering Kanchipuram",
      "EGS Pillay Engineering College Nagapattinam",
      "Sembodai Rukmani Varatharajan Engineering College",
      "Sir Issac Newton College of Engineering And Technology",
      "JKKN Educational Institutions",
      "Government College of Engineering",
      "Arunachala College of Engineering for Women",
      "Sri Sivasubramaniya Nadar College of Engineering",
      "Joy University Tirunelveli",
      "Ajeenkya DY Patil University",
      "MIT World Peace University",
      "GD Goenka University",
      "Bharath Institute of Higher Education and Research",
      "AC College of Engineering & Technology",
      "Periyar Maniammai Institute of Science & Technology",
      "Pachaiyappa's College",
      "RMD Engineering College",
      "Vinayaka Mission's Kirupananda Variyar Engineering College",
      "SSM College of Engineering",
    ];
    const degrees = ["M.E", "MCA", "M.Sc.", "M.Tech.", "M.Com", "MA"];
    const streams = ["Computer Applications", "Computer Science", "Mathematics"];
    const yearsOfStudy = ["1st Year", "2nd Year", "3rd Year", "4th Year", "5th Year"];
    const genders = ["Male", "Female", "Other"];

    List<TextFieldWidget> studentDetailsForm = [
      TextFieldWidget(
        controller: studentNameController, // Provide the TextEditingController
        labelText: 'Student Name', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.person, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Student Name is Required';
          }
          if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
            return 'Student Name should only contain letters and spaces';
          }

          if (value.length < 2) {
            return 'Student Name should atleast be 3 characters long';
          }
          return null;
        },
      ),
      TextFieldWidget(
          controller: studentContactController, // Provide the TextEditingController
          labelText: 'Contact Number', // Provide the label text
          isPassword: false, // Indicate whether it's a password field
          prefixIcon: Icons.phone, // Provide the prefix icon
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Contact Number is Required';
            }
            if (!RegExp(r'^[1-9]\d{9}$').hasMatch(value)) {
              return 'Invalid Contact Number';
            }
            return null;
          },
          keyboardType: TextInputType.number),
      TextFieldWidget(
        controller: genderController, // Provide the TextEditingController
        labelText: 'Gender', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.male_rounded, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty || value == 'Select Gender') {
            return 'Gender is Required';
          }
          return null;
        },
        dropdownItems: [
          const DropdownMenuItem<String>(
            value: 'Select Gender',
            child: Text('Select Gender'),
          ),
          for (var gender in genders)
            DropdownMenuItem<String>(
              value: gender,
              child: Text(gender),
            ),
        ],
        onDropdownChanged: (value) {
          genderController.text = value!;
        },
        dropdownValue: 'Select Gender',
      ),
      TextFieldWidget(
        controller: studentRollNoController, // Provide the TextEditingController
        labelText: 'Roll Number', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.tag, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Student Roll Number is Required';
          }
          return null;
        },
      ),
      TextFieldWidget(
        controller: collegeNameController, // Provide the TextEditingController
        labelText: 'College Name', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.account_balance, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty || value == 'Select a College') {
            return 'College Name is Required';
          }
          return null;
        },
        dropdownItems: [
          const DropdownMenuItem<String>(
            value: 'Select a College',
            child: Text('Select a College'),
          ),
          for (var college in colleges)
            DropdownMenuItem<String>(
              value: college,
              child: Text(college),
            ),
          const DropdownMenuItem<String>(
            value: 'Other',
            child: Text('Other'),
          ),
        ],
        onDropdownChanged: (value) {
          collegeNameController.text = value!;
        },
        dropdownValue: 'Select a College',
      ),
      TextFieldWidget(
        controller: collegeCodeController, // Provide the TextEditingController
        labelText: 'College Code', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.tag, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'College Code is Required';
          }
          if (value != collegeCode[collegeNameController.text]) {
            return 'Invalid College Code. \nContact login2023.help@gmail.com to verify.';
          }
          return null;
        },
      ),
      TextFieldWidget(
        controller: degreeController, // Provide the TextEditingController
        labelText: 'Degree', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.school, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty || value == 'Select a Degree') {
            return 'Degree is Required';
          }
          return null;
        },
        dropdownItems: [
          const DropdownMenuItem<String>(
            value: 'Select a Degree',
            child: Text('Select a Degree'),
          ),
          for (var degree in degrees)
            DropdownMenuItem<String>(
              value: degree,
              child: Text(degree),
            ),
        ],
        onDropdownChanged: (value) {
          degreeController.text = value!;
        },
        dropdownValue: 'Select a Degree',
      ),
      TextFieldWidget(
        controller: streamController, // Provide the TextEditingController
        labelText: 'Stream', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.fork_right_rounded, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty || value == 'Select a Stream') {
            return 'Stream is Required';
          }
          return null;
        },
        dropdownItems: [
          const DropdownMenuItem<String>(
            value: 'Select a Stream',
            child: Text('Select a Stream'),
          ),
          for (var stream in streams)
            DropdownMenuItem<String>(
              value: stream,
              child: Text(stream),
            ),
        ],
        onDropdownChanged: (value) {
          streamController.text = value!;
        },
        dropdownValue: 'Select a Stream',
      ),
      TextFieldWidget(
        controller: yearOfStudyController, // Provide the TextEditingController
        labelText: 'Year of Study', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.calendar_month, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty || value == 'Select Year of Study') {
            return 'Year of Study is Required';
          }
          return null;
        },
        dropdownItems: [
          const DropdownMenuItem<String>(
            value: 'Select Year of Study',
            child: Text('Select Year of Study'),
          ),
          for (var year in yearsOfStudy)
            DropdownMenuItem<String>(
              value: year,
              child: Text(year),
            ),
        ],
        onDropdownChanged: (value) {
          yearOfStudyController.text = value!;
        },
        dropdownValue: 'Select Year of Study',
      ),
    ];
    List<TextFieldWidget> alumniDetailsForm = [
      TextFieldWidget(
        controller: studentNameController, // Provide the TextEditingController
        labelText: 'Alumnus Name', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.person, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Alumnus Name is Required';
          }
          if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
            return 'Alumnus Name should only contain letters and spaces';
          }

          if (value.length < 2) {
            return 'Alumnus Name should atleast be 3 characters long';
          }
          return null;
        },
      ),
      TextFieldWidget(
          controller: studentContactController, // Provide the TextEditingController
          labelText: 'Contact Number', // Provide the label text
          isPassword: false, // Indicate whether it's a password field
          prefixIcon: Icons.phone, // Provide the prefix icon
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Contact Number is Required';
            }
            if (!RegExp(r'^[1-9]\d{9}$').hasMatch(value)) {
              return 'Invalid Contact Number';
            }
            return null;
          },
          keyboardType: TextInputType.number),
      TextFieldWidget(
        controller: genderController, // Provide the TextEditingController
        labelText: 'Gender', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.male_rounded, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty || value == 'Select Gender') {
            return 'Gender is Required';
          }
          return null;
        },
        dropdownItems: [
          const DropdownMenuItem<String>(
            value: 'Select Gender',
            child: Text('Select Gender'),
          ),
          for (var gender in genders)
            DropdownMenuItem<String>(
              value: gender,
              child: Text(gender),
            ),
        ],
        onDropdownChanged: (value) {
          genderController.text = value!;
        },
        dropdownValue: 'Select Gender',
      ),
      TextFieldWidget(
        controller: studentRollNoController, // Provide the TextEditingController
        labelText: 'Roll Number', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.tag, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Alumnus Roll Number is Required';
          }
          return null;
        },
      ),
      TextFieldWidget(
        controller: collegeCodeController, // Provide the TextEditingController
        labelText: 'Alumnus Code', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.tag, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Alumnus Code is Required';
          }
          return null;
        },
      ),
      TextFieldWidget(
        controller: streamController, // Provide the TextEditingController
        labelText: 'Stream', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.fork_right_rounded, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty || value == 'Select a Stream') {
            return 'Stream is Required';
          }
          return null;
        },
        dropdownItems: [
          const DropdownMenuItem<String>(
            value: 'Select a Stream',
            child: Text('Select a Stream'),
          ),
          for (var stream in streams)
            DropdownMenuItem<String>(
              value: stream,
              child: Text(stream),
            ),
        ],
        onDropdownChanged: (value) {
          streamController.text = value!;
        },
        dropdownValue: 'Select a Stream',
      ),
    ];
    List<TextFieldWidget> verifyEmailForm = [
      TextFieldWidget(
        controller: studentEmailController, // Provide the TextEditingController
        labelText: 'Email Address', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.mail, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Email Address is Required';
          }
          final emailRegex = RegExp(
            r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
            caseSensitive: false,
          );

          if (!emailRegex.hasMatch(value)) {
            return 'Enter a Valid Email address';
          }
          return null;
        },
        suffixButton: Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: const Color(0xFFFEB139),
          ),
          child: ElevatedButton(
            onPressed: null,
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFEB139),
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0) // Make the button transparent/ Remove padding
                ),
            child: const Text('Verify',
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
        ),
      ),
      TextFieldWidget(
        controller: otpController, // Provide the TextEditingController
        labelText: 'OTP', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.lock, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'OTP is Required';
          }
          if (value.length != 6 || int.tryParse(value) == null) {
            return 'Enter a Valid OTP';
          }
          return null;
        },
        keyboardType: TextInputType.number,
      ),
    ];
    List<TextFieldWidget> setPasswordForm = [
      TextFieldWidget(
        controller: passwordController,
        labelText: "Password",
        isPassword: true,
        prefixIcon: Icons.key,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Password is Required';
          }
          if (value.length < 8) {
            return 'Password must be at least 8 characters long';
          }

          // Check if the password contains at least one special character
          if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
            return 'Password must contain a special character';
          }

          // Check if the password contains at least one number
          if (!value.contains(RegExp(r'[0-9]'))) {
            return 'Password must contain a number';
          }

          // Check if the password contains at least one uppercase letter
          if (!value.contains(RegExp(r'[A-Z]'))) {
            return 'Password must contain an uppercase letter';
          }

          // Check if the password contains at least one lowercase letter
          if (!value.contains(RegExp(r'[a-z]'))) {
            return 'Password must contain a lowercase letter';
          }
          return null;
        },
        suffixIcon: Icons.visibility, // Pass the suffix icon
        onSuffixIconPressed: () {
          // Handle the suffix icon press (e.g., toggle password visibility)
        },
      ),
      TextFieldWidget(
        controller: confirmPasswordController,
        labelText: "Confirm Password",
        isPassword: true,
        prefixIcon: Icons.key,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Confirm Password is Required';
          }

          if (passwordController.text != confirmPasswordController.text) {
            return 'Passwords do not match';
          }
          return null;
        },
        suffixIcon: Icons.visibility, // Pass the suffix icon
        onSuffixIconPressed: () {
          // Handle the suffix icon press (e.g., toggle password visibility)
        },
      )
    ];
    List<TextFieldWidget> additionalPreferencesForm = [
      TextFieldWidget(
        controller: foodPreferenceController, // Provide the TextEditingController
        labelText: 'Food Preference', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.food_bank_rounded, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty || value == 'Select Food Preference') {
            return 'Food Preference is Required';
          }
          return null;
        },
        dropdownItems: const [
          DropdownMenuItem<String>(
            value: 'Select Food Preference',
            child: Text('Select Food Preference'),
          ),
          DropdownMenuItem<String>(
            value: "Veg",
            child: Text("Veg"),
          ),
          DropdownMenuItem<String>(
            value: "Non-Veg",
            child: Text("Non-Veg"),
          ),
        ],
        onDropdownChanged: (value) {
          foodPreferenceController.text = value!;
        },
        dropdownValue: 'Select Food Preference',
      ),
      TextFieldWidget(
        controller: accommodationRequiredController, // Provide the TextEditingController
        labelText: 'Is Accommodation Required?', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.home, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty || value == 'Select an Option') {
            return 'Field is Required';
          }
          return null;
        },
        dropdownItems: const [
          DropdownMenuItem<String>(
            value: 'Select an Option',
            child: Text('Select an Option'),
          ),
          DropdownMenuItem<String>(
            value: "Yes",
            child: Text("Yes"),
          ),
          DropdownMenuItem<String>(
            value: "No",
            child: Text("No"),
          ),
        ],
        onDropdownChanged: (value) {
          accommodationRequiredController.text = value!;
        },
        dropdownValue: 'Select an Option',
      ),
    ];

    return GradientBackgroundWidget(
        child: SafeArea(
            child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      color: Color(0xFF143F6B),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Center(
                          child: Text(
                            widget.isAlumni ? "Alumni Registration" : "Student Registration",
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: PageView(
                              controller: _pageController,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                Form(
                                  key: studentDetailsformKey,
                                  child: widget.isAlumni
                                      ? buildRegistrationStep('Alumni Details', alumniDetailsForm)
                                      : buildRegistrationStep('Student Details', studentDetailsForm),
                                ),
                                Form(
                                  key: verifyEmailformKey,
                                  child: buildRegistrationStep('Verify Email Address', verifyEmailForm),
                                ),
                                Form(
                                  key: setPasswordformKey,
                                  child: buildRegistrationStep('Set a Password', setPasswordForm),
                                ),
                                Form(
                                  key: additionalPreferencesformKey,
                                  child: buildRegistrationStep(
                                      'Student Additional Preferences', additionalPreferencesForm),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (_currentPage > 0)
                              ElevatedButton(
                                onPressed: _previousPage,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffFEB139),
                                ),
                                child: const Text(
                                  "Back",
                                  style: TextStyle(color: Color(0xff152739), fontFamily: 'Poppins'),
                                ),
                              ),
                            if (_currentPage == 0) const SizedBox(),
                            ElevatedButton(
                              onPressed: _validatePage,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffF55353),
                              ),
                              child: Text(
                                _currentPage < 3 ? 'Next' : 'Finish',
                                style: const TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "Already have an account? ",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: "Login",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFFF55353),
                                  decoration: TextDecoration.none,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => const LoginPage(),
                                      ),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        widget.isAlumni
                            ? RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: "Are you a Student? ",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Register",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFFFEB139),
                                        decoration: TextDecoration.none,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) => const RegisterPage(isAlumni: false),
                                            ),
                                          );
                                        },
                                    ),
                                  ],
                                ),
                              )
                            : RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: "Are you an Alumni? ",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Register",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFFFEB139),
                                        decoration: TextDecoration.none,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) => const RegisterPage(isAlumni: true),
                                            ),
                                          );
                                        },
                                    ),
                                  ],
                                ),
                              ),
                        const SizedBox(
                          height: 24.0,
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    )));
  }
}
