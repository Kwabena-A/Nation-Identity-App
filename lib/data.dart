import 'package:flutter/material.dart';

ValueNotifier<int> currentPage = ValueNotifier(0);

late ScrollController activeScrollController;

// 1. ABU DHABI
PageInfo masdarCity = PageInfo(
  title: "Masdar City",
  description: "The Sustainable City: A Glimpse into the Future",
  image: "assets/Masdar-City.jpg",
  textSections: [
    TextSection(
      title: "The Wind Tower",
      subTitle: "Blending Tradition with Tech",
      texts: [
        """Masdar City is famous for its terracotta walls and its iconic "Wind Tower" that naturally cools the streets.""",
        """The architecture looks like a city from a sci-fi movie, but the design is based on ancient Arab cooling techniques.""",
        """It demonstrates how old-school wisdom can be redesigned with a futuristic aesthetic.""",
      ],
    ),
    TextSection(
      title: "Eco-Leadership",
      subTitle: "A Global Green Leader",
      texts: [
        """Culturally, Masdar City represents the UAE’s leadership in global sustainability.""",
        """It proves that while the nation grew because of oil, it is now a pioneer in renewable energy.""",
        """This fulfills Sheikh Zayed’s vision to protect the land for future generations.""",
      ],
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
    TextSection(
      title: "The Silver Needle",
      subTitle: "Inspired by the Desert Bloom",
      texts: [
        """Beyond being the tallest building in the world, its 'Y' shape is inspired by the Hymenocallis desert flower.""",
        """Its reflective silver skin changes color depending on the sun's position, making it a perfect visual icon.""",
        """The geometry is a masterclass in how nature influences modern engineering and high-tech design.""",
      ],
    ),
    TextSection(
      title: "Unlimited Vision",
      subTitle: "The Spirit of the Possible",
      texts: [
        """The Burj Khalifa is a symbol of the UAE's core identity: the belief that 'nothing is impossible.'""",
        """It represents the rapid transformation of a small coastal town into a leading global hub.""",
        """This landmark teaches that the UAE’s identity is built on dreaming big and having the courage to achieve it.""",
      ],
    ),
  ],
  colorTheme: Color(0xFF1E5FA3),
);

// 3. SHARJAH
PageInfo houseOfWisdom = PageInfo(
  title: "House of Wisdom",
  description: "The Floating Oasis of Knowledge",
  image: "assets/house-of-wisdom.png",
  textSections: [
    TextSection(
      title: "Transparencies Architect",
      subTitle: "Futurist Design",
      texts: [
        """This building features a massive 'floating' roof and total glass walls that blur the line between inside and out.""",
        """Outside, 'The Scroll' sculpture spirals into the sky, creating a high-tech sanctuary for visitors.""",
        """The aesthetic makes it one of the most visually stunning cultural spots for a digital app interface.""",
      ],
    ),
    TextSection(
      title: "The Intellectual Hub",
      subTitle: "A Sanctuary for Knowledge",
      texts: [
        """It represents Sharjah’s identity as the Cultural Capital of the UAE.""",
        """By combining a library with maker-spaces and labs, it shows that the UAE values knowledge as its true wealth.""",
        """This connects to the national value of education as a bridge between a glorious past and a bright future.""",
      ],
    ),
  ],
  colorTheme: Color(0xFF0F766E),
);

// 4. FUJAIRAH
PageInfo alBithnahFort = PageInfo(
  title: "Al-Bithnah Fort",
  description: "The Golden Shield: Protector of the East",
  imageAlignment: Alignment(0.3, 0),
  image: "assets/Al-Bithnah-Fort.png",
  textSections: [
    TextSection(
      title: "The Valley Sentinel",
      subTitle: "A Natural Stronghold",
      texts: [
        """Al-Bithnah sits in a lush green valley surrounded by the dark, jagged Hajar Mountains.""",
        """The contrast between the sand-colored stone and the dark mountain rock is visually dramatic.""",
        """It provides the app with a 'heritage-cool' vibe that is both ancient and visually powerful.""",
      ],
    ),
    TextSection(
      title: "Historical Resilience",
      subTitle: "The Guardian of the Valley",
      texts: [
        """Culturally, this fort was the primary shield for the eastern region of the country.""",
        """It represents the resilience and bravery of the mountain people throughout history.""",
        """It stands as a symbol of the National Identity value of 'Summoud' (steadfastness).""",
      ],
    ),
  ],
  colorTheme: Color(0xFF8F6B2E),
);

// 5. RAS AL KHAIMAH
PageInfo jebelJais = PageInfo(
  title: "Jebel Jais",
  titleColor: Colors.white,
  description: "The Peak of Excellence: The UAE's Highest Point",
  imageAlignment: Alignment(0.6, 0),
  image: "assets/Jebal-Jais.png",
  textSections: [
    TextSection(
      title: "The Mountain Ribbon",
      subTitle: "Nature’s Masterpiece",
      texts: [
        """Jebel Jais features winding, zig-zagging roads that look like giant ribbons carved into the mountainside.""",
        """It offers a rugged, earthy aesthetic that stands out from the shiny glass cityscapes.""",
        """It represents the raw, natural beauty of the UAE’s northern geography.""",
      ],
    ),
    TextSection(
      title: "The Stature of a Nation",
      subTitle: "The Strength of the People",
      texts: [
        """The mountain represents the endurance of the Emirati spirit against harsh environments.""",
        """Just as the mountain stands firm, the UAE stands firm in its cultural values.""",
        """It symbolizes the heights the nation aims to reach, connecting landscape to national goals.""",
      ],
    ),
  ],
  colorTheme: Color(0xFF2C3A8C),
);

// 6. AJMAN
PageInfo alZorahPavilion = PageInfo(
  title: "Al Zorah Pavilion",
  titleColor: Colors.white,
  description: "The Origami Wave: Minimalism in Nature",
  imageAlignment: Alignment(0.6, 0),
  image: "assets/Al-Zorah-Pavilion.png",
  textSections: [
    TextSection(
      title: "Modern Geometry",
      subTitle: "Geometric Elegance",
      texts: [
        """This building looks like a giant piece of white origami or a sleek, modern wave frozen in time.""",
        """Its sharp angles and minimalist white exterior make it a visually 'cool' modern structure.""",
        """The clean design provides a professional and high-tech look for the application's UI.""",
      ],
    ),
    TextSection(
      title: "Ecological Connection",
      subTitle: "Respect for the Land",
      texts: [
        """The Pavilion serves as the gateway to a massive, ancient mangrove forest.""",
        """Culturally, it represents the UAE’s 'Natural Identity' and the importance of coastal preservation.""",
        """It shows that modern architecture and nature can exist in perfect harmony.""",
      ],
    ),
  ],
  colorTheme: Color(0xFF1F8A70),
);

// 7. UMM AL QUWAIN
PageInfo abandonedPlane = PageInfo(
  title: "The Abandoned IL-76",
  description: "The Desert Giant: A Mystery Frozen in Time",
  image: "assets/abandoned-plane.png",
  textSections: [
    TextSection(
      title: "The Metallic Relic",
      subTitle: "Industrial Aesthetics",
      texts: [
        """This massive, abandoned Soviet-era cargo plane is a legendary 'off the beaten path' landmark.""",
        """Its rusted metallic skin and giant wings sitting in the orange sand create a unique 'mystery' vibe.""",
        """This visual is perfect for an app because it feels like a hidden secret of the desert.""",
      ],
    ),
    TextSection(
      title: "The Crossroads of Trade",
      subTitle: "The Legacy of Connection",
      texts: [
        """This plane represents the UAE's history as a global crossroads for aviation and trade.""",
        """It reminds us of how the UAE opened its doors to the world to build its modern economy.""",
        """It symbolizes the nation's journey of discovery and its welcoming attitude toward cooperation.""",
      ],
    ),
  ],
  colorTheme: Color(0xFFA34724),
);
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

  final List<TextSection> textSections;
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