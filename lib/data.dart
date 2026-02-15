import 'package:flutter/material.dart';
import 'package:nation_identity_application/Pages/QuestionSectionWidget.dart';
import 'package:nation_identity_application/Pages/TextSectionWidget.dart';

ValueNotifier<int> currentPage = ValueNotifier(0);

late ScrollController activeScrollController;

// 1. ABU DHABI
PageInfo masdarCity = PageInfo(
  title: "Masdar City",
  description: "The Sustainable City: A Glimpse into the Future",
  image: "assets/Masdar-City.jpg",
  textSections: [
    TextSectionWidget(
      title: "The Wind Tower",
      subTitle: "Blending Tradition with Tech",
      texts: [
        """Masdar City is known for its terracotta walls and its iconic Wind Tower that naturally cools the streets.""",
        """Its futuristic look is rooted in ancient Arab cooling techniques adapted for modern sustainability.""",
        """The city demonstrates how traditional knowledge can be redesigned to support sustainable urban living.""",
      ],
      colorTheme: Color(0xFFB4532A),
    ),
    QuestionSectionWidget(
      questions: [
        Question(
          question: "What natural function does the Wind Tower perform?",
          options: [
            "Produces electricity",
            "Cools the surrounding streets",
            "Stores rainwater",
          ],
          correctChoice: 1,
        ),
        Question(
          question:
              "Masdar City’s design adapts techniques from which heritage?",
          options: [
            "Ancient Arab cooling techniques",
            "European stone masonry",
            "East Asian timber framing",
          ],
          correctChoice: 0,
        ),
        Question(
          question: "Which broad goal does Masdar City primarily support?",
          options: [
            "Luxury tourism",
            "Sustainable urban living",
            "Heavy industry expansion",
          ],
          correctChoice: 1,
        ),
      ],
      colorTheme: Color(0xFFE2612F),
    ),
  ],
  colorTheme: Color(0xFFB4532A),
);

// 2. DUBAI
PageInfo burjKhalifa = PageInfo(
  title: "Burj Khalifa",
  description: "The Vertical Horizon: Touching the Clouds",
  image: "assets/burj-khalifa.jpg",
  imageAlignment: Alignment(1, 0),
  textSections: [
    TextSectionWidget(
      title: "The Silver Needle",
      subTitle: "Inspired by the Desert Bloom",
      texts: [
        """The tower’s Y-shaped design is inspired by the Hymenocallis desert flower.""",
        """Its reflective exterior shifts appearance depending on the sun’s position.""",
        """The structure shows how natural geometry can influence engineering at scale.""",
      ],
      colorTheme: Color(0xFF0F766E),
    ),
    QuestionSectionWidget(
      questions: [
        Question(
          question: "What inspired the Burj Khalifa’s Y-shaped plan?",
          options: ["A desert flower", "A mountain silhouette", "A ship hull"],
          correctChoice: 0,
        ),
        Question(
          question: "What causes the building’s exterior to change appearance?",
          options: [
            "Wind direction",
            "Sun position throughout the day",
            "Electrified façade lighting only",
          ],
          correctChoice: 1,
        ),
      ],
      colorTheme: Color(0xFF1E5FA3),
    ),
  ],
  colorTheme: Color(0xFF1E5FA3),
);

// 3. RAS AL KHAIMAH
PageInfo jebelJais = PageInfo(
  title: "Jebel Jais",
  titleColor: Colors.white,
  description: "The Peak of Excellence: The UAE's Highest Point",
  image: "assets/Jebal-Jais.png",
  imageAlignment: Alignment(0.6, 0),
  textSections: [
    TextSectionWidget(
      title: "Nature’s Masterpiece",
      subTitle: "The Mountain Ribbon",
      texts: [
        """The mountain features winding, zig-zagging roads carved dramatically into its slopes.""",
        """Its rugged terrain contrasts with the glass skylines of major cities.""",
      ],
      colorTheme: Color(0xFF2C3A8C),
    ),
    QuestionSectionWidget(
      questions: [
        Question(
          question: "Which feature best describes Jebel Jais’ roads?",
          options: [
            "Straight expressways",
            "Zig-zagging winding paths",
            "Coastal promenades",
          ],
          correctChoice: 1,
        ),
        Question(
          question: "Culturally the mountain symbolizes:",
          options: [
            "Endurance and ambition",
            "Maritime tradition",
            "Industrial might",
          ],
          correctChoice: 0,
        ),
      ],
      colorTheme: Color(0xFF2C3A8C),
    ),
  ],
  colorTheme: Color(0xFF2C3A8C),
);

