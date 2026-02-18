import 'package:flutter/material.dart';
import 'package:nation_identity_application/Pages/Questions/QuestionSectionWidget.dart';
import 'package:nation_identity_application/Pages/TextSectionWidget.dart';

ValueNotifier<int> currentPage = ValueNotifier(0);

late ScrollController activeScrollController;

// Question counts adjusted (2–5 each). All colors unchanged.

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
        Question(
          question: "The city demonstrates a blend of:",
          options: [
            "Tradition and innovation",
            "Industry and mining",
            "Luxury and excess",
          ],
          correctChoice: 0,
        ),
      ],
      colorTheme: Color(0xFFB4532A),
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
        Question(
          question:
              "The building demonstrates how what can influence engineering?",
          options: ["Natural geometry", "Ancient warfare", "Shipping routes"],
          correctChoice: 0,
        ),
        Question(
          question: "The tower primarily represents:",
          options: [
            "Agricultural heritage",
            "Urban ambition",
            "Mountain resilience",
          ],
          correctChoice: 1,
        ),
      ],
      colorTheme: Color(0xFF0F766E),
    ),
  ],
  colorTheme: Color(0xFF0F766E),
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
          question: "Its terrain mainly contrasts with:",
          options: ["Glass urban skylines", "Mangrove forests", "River deltas"],
          correctChoice: 0,
        ),
        Question(
          question: "Culturally the mountain symbolizes:",
          options: ["Endurance and ambition", "Luxury trade", "Naval strength"],
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
        """It serves as a gateway to a large mangrove forest.""",
      ],
      colorTheme: Color(0xFF1F8A70),
    ),
    QuestionSectionWidget(
      questions: [
        Question(
          question: "The pavilion’s appearance most closely resembles:",
          options: [
            "A white origami form",
            "A medieval castle",
            "A glass skyscraper",
          ],
          correctChoice: 0,
        ),
        Question(
          question: "Which ecosystem is associated with Al Zorah Pavilion?",
          options: ["Mangrove forest", "Mountain plateau", "Oil field"],
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
        """Historically it served as a defensive stronghold for the eastern region.""",
      ],
      colorTheme: Color(0xFF8F6B2E),
    ),
    QuestionSectionWidget(
      questions: [
        Question(
          question: "Al-Bithnah Fort is set in which landscape?",
          options: [
            "A valley surrounded by mountains",
            "A coastal harbor",
            "An open desert plain",
          ],
          correctChoice: 0,
        ),
        Question(
          question: "What was its primary historical function?",
          options: [
            "Defensive protection",
            "Commercial trading hub",
            "Religious center",
          ],
          correctChoice: 0,
        ),
        Question(
          question: "The fort symbolizes which value?",
          options: ["Steadfastness", "Urbanization", "Industrial growth"],
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
        """This Soviet-era IL-76 cargo plane rests in the sand with rusted skin and massive wings.""",
        """It reflects the UAE’s historical role as a crossroads of trade and aviation.""",
      ],
      colorTheme: Color(0xFFA34724),
    ),
    QuestionSectionWidget(
      questions: [
        Question(
          question: "What type of object is this landmark?",
          options: ["Cargo plane", "Fortress tower", "Glass pavilion"],
          correctChoice: 0,
        ),
        Question(
          question: "Its atmosphere is best described as:",
          options: [
            "Hidden and mysterious",
            "Corporate and polished",
            "Ceremonial and formal",
          ],
          correctChoice: 0,
        ),
        Question(
          question: "The plane connects symbolically to:",
          options: [
            "Trade and aviation history",
            "Mountain defense systems",
            "Agricultural reform",
          ],
          correctChoice: 0,
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
        """The building features a floating roof and transparent glass walls.""",
        """It combines a library with maker-spaces and labs to promote innovation.""",
      ],
      colorTheme: Color(0xFF0F766E),
    ),
    QuestionSectionWidget(
      questions: [
        Question(
          question: "Which exterior feature defines the House of Wisdom?",
          options: [
            "Floating roof and glass walls",
            "Stone battlements",
            "Steel factory chimneys",
          ],
          correctChoice: 0,
        ),
        Question(
          question: "What facilities support innovation inside?",
          options: [
            "Library, maker-spaces, and labs",
            "Theme park rides",
            "Luxury boutiques",
          ],
          correctChoice: 0,
        ),
        Question(
          question: "The building reinforces Sharjah’s identity as a:",
          options: [
            "Cultural and educational center",
            "Mining capital",
            "Shipping port",
          ],
          correctChoice: 0,
        ),
      ],
      colorTheme: Color(0xFF0F766E),
    ),
  ],
  colorTheme: Color(0xFF0F766E),
);

// Master list
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