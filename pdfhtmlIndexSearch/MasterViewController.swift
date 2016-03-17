//
//  MasterViewController.swift
//  pdfhtmlIndexSearch
//
//  Created by Jeff Mahe on 3/17/16.
//  Copyright © 2016 jmahe. All rights reserved.
//

import UIKit

var filteredSongs = [TitleList]()

let searchController = UISearchController(searchResultsController: nil)

class MasterViewController: UITableViewController {
    
    // Search bar will look for matches against searchname or englishname titles
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredSongs = songs.filter { songlist in
            return songlist.searchname.lowercaseString.containsString(searchText.lowercaseString) || songlist.englishname.lowercaseString.containsString(searchText.lowercaseString)
        }
        
        tableView.reloadData()
    }

    // MARK: - Properties
    var detailViewController: DetailViewController? = nil
    var songs = [TitleList]()
    var lastOptionSelected = String()
    var indexOfNumbers = [String]()
    var tenTemp = Int()

    var options:String = "Show PDF" {
        didSet {
            lastOptionSelected = options
        }
    }
    
    
    // MARK: - View Setup
    override func viewDidLoad() {
        super.viewDidLoad()

            songs = [
                TitleList(searchname:"1. Kuo ʻAho Hake ʻa e Po", name:"1. Kuo ʻAho Hake ʻa e Pō", englishname: "The Morning Breaks", url:"1"),
                TitleList(searchname:"2. Ko e Laumalie ʻo e 'Otua", name:"2. Ko e Laumālie ʻo e ʻOtuá", englishname: "The Spirit of God", url:"2"),
                TitleList(searchname:"3. ʻE Kainga Tau Loto-fiemalie", name:"3. ʻE Kāinga Tau Loto-fiemālie", englishname: "Now Let Us Rejoice", url:"3"),
                TitleList(searchname:"4. Vakai ʻe Kainga", name:"4. Vakai ʻe Kāinga", englishname: "High on the Mountain Top", url:"4"),
                TitleList(searchname:"5. Huhuʻi ʻo ʻIsileli", name:"5. Huhuʻi ʻo ʻIsileli", englishname: "Redeemer of Israel", url:"5"),
                TitleList(searchname:"6. ʻIsileli, ʻIsileli, ʻOku Ui ʻa e ʻOtua", name:"6. ʻIsileli, ʻIsileli, ʻOku Ui ʻa e ʻOtuá", englishname: "Israel, Israel, God Is Calling", url:"6"),
                TitleList(searchname:"7. Ko e ha Ne Ha ʻi Langi?", name:"7. Ko e hā Ne Hā ʻi Langí?", englishname: "What Was Witnessed in the Heavens?", url:"7"),
                TitleList(searchname:"8. Kuo Puna ʻa e ʻAngelo", name:"8. Kuo Puna ʻa e ʻĀngelo", englishname: "An Angel from on High", url:"8"),
                TitleList(searchname:"9. ʻOku Mau Lotua ʻa e Palofita", name:"9. ʻOku Mau Lotua ʻa e Palōfitá", englishname: "We Ever Pray for Thee", url:"9"),
                TitleList(searchname:"10. Fakamalo ki he ʻOtua", name:"10. Fakamālō ki he ʻOtua", englishname: "We Thank Thee, O God, for a Prophet", url:"10"),
                TitleList(searchname:"11. ʻOtua Tapuaki'i Si'omau Palofita ʻOfeina", name:"11. ʻOtua Tāpuakiʻi Siʻomau Palōfita ʻOfeiná", englishname: "God Bless Our Prophet Dear", url:"11"),
                TitleList(searchname:"12. Mou Omi ʻo Fanongoa", name:"12. Mou Omi ʻo Fanongoa", englishname: "Come, Listen to a Prophet’s Voice", url:"12"),
                TitleList(searchname:"13. Fanongo ki he Palofita", name:"13. Fanongo ki he Palōfita", englishname: "We Listen to a Prophet’s Voice", url:"13"),
                TitleList(searchname:"14. Ko e Fua Lotu ʻa Siosefa", name:"14. Ko e Fua Lotu ʻa Siosefá", englishname: "Joseph Smith’s First Prayer", url:"14"),
                TitleList(searchname:"15. Ko Sīsu ko e Maka-tulik", name:"15. Ko Sīsū ko e Maka-tulik", englishname: "Merrily, Merrily Over the Sea", url:"15"),
                TitleList(searchname:"16. ʻOku Mau Fakamalo", name:"16. ʻOku Mau Fakamālō", englishname: "Praise to the Man", url:"16"),
                TitleList(searchname:"17. Ko ha Tangata Fononga Fonu he Loto-mamahi", name:"17. Ko ha Tangata Fononga Fonu he Loto-mamahi", englishname: "A Poor Wayfaring Man of Grief", url:"17"),
                TitleList(searchname:"18. Haʻu Kainga ʻOua Manavahe", name:"18. Haʻu Kāinga ʻOua Manavahē", englishname: "Come, Come, Ye Saints", url:"18"),
                TitleList(searchname:"19. Ko e Mo'unga ʻo Saione", name:"19. Ko e Moʻunga ʻo Saione", englishname: "O Ye Mountains High", url:"19"),
                TitleList(searchname:"20. ʻI he Malohi ʻo Mo'unga", name:"20. ʻI he Mālohi ʻo Moʻungá", englishname: "For the Strength of the Hills", url:"20"),
                TitleList(searchname:"21. Kaingalotu Tau Hiva Hosana", name:"21. Kāingalotu Tau Hiva Hōsana", englishname: "Hail to the Brightness of Zion’s Glad Morning!", url:"21"),
                TitleList(searchname:"22. ʻE Saione ʻi ʻOlunga", name:"22. ʻE Saione ʻi ʻOlunga", englishname: "Beautiful Zion, Built Above", url:"22"),
                TitleList(searchname:"23. Ha'u ʻa e Tu'i ʻo e Ngaahi Tu'i", name:"23. Haʻu ʻa e Tuʻi ʻo e Ngaahi Tuʻi", englishname: "Come, O Thou King of Kings", url:"23"),
                TitleList(searchname:"24. Ha'u e Fanau ʻa e ʻEiki", name:"24. Haʻu e Fānau ʻa e ʻEiki", englishname: "Come, Ye Children of the Lord", url:"24"),
                TitleList(searchname:"25. Si'oku Kainga ke Mou Tokanga", name:"25. Siʻoku Kāinga ke Mou Tokanga", englishname: "Take Heed, Ye Saints", url:"25"),
                TitleList(searchname:"26. ʻOku Fafangu Mai ʻa e Ongoongoleleí", name:"26. ʻOku Fafangu Mai ʻa e Ongoongoleleí", englishname: "The Clarion Call of the Gospel", url:"26"),
                TitleList(searchname:"27. Folofola Mai ʻa Sisu", name:"27. Folofola Mai ʻa Sīsū", englishname: "Thus Sayeth the Lord", url:"27"),
                TitleList(searchname:"28. ʻA e Meʻa Mo'ui Kotoa pe", name:"28. ʻA e Meʻa Moʻui Kotoa pē", englishname: "All Creatures of Our God and King", url:"28"),
                TitleList(searchname:"29. Mamani Faka'ofo'ofa", name:"29. Māmani Fakaʻofoʻofa", englishname: "For the Beauty of the Earth", url:"29"),
                TitleList(searchname:"30. ʻOtua Ko e Fakau", name:"30. ʻOtua Ko e Fakaū", englishname: "A Mighty Fortress Is Our God", url:"30"),
                TitleList(searchname:"31. Fiefia, ko e ʻEiki ko e Tuʻi", name:"31. Fiefia, ko e ʻEiki ko e Tuʻi", englishname: "Rejoice, the Lord Is King!", url:"31"),
                TitleList(searchname:"32. Hiki Hake Homou Le'o", name:"32. Hiki Hake Homou Leʻo", englishname: "In Hymns of Praise", url:"32"),
                TitleList(searchname:"33. Ko e Naunau pea mo e Ngeia", name:"33. Ko e Nāunau pea mo e Ngeiá", englishname: "All Glory, Laud, and Honor", url:"33"),
                TitleList(searchname:"34. ʻOtua ʻo ʻEmau Ngaahi Tamai", name:"34. ʻOtua ʻo ʻEmau Ngaahi Tamai", englishname: "God of Our Fathers, Whose Almighty Hand", url:"34"),
                TitleList(searchname:"35. Laka Atu he Tui Kia Kalaisi", name:"35. Laka Atu he Tui Kia Kalaisi", englishname: "Press Forward, Saints", url:"35"),
                TitleList(searchname:"36. Ma'a E Kau Ma'oni'oni", name:"36. Maʻá E Kau Māʻoniʻoni", englishname: "For All the Saints", url:"36"),
                TitleList(searchname:"37. ʻE Kainga Kuo Langa Ha Tu'unga", name:"37. ʻE Kāinga Kuo Langa Ha Tuʻunga", englishname: "How Firm a Foundation", url:"37"),
                TitleList(searchname:"38. ʻE ʻOtua ko e Tapuha", name:"38. ʻE ʻOtua ko e Tapuhā", englishname: "How Great Thou Art", url:"38"),
                TitleList(searchname:"39. Ko e Lotu ʻo e Fakafeta'i", name:"39. Ko e Lotu ʻo e Fakafetaʻi", englishname: "Prayer of Thanksgiving", url:"39"),
                TitleList(searchname:"40. Mou Ha'u Hoku Kakai", name:"40. Mou Haʻu Hoku Kakai", englishname: "Come, Ye Thankful People", url:"40"),
                TitleList(searchname:"41. ʻE ʻOtua ko e Tupu'anga", name:"41. ʻE ʻOtua ko e Tupuʻanga", englishname: "My God, the Spring of All My Joys", url:"41"),
                TitleList(searchname:"42. Kololia ki he ʻOtua", name:"42. Kolōlia ki he ʻOtua", englishname: "Glory to God on High", url:"42"),
                TitleList(searchname:"43. ʻE Sihova Haofaki", name:"43. ʻE Sihova Haofaki", englishname: "Guide Us, O Thou Great Jehovah", url:"43"),
                TitleList(searchname:"44. Ko e ʻOtua ko e ʻOfa", name:"44. Ko e ʻOtuá ko e ʻOfa", englishname: "God Is Love", url:"44"),
                TitleList(searchname:"45. Ko e ʻEikí ko ʻEku Maama", name:"45. Ko e ʻEikí ko ʻEku Maama", englishname: "The Lord Is My Light", url:"45"),
                TitleList(searchname:"46. Haʻu ʻa Kitautolu ʻoku ʻOfa he ʻEikí", name:"46. Haʻu ʻa Kitautolu ʻoku ʻOfa he ʻEikí", englishname: "Come, We That Love the Lord", url:"46"),
                TitleList(searchname:"47. Kosipeli Ko e Maama Lelei", name:"47. Kosipeli Ko e Maama Lelei", englishname: "Lead, Kindly Light", url:"47"),
                TitleList(searchname:"48. ʻOku Ou Fei Maʻu Koe", name:"48. ʻOku Ou Fei Maʻu Koe", englishname: "I Need Thee Every Hour", url:"48"),
                TitleList(searchname:"49. Ofi Hoku ʻOtua", name:"49. Ofi Hoku ʻOtuá", englishname: "Nearer, My God, to Thee", url:"49"),
                TitleList(searchname:"50. ʻOku Ma'ongo'onga e Ho'o ʻOfa", name:"50. ʻOku Maʻongoʻonga ē Hoʻo ʻOfa", englishname: "Precious Savior, Dear Redeemer", url:"50"),
                TitleList(searchname:"51. Na'e Tala pe ʻe Sisu", name:"51. Naʻe Tala pē ʻe Sīsū", englishname: "Master, the Tempest Is Raging", url:"51"),
                TitleList(searchname:"52. Ko Hoku Tauhi ʻa Sihova", name:"52. Ko Hoku Tauhi ʻa Sihova", englishname: "The Lord Is My Keeper", url:"52"),
                TitleList(searchname:"53. Ha'u Kia Sisu", name:"53. Haʻu Kia Sīsū", englishname: "Come unto Jesus", url:"53"),
                TitleList(searchname:"54. ʻEiki ko ʻEmau Kole", name:"54. ʻEiki ko ʻEmau Kole", englishname: "Lord, Accept Our True Devotion", url:"54"),
                TitleList(searchname:"55. Ko e ʻEiki ko e Tauhi-sipi", name:"55. Ko e ʻEiki ko e Tauhi-sipi", englishname: "The Lord Is My Shepherd", url:"55"),
                TitleList(searchname:"56. Ko e ʻOfa ʻa e Fakamo'ui", name:"56. Ko e ʻOfa ʻa e Fakamoʻuí", englishname: "Our Savior’s Love", url:"56"),
                TitleList(searchname:"57. Muimui 'Iate Au", name:"57. Muimui ʻIate Au", englishname: "Come, Follow Me", url:"57"),
                TitleList(searchname:"58. Ka Faingata'a Ho Hala Feinga", name:"58. Ka Faingataʻa Ho Hala Feinga", englishname: "If the Way be Full of Trial, Weary Not", url:"58"),
                TitleList(searchname:"59. ʻOku Kei Ngangatu", name:"59. ʻOku Kei Ngangatu", englishname: "How Gentle God’s Commands", url:"59"),
                TitleList(searchname:"60. Ka Faingata'a Ho Hala", name:"60. Ka Faingataʻa Ho Hala", englishname: "Though Deepening Trials", url:"60"),
                TitleList(searchname:"61. ʻE Tamai ʻAfio ʻi Langi", name:"61. ʻE Tamai ʻAfio ʻi Langi", englishname: "Father in Heaven", url:"61"),
                TitleList(searchname:"62. Ko e Tui Mateaki", name:"62. Ko e Tui Mateakí", englishname: "When Faith Endures", url:"62"),
                TitleList(searchname:"63. Te U Ma'u ʻI Fe ʻa e Melino? ", name:"63. Te U Maʻu ʻI Fē ʻa e Melinó?", englishname: "Where Can I Turn for Peace?", url:"63"),
                TitleList(searchname:"64. Fakatapu'i Au", name:"64. Fakatapuʻi Au", englishname: "My Prayer", url:"64"),
                TitleList(searchname:"65. Ke Ke Loto-ma'ulalo", name:"65. Ke Ke Loto-māʻulalo", englishname: "Be Thou Humble", url:"65"),
                TitleList(searchname:"66. ʻOku Ou Tui Kai Kalaisi", name:"66. ʻOku Ou Tui Kai Kalaisi", englishname: "I Believe in Christ", url:"66"),
                TitleList(searchname:"67. Ko Hoku Huhu'i", name:"67. Ko Hoku Huhuʻi", englishname: "My Redeemer Lives", url:"67"),
                TitleList(searchname:"68. ʻOku Mo'ui Hoku Huhu'i", name:"68. ʻOku Moʻui Hoku Huhuʻí", englishname: "I Know That My Redeemer Lives", url:"68"),
                TitleList(searchname:"69. Ko e Fakamo'oni", name:"69. Ko e Fakamoʻoní", englishname: "Testimony", url:"69"),
                TitleList(searchname:"70. Fai Ha'o Lotu", name:"70. Fai Haʻo Lotu", englishname: "Did You Think to Pray?", url:"70"),
                TitleList(searchname:"71. Sisu, ko Hoku Malu'i", name:"71. Sīsū, ko Hoku Maluʻi", englishname: "Jesus, the Very Thought of Thee", url:"71"),
                TitleList(searchname:"72. Ko e Houa ke Lotu", name:"72. Ko e Houa ke Lotu", englishname: "Sweet Hour of Prayer", url:"72"),
                TitleList(searchname:"73. ʻOku Taki ʻa e Laumalie", name:"73. ʻOku Taki ʻa e Laumālié", englishname: "Let the Holy Spirit Guide", url:"73"),
                TitleList(searchname:"74. Ko e Lotu Lilo", name:"74. Ko e Lotu Liló", englishname: "Secret Prayer", url:"74"),
                TitleList(searchname:"75. ʻEiki ke Ke Tali Mu'a", name:"75. ʻEiki ke Ke Tali Muʻa", englishname: "Prayer Is the Soul’s Sincere Desire", url:"75"),
                TitleList(searchname:"76. Ke Tau Ngaue Malohi", name:"76. Ke Tau Ngāue Mālohi", englishname: "Gently Raise the Sacred Strain", url:"76"),
                TitleList(searchname:"77. ʻE ʻOtua ko Homau Tu'i", name:"77. ʻE ʻOtua ko Homau Tuʻi", englishname: "Sweet Is the Work", url:"77"),
                TitleList(searchname:"78. Monu ka ko ha Monu ne To", name:"78. Monū ka ko ha Monū ne Tō", englishname: "Of All Blessings Received", url:"78"),
                TitleList(searchname:"79. ʻO ka Mau ka Tutuku", name:"79. ʻO ka Mau ka Tutuku", englishname: "Lord, We Ask Thee Ere We Part", url:"79"),
                TitleList(searchname:"80. Naʻe ʻAfio'i pe ʻe Sisu", name:"80. Naʻe ʻAfioʻi pē ʻe Sīsū", englishname: "Gather the Wanderers In", url:"80"),
                TitleList(searchname:"81. Ko e Hahau To mei he Langi", name:"81. Ko e Hahau Tō mei he Langí", englishname: "As the Dew from Heaven Distilling", url:"81"),
                TitleList(searchname:"82. ʻOku ʻa e ʻOtua Kitaua", name:"82. ʻOku ʻa e ʻOtua Kitaua", englishname: "God Be with You Till We Meet Again", url:"82"),
                TitleList(searchname:"83. Kuo ʻOsi ʻa e ʻAho", name:"83. Kuo ʻOsi ʻa e ʻAho", englishname: "Now the Day Is Over", url:"83"),
                TitleList(searchname:"84. Hoku ʻEiki Te U Hu Atu", name:"84. Hoku ʻEiki Te U Hū Atu", englishname: "Before Thee, Lord, I Bow My Head", url:"84"),
                TitleList(searchname:"85. Mokomoko ʻo e ʻAho", name:"85. Mokomoko ʻo e ʻAhó", englishname: "Softly Now the Light of Day", url:"85"),
                TitleList(searchname:"86. Afe Mai Kuo Po'uli", name:"86. Afe Mai Kuo Poʻuli", englishname: "Abide with Me; ’Tis Eventide", url:"86"),
                TitleList(searchname:"87. Afe Mai He", name:"87. Afe Mai Hē", englishname: "Abide with Me!", url:"87"),
                TitleList(searchname:"88. ʻO ka Tau Tutuku Hiva Fiefia", name:"88. ʻO ka Tau Tutuku Hiva Fiefia", englishname: "Sing We Now at Parting", url:"88"),
                TitleList(searchname:"89. ʻEiki ke Ke Tapuaki", name:"89. ʻEiki ke Ke Tāpuaki", englishname: "Lord, Dismiss Us with Thy Blessing", url:"89"),
                TitleList(searchname:"90. Sisu Homau Huhu'i", name:"90. Sīsū Homau Huhuʻi", englishname: "In Humility, Our Savior", url:"90"),
                TitleList(searchname:"91. ʻOtua Tali ʻEmau Hu", name:"91. ʻOtua Tali ʻEmau Hū", englishname: "God, Our Father, Hear Us Pray", url:"91"),
                TitleList(searchname:"92. Ne Fai pe mei Kalevale", name:"92. Ne Fai pē mei Kālevale", englishname: "Take the Name of Jesus with You", url:"92"),
                TitleList(searchname:"93. ʻOku Mau Fakamanatu", name:"93. ʻOku Mau Fakamanatu", englishname: "While of These Emblems We Partake", url:"93"),
                TitleList(searchname:"94. ʻE Tamai Ta'engata", name:"94. ʻE Tamai Taʻengata", englishname: "O God, the Eternal Father", url:"94"),
                TitleList(searchname:"95. Sisu ʻo Nasaleti", name:"95. Sīsū ʻo Nāsaleti", englishname: "Jesus of Nazareth, Savior and King", url:"95"),
                TitleList(searchname:"96. Fakaʻofa Kiate Au", name:"96. Fakaʻofa Kiate Au", englishname: "He Who Was Crucified", url:"96"),
                TitleList(searchname:"97. Tau Fakamalo Kai Sisu", name:"97. Tau Fakamālō Kai Sīsū", englishname: "We’ll Sing All Hail to Jesus’ Name", url:"97"),
                TitleList(searchname:"98. Sisu e Na'a Ne Paki", name:"98. Sīsū ē Naʻá Ne Paki", englishname: "Jesus Who Breaketh Bread", url:"98"),
                TitleList(searchname:"99. Ne Kalusefai ʻa e ʻEiki", name:"99. Ne Kalusefai ʻa e ʻEikí", englishname: "Upon the Cross of Calvary", url:"99"),
                TitleList(searchname:"100. ʻE Vakai Na'e Pekia", name:"100. ʻE Vakai Naʻe Pekia", englishname: "Behold the Great Redeemer Die", url:"100"),
                TitleList(searchname:"101. Ke Tau Fakamanatu", name:"101. Ke Tau Fakamanatu", englishname: "In Memory of the Crucified", url:"101"),
                TitleList(searchname:"102. ʻOku Fakaofo", name:"102. ʻOku Fakaofo", englishname: "I Stand All Amazed", url:"102"),
                TitleList(searchname:"103. ʻOku ʻi ai ha Fonua", name:"103. ʻOku ʻi ai ha Fonua", englishname: "There Is a Green Hill Far Away", url:"103"),
                TitleList(searchname:"104. Tau Lotu pea Tau Hu", name:"104. Tau Lotu pea Tau Hū", englishname: "Reverently and Meekly Now", url:"104"),
                TitleList(searchname:"105. Na'e Lahi Fau ʻa e ʻOfa", name:"105. Naʻe Lahi Fau ʻa e ʻOfa", englishname: "How Great the Wisdom and the Love", url:"105"),
                TitleList(searchname:"106. Na'e ʻOfa Pehe ʻa e ʻOtua", name:"106. Naʻe ʻOfa Pehē ʻa e ʻOtuá", englishname: "God Loved Us, So He Sent His Son", url:"106"),
                TitleList(searchname:"107. Sisu e Ne ʻAlo'i", name:"107. Sīsū ē Ne ʻAloʻi", englishname: "Jesus, Once of Humble Birth", url:"107"),
                TitleList(searchname:"108. Kuo Toe Tu'u", name:"108. Kuo Toe Tuʻu", englishname: "He Is Risen!", url:"108"),
                TitleList(searchname:"109. Kuo Toe Tu'u ʻa e ʻEiki", name:"109. Kuo Toe Tuʻu ʻa e ʻEiki", englishname: "Christ the Lord Is Risen Today", url:"109"),
                TitleList(searchname:"110. Fiefia ki Mamani", name:"110. Fiefia ki Māmani", englishname: "Joy to the World", url:"110"),
                TitleList(searchname:"111. Mou Ha'u Kainga", name:"111. Mou Haʻu Kāinga", englishname: "Oh, Come, All Ye Faithful", url:"111"),
                TitleList(searchname:"112. Fanongoa Kau ʻAngelo", name:"112. Fanongoa Kau ʻĀngelo", englishname: "Angels We Have Heard on High", url:"112"),
                TitleList(searchname:"113. Po Malu", name:"113. Pō Mālū", englishname: "Silent Night", url:"113"),
                TitleList(searchname:"114. Naʻe ʻAlo'i Mai ʻa Sisu Kalaisi", name:"114. Naʻe ʻAloʻi Mai ʻa Sīsū Kalaisi", englishname: "Away in a Manger", url:"114"),
                TitleList(searchname:"115. Ne Ha Mai Tu'uapo", name:"115. Ne Hā Mai Tuʻuapō", englishname: "It Came upon the Midnight Clear", url:"115"),
                TitleList(searchname:"116. Kolo ko Petelihema", name:"116. Kolo ko Pētelihemá", englishname: "O Little Town of Bethlehem", url:"116"),
                TitleList(searchname:"117. Lolotonga Le'o ʻa e Kau Tauhi-sipi ʻi he Po", name:"117. Lolotonga Leʻo ʻa e Kau Tauhi-sipi ʻi he Pō", englishname: "While Shepherds Watched Their Flocks", url:"117"),
                TitleList(searchname:"118. Kau, ʻAngelo ne Hiva", name:"118. Kau, ʻĀngelo ne Hiva", englishname: "Hark! The Herald Angels Sing", url:"118"),
                TitleList(searchname:"119. Na'e Ofo ʻa e Kau Poto", name:"119. Naʻe Ofo ʻa e Kau Potó", englishname: "With Wondering Awe", url:"119"),
                TitleList(searchname:"120. ʻA e Kau Tauhi-sipi ʻi Siutea", name:"120. ʻA e Kau Tauhi-sipi ʻi Siutea", englishname: "Far, Far Away on Judea’s Plains", url:"120"),
                TitleList(searchname:"121. Ne U Ongo'i ʻa e Ngaahi Fafangu", name:"121. Ne U Ongoʻi ʻa e Ngaahi Fafangú", englishname: "I Heard the Bells on Christmas Day", url:"121"),
                TitleList(searchname:"122. Hiva ʻa e Kau ʻAngelo", name:"122. Hiva ʻa e Kau ʻĀngeló", englishname: "The First Noel", url:"122"),
                TitleList(searchname:"123. ʻOku Tau To ʻa e Tenga", name:"123. ʻOku Tau Tō ʻa e Tenga", englishname: "We Are Sowing", url:"123"),
                TitleList(searchname:"124. Tau Fakaake", name:"124. Tau Fakaake", englishname: "Come, Let Us Anew", url:"124"),
                TitleList(searchname:"125. ʻOku Mau Hu Atu", name:"125. ʻOku Mau Hū Atu", englishname: "We Give Thee But Thine Own", url:"125"),
                TitleList(searchname:"126. Kuo Lahi Hoku Tapuakí", name:"126. Kuo Lahi Hoku Tāpuakí", englishname: "Because I Have Been Given Much", url:"126"),
                TitleList(searchname:"127. ʻEiki, te U Muimui Atu", name:"127. ʻEiki, te U Muimui Atu", englishname: "Lord, I Would Follow Thee", url:"127"),
                TitleList(searchname:"128. ʻOku ʻOfa ʻa e Tauhi", name:"128. ʻOku ʻOfa ʻa e Tauhi", englishname: "Dear to the Heart of the Shepherd", url:"128"),
                TitleList(searchname:"129. Kuo U Fai ha Lelei?", name:"129. Kuó U Fai ha Lelei?", englishname: "Have I Done Any Good?", url:"129"),
                TitleList(searchname:"130. Ko e Ngaue ke Fai", name:"130. Ko e Ngāue ke Fai", englishname: "I Have Work Enough to Do", url:"130"),
                TitleList(searchname:"131. Tau Tuku Kololia", name:"131. Tau Tuku Kolōlia", englishname: "We Are Marching On to Glory", url:"131"),
                TitleList(searchname:"132. Tokanga ki he Taimi", name:"132. Tokanga ki he Taimi", englishname: "Improve the Shining Moments", url:"132"),
                TitleList(searchname:"133. Lolotonga ʻEku Nofo", name:"133. Lolotonga ʻEku Nofo", englishname: "There Is Sunshine in My Soul Today", url:"133"),
                TitleList(searchname:"134. Te Ke Lava Fakaha", name:"134. Te Ke Lava Fakahā", englishname: "You Can Make the Pathway Bright", url:"134"),
                TitleList(searchname:"135. Ko e ʻAho ke Ngaue he ʻOfa", name:"135. Ko e ʻAho ke Ngāue he ʻOfa", englishname: "Today, While the Sun Shines", url:"135"),
                TitleList(searchname:"136. ʻI he Mamani mo e Faingata'a", name:"136. ʻI he Māmani mo e Faingataʻa", englishname: "Scatter Sunshine", url:"136"),
                TitleList(searchname:"137. Sisu Tu'i Mafimafi", name:"137. Sīsū Tuʻi Māfimafi", englishname: "Jesus, Mighty King in Zion", url:"137"),
                TitleList(searchname:"138. Kuo Hopo ʻa e La'a", name:"138. Kuo Hopo ʻa e Laʻā", englishname: "Catch the Sunshine!", url:"138"),
                TitleList(searchname:"139. Lau ʻEni ko e Tofi'a", name:"139. Lau ʻEni ko e Tofiʻa", englishname: "This Your Inheritance", url:"139"),
                TitleList(searchname:"140. ʻOua te Ke Fakamaau", name:"140. ʻOua te Ke Fakamaau", englishname: "Should You Feel Inclined to Censure", url:"140"),
                TitleList(searchname:"141. Lea ʻIta ʻOua Naʻa Tuku ke Puna Noa pe", name:"141. Lea ʻIta ʻOua Naʻa Tuku ke Puna Noa pē", englishname: "Angry Words! Oh, Let Them Never", url:"141"),
                TitleList(searchname:"142. Kapau te Tau Fe'ofo'ofani", name:"142. Kapau te Tau Feʻofoʻofani", englishname: "Let Us Oft Speak Kind Words", url:"142"),
                TitleList(searchname:"143. ʻOku Lelei ʻa e Lea Vaivai", name:"143. ʻOku Lelei ʻa e Lea Vaivai", englishname: "Nay, Speak No Ill", url:"143"),
                TitleList(searchname:"144. Kumi ki Ho'o Folofola", name:"144. Kumi ki Hoʻo Folofolá", englishname: "As I Search the Holy Scriptures", url:"144"),
                TitleList(searchname:"145. Faitotonu Neongo ʻa e Luma", name:"145. Faitotonu Neongo ʻa e Luma", englishname: "Do What Is Right", url:"145"),
                TitleList(searchname:"146. Fili ʻa e Mo'oni", name:"146. Fili ʻa e Moʻoní", englishname: "Choose the Right", url:"146"),
                TitleList(searchname:"147. Fakamalo he Tapuaki", name:"147. Fakamālō he Tāpuaki", englishname: "Praise God, from Whom All Blessings Flow", url:"147"),
                TitleList(searchname:"148. Tanaki Ho Ngaahi Tapuaki", name:"148. Tānaki Ho Ngaahi Tāpuaki", englishname: "Count Your Blessings", url:"148"),
                TitleList(searchname:"149. Tuku ke Tau Faimalohi", name:"149. Tuku ke Tau Faimālohi", englishname: "Let Us All Press On", url:"149"),
                TitleList(searchname:"150. Laka Atu ʻe Kainga ki he Tau", name:"150. Laka Atu ʻe Kāinga ki he Tau", englishname: "Onward, Christian Soldiers", url:"150"),
                TitleList(searchname:"151. ʻA Hake Kau Le'o ʻo Saione", name:"151. ʻĀ Hake Kau Leʻo ʻo Saione", englishname: "Up, Awake, Ye Defenders of Zion", url:"151"),
                TitleList(searchname:"152. ʻE ʻOtua Mafimafi ʻAfio Mai", name:"152. ʻE ʻOtua Māfimafi ʻAfio Mai", englishname: "We Are All Enlisted", url:"152"),
                TitleList(searchname:"153. Fanongo ko e ʻEiki ʻoku Ui", name:"153. Fanongo ko e ʻEiki ʻoku Ui", englishname: "Called to Serve", url:"153"),
                TitleList(searchname:"154. ʻA e Kau Tau ʻa e ʻOtua", name:"154. ʻA e Kau Tau ʻa e ʻOtua", englishname: "Behold! A Royal Army", url:"154"),
                TitleList(searchname:"155. ʻE ʻAonga ki Mamani ha Kau Ngaue Lelei", name:"155. ʻE ʻAonga ki Māmani ha Kau Ngāue Lelei", englishname: "Put Your Shoulder to the Wheel", url:"155"),
                TitleList(searchname:"156. Ko Ho'o Kau Tamaio'eiki", name:"156. Ko Hoʻo Kau Tamaioʻeikí", englishname: "Thy Servants Are Prepared", url:"156"),
                TitleList(searchname:"157. Tauhi ʻa e Mo'oni", name:"157. Tauhi ʻa e Moʻoní", englishname: "True to the Faith", url:"157"),
                TitleList(searchname:"158. Fai Atu ʻa e Ngaue", name:"158. Fai Atu ʻa e Ngāué", englishname: "Carry On", url:"158"),
                TitleList(searchname:"159. Kau Talavou ʻo Saione", name:"159. Kau Talavou ʻo Saione", englishname: "As Zion’s Youth in Latter Days", url:"159"),
                TitleList(searchname:"160. Sisu ne Ne Huhu'i", name:"160. Sīsū ne Ne Huhuʻi", englishname: "O Thou Rock of Our Salvation", url:"160"),
                TitleList(searchname:"161. ʻE Kainga Kuo Hao", name:"161. ʻE Kāinga Kuo Hao", englishname: "Hope of Israel", url:"161"),
                TitleList(searchname:"162. Laka he Tui pea Fakaha", name:"162. Laka he Tui pea Fakahā", englishname: "Go Forth with Faith", url:"162"),
                TitleList(searchname:"163. Tau Nofo he ʻEiki Hono Tafa'aki", name:"163. Tau Nofo he ʻEiki Hono Tafaʻaki", englishname: "Who’s on the Lord's Side?", url:"163"),
                TitleList(searchname:"164. Ke Fiefia ʻa Mamani", name:"164. Ke Fiefia ʻa Māmani", englishname: "Hark, All Ye Nations!", url:"164"),
                TitleList(searchname:"165. Sihova, ʻEiki ʻo Langi mo Mamani", name:"165. Sihova, ʻEiki ʻo Langi mo Māmani", englishname: "Jehovah, Lord of Heaven and Earth", url:"165"),
                TitleList(searchname:"166. ʻO ka Tau ka Faka'aonga'i ʻa e Taimi", name:"166. ʻO ka Tau ka Fakaʻaongaʻi ʻa e Taimi", englishname: "The Time Is Far Spent", url:"166"),
                TitleList(searchname:"167. ʻOku Fakaofo Ho'o Ngaue", name:"167. ʻOku Fakaofo Hoʻo Ngāué", englishname: "How Wondrous and Great", url:"167"),
                TitleList(searchname:"168. Tala ʻe he Folofola", name:"168. Tala ʻe he Folofola", englishname: "Oh, Holy Words of Truth and Love", url:"168"),
                TitleList(searchname:"169. Ko e Faitotonu ʻo Faka-'Otua", name:"169. Ko e Faitotonu ʻo Faka-ʻOtua", englishname: "Oh Say, What Is Truth?", url:"169"),
                TitleList(searchname:"170. ʻOku Aata ʻa e Mo'oni", name:"170. ʻOku Aata ʻa e Moʻoní", englishname: "Truth Reflects upon Our Senses", url:"170"),
                TitleList(searchname:"171. Te U Fai Ho Finangalo", name:"171. Te U Fai Ho Finangaló", englishname: "I’ll Go Where You Want Me to Go", url:"171"),
                TitleList(searchname:"172. Ko e Va'a Ukamea", name:"172. Ko e Vaʻa Ukameá", englishname: "The Iron Rod", url:"172"),
                TitleList(searchname:"173. Fetaulaki Fiefia", name:"173. Fetaulaki Fiefia", englishname: "Gladly Meeting", url:"173"),
                TitleList(searchname:"174. Ha'u ki he Lautohi Faka-Sapate", name:"174. Haʻu ki he Lautohi Faka-Sāpate", englishname: "Come Away to the Sunday School", url:"174"),
                TitleList(searchname:"175. Si'oto ʻOfa Sapate", name:"175. Siʻoto ʻOfa Sāpate", englishname: "Welcome, Welcome, Sabbath Morning", url:"175"),
                TitleList(searchname:"176. Tokoni Mai ke U Ako'i", name:"176. Tokoni Mai ke U Akoʻi", englishname: "Help Me Teach with Inspiration", url:"176"),
                TitleList(searchname:"177. Ka ne Ke ʻAlu ki Kolapa", name:"177. Ka ne Ke ʻAlu ki Kolapa", englishname: "If You Could Hie to Kolob", url:"177"),
                TitleList(searchname:"178. ʻOku ʻAlu Fano ʻa e ʻOtua", name:"178. ʻOku ʻAlu Fano ʻa e ʻOtua", englishname: "God Moves in a Mysterious Way", url:"178"),
                TitleList(searchname:"179. Ko e Hiva ʻo e Loto", name:"179. Ko e Hiva ʻo e Lotó", englishname: "Oh, What Songs of the Heart", url:"179"),
                TitleList(searchname:"180. Kainga Tau Hu he Temipale", name:"180. Kāinga Tau Hū he Temipale", englishname: "Rise, Ye Saints, and Temples Enter", url:"180"),
                TitleList(searchname:"181. ʻOku Faka'ofo'ofa ʻa e Fale ʻo e ʻEiki", name:"181. ʻOku Fakaʻofoʻofa ʻa e Fale ʻo e ʻEikí", englishname: "How Beautiful Thy Temples, Lord", url:"181"),
                TitleList(searchname:"182. Liliu Homou Loto", name:"182. Liliu Homou Lotó", englishname: "Turn Your Hearts", url:"182"),
                TitleList(searchname:"183. Ke Tau Tokanga Muʻa", name:"183. Ke Tau Tokanga Muʻa", englishname: "Let Us Therefore Take Heed", url:"183"),
                TitleList(searchname:"184. Fakaha ʻe he ʻOtua", name:"184. Fakahā ʻe he ʻOtua", englishname: "God Is Willing to Gather", url:"184"),
                TitleList(searchname:"185. ʻE Tamai ʻi Hevani e", name:"185. ʻE Tamai ʻi Hēvani ē", englishname: "O My Father", url:"185"),
                TitleList(searchname:"186. Ko e Taki ki he Lelei", name:"186. Ko e Taki ki he Lelei", englishname: "Each Life That Touches Ours for Good", url:"186"),
                TitleList(searchname:"187. ʻOfa 'i 'Api", name:"187. ʻOfa ʻi ʻApi", englishname: "Love at Home", url:"187"),
                TitleList(searchname:"188. Hoko ʻa ʻApi ko e Hevani", name:"188. Hoko ʻa ʻApi ko e Hēvani", englishname: "Home Can Be a Heaven on Earth", url:"188"),
                TitleList(searchname:"189. ʻA e ʻOfa Taau mo e ʻAlo", name:"189. ʻA e ʻOfa Taau mo e ʻAló", englishname: "O Love That Glorifies the Son", url:"189"),
                TitleList(searchname:"190. ʻE Fanau ko e ʻOtua e", name:"190. ʻE Fānau ko e ʻOtua ē", englishname: "Dearest Children, God Is Near You", url:"190"),
                TitleList(searchname:"191. Fanau ʻEtau Tamai ʻi Hevani", name:"191. Fānau ʻEtau Tamai ʻi Hēvaní", englishname: "Children of Our Heavenly Father", url:"191"),
                TitleList(searchname:"192. Ko e Famili ke Ta'e Ngata", name:"192. Ko e Fāmilí ke Taʻe Ngata", englishname: "Families Can Be Together Forever", url:"192"),
                TitleList(searchname:"193. Fanau Au ʻa e ʻOtua", name:"193. Fānau Au ʻa e ʻOtua", englishname: "I Am a Child of God", url:"193"),
                TitleList(searchname:"194. ʻOku Moʻui ʻEku Tamai", name:"194. ʻOku Moʻui ʻEku Tamaí", englishname: "I Know My Father Lives", url:"194"),
                TitleList(searchname:"195. Tauhi ʻa e Ngaahi Fekau ", name:"195. Tauhi ʻa e Ngaahi Fekaú", englishname: "Keep the Commandments", url:"195"),
                TitleList(searchname:"196. Akoʻi Au ke U ʻEva he Mama", name:"196. Akoʻi Au ke U ʻEva he Māmá", englishname: "Teach Me to Walk in the Light", url:"196"),
                TitleList(searchname:"197. Ko e Maama Faka-'Otua", name:"197. Ko e Maama Faka-ʻOtuá", englishname: "The Light Divine", url:"197"),
                TitleList(searchname:"198. Ko e ʻOfa ʻa e ʻOtua", name:"198. Ko e ʻOfa ʻa e ʻOtuá", englishname: "God’s Daily Care", url:"198"),
                TitleList(searchname:"199. ʻOku ai ʻi Mamani", name:"199. ʻOku ai ʻi Māmani", englishname: "In Our Lovely Deseret", url:"199"),
                TitleList(searchname:"200. Ke Mou Fe'ofa'aki", name:"200. Ke Mou Feʻofaʻaki", englishname: "Love One Another", url:"200"),
                TitleList(searchname:"201. Kau Fefine ʻo Saione", name:"201. Kau Fefine ʻo Saioné", englishname: "As Sisters in Zion", url:"201"),
                TitleList(searchname:"202. ʻA Kimoutolu ʻa e Kau Faifekau", name:"202. ʻA Kimoutolu ʻa e Kau Faifekau", englishname: "Ye Elders of Israel", url:"202"),
                TitleList(searchname:"203. Kuo Ui Kimoutolu", name:"203. Kuo Ui Kimoutolu", englishname: "Ye Who Are Called to Labor", url:"203"),
                TitleList(searchname:"204. Mou Ha'u Katoa Mai", name:"204. Mou Haʻu Kātoa Mai", englishname: "Come, All Ye Sons of God", url:"204"),
                TitleList(searchname:"205. I He Pekia Leva 'a Sisu", name:"205. I He Pekia Leva 'a Sisu", englishname: " ", url:"205")
            
        ]

        // List of index values
        let indexNumbers = "{search} 1 10 20 30 40 50 60 70 80 90 100 110 120 130 140 150 160 170 180 190 200 End"
        indexOfNumbers = indexNumbers.componentsSeparatedByString(" ")

        // Search bar
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar

        if let splitViewController = splitViewController {
            let controllers = splitViewController.viewControllers
            detailViewController = (controllers[controllers.count - 1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table View
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if searchController.active && searchController.searchBar.text != "" {
            return filteredSongs.count
        }
        return songs.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let song: TitleList
        if searchController.active && searchController.searchBar.text != "" {
            song = filteredSongs[indexPath.row]
        } else {
            song = songs[indexPath.row]
        }
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.englishname
        return cell
    }

    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {

        if (searchController.active) {
            return nil
        }
        else {
            return indexOfNumbers
        }
    }

    override func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {

        // Each index will map to a title by multiples of 10.  Account for search bar, so subtract by 11.
        let temp = indexOfNumbers as NSArray
        tenTemp = (temp.indexOfObject(title) * 10) - 11
        
        // Check the value of tenTemp. Assign "End" search index to last index row.
        //print("This is the value of tenTemp")
        //print(tenTemp)
        
        if tenTemp == -1 || tenTemp == -11 {
            self.tableView.scrollRectToVisible((tableView.tableHeaderView?.frame)!, animated: false)
            return -1
        }
        else if tenTemp == 209 {
            let indexPath = NSIndexPath(forRow: 204, inSection: 0)
            self.tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: .Bottom, animated: true)
        }
        else {
            let indexPath = NSIndexPath(forRow: tenTemp, inSection: 0)
            self.tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: .Top, animated: true)
        }

        return temp.indexOfObject(title)
    }
    
    // MARK: - Segues
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let song: TitleList
                if searchController.active && searchController.searchBar.text != "" {
                    song = filteredSongs[indexPath.row]
                } else {
                    song = songs[indexPath.row]
                }
                
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.detailSong = song
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
                controller.passOption = options
                
            }
        }
        if segue.identifier == "showOptions" {
            if let settingTableViewController = segue.destinationViewController as? SettingTableViewController {
                settingTableViewController.selectedOption = options
            }
        }
    }
    
    //Unwind segue
    @IBAction func unwindWithSelectedOption(segue:UIStoryboardSegue) {
        if let settingPickerViewController = segue.sourceViewController as? SettingTableViewController,
            selectedOption = settingPickerViewController.selectedOption {
                options = selectedOption
        }
    }
    
}

extension MasterViewController: UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}