// 4. AJMAN
PageInfo alZorahPavilion = PageInfo(
  title: "Al Zorah Pavilion",
  titleColor: Colors.white,
  description: "The Origami Wave: Minimalism in Nature",
  image: "assets/Al-Zorah-Pavilion.png",
  imageAlignment: Alignment(0.6, 0),
  textSections: [
    TextSectionWidget(
      title: "Modern Geometry",
      subTitle: "Geometric Elegance",
      texts: [
        """The pavilion resembles a piece of white origami — sharp angles and minimalist surfaces.""",
        """Its form provides a clean, contemporary visual that pairs well with coastal nature.""",
      ],
      colorTheme: Color(0xFF1F8A70),
    ),
    TextSectionWidget(
      title: "Ecological Connection",
      subTitle: "Respect for the Land",
      texts: [
        """The Pavilion serves as a gateway to a large mangrove forest and emphasizes coastal preservation.""",
        """It shows how contemporary design can respect and highlight natural ecosystems.""",
      ],
      colorTheme: Color(0xFF1F8A70),
    ),
    QuestionSectionWidget(
      questions: [
        Question(
          question: "The pavilion’s appearance most closely resembles:",
          options: [
            "A white origami form",
            "A classical stone temple",
            "A steel industrial shed",
          ],
          correctChoice: 0,
        ),
        Question(
          question:
              "Which ecosystem is closely associated with Al Zorah Pavilion?",
          options: ["Mangrove forest", "Desert dunes", "High-altitude alpine"],
          correctChoice: 0,
        ),
      ],
      colorTheme: Color(0xFF1F8A70),
    ),
  ],
  colorTheme: Color(0xFF1F8A70),
);

// 5. FUJAIRAH
PageInfo alBithnahFort = PageInfo(
  title: "Al-Bithnah Fort",
  description: "The Golden Shield: Protector of the East",
  imageAlignment: Alignment(0.3, 0),
  image: "assets/Al-Bithnah-Fort.png",
  textSections: [
    TextSectionWidget(
      title: "The Valley Sentinel",
      subTitle: "A Natural Stronghold",
      texts: [
        """The fort stands in a green valley surrounded by the Hajar Mountains.""",
        """Its sand-colored stone contrasts with the dark mountain backdrop.""",
      ],
      colorTheme: Color(0xFF8F6B2E),
    ),
    TextSectionWidget(
      title: "Historical Resilience",
      subTitle: "Symbol of Steadfastness",
      texts: [
        """Historically it served as a defensive stronghold for the eastern region.""",
        """It represents bravery and the national value of steadfastness (summoud).""",
      ],
      colorTheme: Color(0xFF8F6B2E),
    ),
    QuestionSectionWidget(
      questions: [
        Question(
          question: "Al-Bithnah Fort is set in which landscape?",
          options: [
            "Sandy coastal plain",
            "A valley surrounded by mountains",
            "An urban plaza",
          ],
          correctChoice: 1,
        ),
        Question(
          question: "Which value does the fort primarily symbolize?",
          options: [
            "Steadfastness",
            "Commercial wealth",
            "Technological progress",
          ],
          correctChoice: 0,
        ),
      ],
      colorTheme: Color(0xFF8F6B2E),
    ),
  ],
  colorTheme: Color(0xFF8F6B2E),
);

// 6. UMM AL QUWAIN
PageInfo abandonedPlane = PageInfo(
  title: "The Abandoned IL-76",
  description: "The Desert Giant: A Mystery Frozen in Time",
  image: "assets/abandoned-plane.png",
  textSections: [
    TextSectionWidget(
      title: "The Metallic Relic",
      subTitle: "Industrial Aesthetics",
      texts: [
        """This Soviet-era IL-76 cargo plane rests in the sand, its rusted skin and massive wings creating a cinematic scene.""",
        """Its presence gives a 'hidden secret' vibe that fits off-the-beaten-path exploration.""",
      ],
      colorTheme: Color(0xFFA34724),
    ),
    TextSectionWidget(
      title: "The Crossroads of Trade",
      subTitle: "Legacy and Connection",
      texts: [
        """The plane references the UAE’s history as a global crossroads for trade and aviation.""",
        """It reminds visitors of the nation’s openness and journey toward a modern economy.""",
      ],
      colorTheme: Color(0xFFA34724),
    ),
    QuestionSectionWidget(
      questions: [
        Question(
          question: "What type of object is the landmark?",
          options: [
            "A historic fort",
            "A rusted cargo plane",
            "A modern sculpture",
          ],
          correctChoice: 1,
        ),
        Question(
          question: "The plane’s visual vibe is best described as:",
          options: [
            "Polished corporate",
            "Hidden and mysterious",
            "Formal ceremonial",
          ],
          correctChoice: 1,
        ),
      ],
      colorTheme: Color(0xFFA34724),
    ),
  ],
  colorTheme: Color(0xFFA34724),
);

// 7. SHARJAH
PageInfo houseOfWisdom = PageInfo(
  title: "House of Wisdom",
  description: "The Floating Oasis of Knowledge",
  image: "assets/house-of-wisdom.png",
  textSections: [
    TextSectionWidget(
      title: "Futurist Design",
      subTitle: "Glass and Light",
      texts: [
        """The building features a floating roof and transparent glass walls that blur the line between inside and out.""",
        """Outside, 'The Scroll' sculpture spirals upward, reinforcing the theme of knowledge.""",
      ],
      colorTheme: Color(0xFF0F766E),
    ),
    TextSectionWidget(
      title: "The Intellectual Hub",
      subTitle: "A Sanctuary for Knowledge",
      texts: [
        """It combines a library with maker-spaces and labs to promote innovation and learning.""",
        """The building underscores Sharjah’s identity as a cultural and educational center.""",
      ],
      colorTheme: Color(0xFF0F766E),
    ),
    QuestionSectionWidget(
      questions: [
        Question(
          question:
              "Which exterior feature is most striking about the House of Wisdom?",
          options: [
            "A floating roof and glass walls",
            "Defense ramparts",
            "Large domed minarets",
          ],
          correctChoice: 0,
        ),
        Question(
          question: "What programmatic elements support innovation inside?",
          options: [
            "Library, maker-spaces, and labs",
            "Theme park rides",
            "Luxury retail only",
          ],
          correctChoice: 0,
        ),
      ],
      colorTheme: Color(0xFF0F766E),
    ),
  ],
  colorTheme: Color(0xFF0F766E),
);

// Master list in requested order
List<PageInfo> allPages = [
  masdarCity,
  burjKhalifa,
  jebelJais,
  alZorahPavilion,
  alBithnahFort,
  abandonedPlane,
  houseOfWisdom,
];

class PageInfo {
  final String title;
  final Color? titleColor;
  final String description;
  final String image;
  late final Alignment? imageAlignment;

  final List<Widget> textSections;
  final Color colorTheme;

  PageInfo({
    required this.title,
    this.titleColor,
    required this.description,
    required this.image,
    this.imageAlignment,
    required this.textSections,
    required this.colorTheme,
  });
}

class TextSection {
  final String title;
  final String subTitle;
  final List<String> texts;

  TextSection({
    required this.title,
    required this.subTitle,
    required this.texts,
  });
}

class Question {
  final String question;
  final List<String> options;
  final int correctChoice;
  bool? isCorrect;

  Question({
    required this.question,
    required this.options,
    required this.correctChoice,
  });
}