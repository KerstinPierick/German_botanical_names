###########################################################################################
###########################################################################################
###########################################################################################
###                                                                                     ###
###     RANDOM GENERATOR FOR GERMAN BOTANICAL NAMES                                     ###
###                                                                                     ###
###     by: Roman Link (rlink@gwdg.de) and Kerstin Pierick                              ###
###         (kerstin.pierick@stud.uni-goettingen.de)                                    ###
###                                                                                     ###
###########################################################################################
###########################################################################################

# all three german genders
gender <- c("m", "w", "n")
# their endings for adjectives
gender_ender <- c(m = "r ", w = " ", n = "s ")


#######################################################################################
# word components ---------------------------------------------------------------------

# first halves of composed adjectives
ad1 <- c("Riesen", "Krumm", "Spitz", "Schmal", "Glatt", "Breit", "Zart", "Gold", "Blut", 
         "Schleim", "Geschlitzt", "Fieder", "Stink", "Hart", "Stumpf", "Hohl", "Lang", 
         "Kurz", "Platt", "Büschel", "Filz", "Dünn", "Dick", "Horn", "Grob",
         "Rost", "Mehl", "Steif", "Flach", "Rau", "Kraus", "Weich", "Bleich", "Blass",
         "Gilb", "Flaum", "Matt", "Furchen", "Viel", "Stark", "Schwach", "Pinsel", "Wechsel",
         "Fransen", "Nackt", "Purpur", "Leder", "Samt")

ad1_f <- c("Flausch", "Maden")

# second halves of composed adjectives
ad2 <- c("blütige", "blättrige", "fruchtige", "schuppige", "haarige", "dornige", "zottige", 
         "samige", "stängelige", "knollige", "wurzige", "drüsige", "blasige", "schotige",
         "stachelige", "rispige", "doldige", "wirtelige", "ästige", "borstige", "tüpfelige",
         "lippige", "köpfige", "rosettige", "fleischige", "hornige", "wulstige", "spelzige",
         "bereifte", "lappige", "nadelige", "kelchige")

ad2_f <- c("lurchige", "flauschige")

# complete adjectives
ad_whole <- c("Wohlriechende", "Prächtige", "Erhabene", "Gemeine", "Echte", "Falsche", 
              "Stinkende", "Aufrechte", "Niedere", "Kriechende", "Rankende", "Gefleckte", 
              "Gewöhnliche", "Edle", "Bittersüße", "Bewimperte", "Verwachsengrifflige",
              "Bittere", "Punktierte", "Gerippte", "Stumpfe", "Verarmte", "Gekrümmte", 
              "Übelriechende", "Zierliche", "Liegende", "Glanzlose", "Fremde", "Harzige", 
              "Scharfe", "Sprossende", "Zerschlitzte", "Entferntfiedrige", "Feingliedrige", 
              "Starre", "Schmierige", "Bucklige", "Wilde", "Stattliche", "Dachziegelige", 
              "Verschiedenfarbige", "Kantige", "Gekielte", "Nickende", "Steife", "Wuchernde",
              "Matte", "Duftarme", "Brennende", "Gute", "Unförmige", "Weiche", "Feindliche",
              "Angenehme", "Üppige", "Zusammengedrückte", "Wulstige", "Hohle", "Kahle", 
              "Geschuppte", "Lange", "Scheidige", "Glatte", "Wollige", "Flaumige", 
              "Aufgeblasene", "Kahle", "Täuschende", "Einfache", "Spreizende", "Knollige",
              "Tränende", "Bräunliche", "Schwärzliche", "Bläuliche", "Rötliche", "Milde",
              "Schöne", "Niederliegende", "Schlängelnde", "Hingestreckte", "Rasige", 
              "Lappenzähnige", "Friedliche", "Eingeschnittene", "Gespreizte")

ad_whole_f <- c("Hässliche")

# first halves of composed nouns
nom1 <- c("Wurm", "Bocks", "Schafs", "Esels", "Ross", "Ochsen", "Kälber", "Kröten", "Hunds",
          "Katzen", "Schweine", "Hexen", "Mutter", "Schwiegermutter", "Stink", "Schleim",
          "Faul", "Pest", "Teufels", "Satans", "Rosetten", "Gift", "Büchsen", "Schierlings",
          "Klauen", "Kratz", "Toll", "Zauber", "Brech", "Magen", "Lungen", "Leber", "Nieren",
          "Milz", "Bart", "Hart", "Franzosen", "Schein", "Todes", "Krebs", "Schling", 
          "Stachel", "Bären", "Riesen", "Hasen", "Knaben", "Jungfern", "Würge", "Öl", "Fett", 
          "Sau", "Eber", "Krähen", "Bastard", "Maul", "Mäuse", "Judas", "Leim", "Bingel", 
          "Nackt", "Nagel", "Moschus", "Abbiss", "Sumpf", "Borst", "Riemen", "Puff", 
          "Bohnen", "Sauer", "Bitter", "Horst", "Trauer", "Socken", "Zitter", "Scheiden", 
          "Blasen", "Vogelfuß", "Wimpern", "Panzer", "Venus", "Läuse", "Floh", "Zottel", 
          "Enten", "Glieder", "Hänge", "Gnaden", "Frosch", "Glocken", "Fieber", "Filz", 
          "Ferkel", "Finger", "Schlamm", "Eichel", "Brand", "Brachsen", "Borsten", "Bein", 
          "Bauern", "Adonis", "Edel", "Keulen", "Flach", "Stech", "Zwerg", "Schmerz", 
          "Wanzen", "Duft", "Wunder", "Flatter", "Trompeten", "Troll", "Tüpfel", "Wucher", 
          "Süß", "Sichel", "Hammer", "Pillen", "Schlenken", "Furchen", "Essig", "Nattern", 
          "Laser", "Lab", "Zickzack", "Rauch", "Feuer", "Johannis", "Gummi", "Habichts",
          "Frauen", "Fisch", "Feder", "Erdbeer", "Titanen", "Raspel", "Bockshorn", "Becher",
          "Besen", "Algen", "Liebes", "Lieb", "Gurken", "Drachen", "Zwirbel", "Drüsen", 
          "Stief", "Rausch", "Greis", "Milch", "Haar", "Schuppen", "Woll", "Schlick", 
          "Taumel", "Dünn", "Dick", "Rohr", "Steif", "Zwiebel", "Knaul", "Kalk", "Mähnen", 
          "Reit", "Knick", "Rau", "Ruch", "Hühner", "Nies", "Klatsch", "Manns", "Ohr", 
          "Warzen", "Schnecken", "Backen", "Kicher", "Schopf")

nom1_f <- c("Wutz", "Watz", "Flausch", "Zitzen", "Lümmel", "Aas")

# male second halves of composed nouns
nom2_m <- c("lauch", "rettich", "kopf", "schlund", "kropf", "schwingel", "klau", 
            "schierling", "kohl", "fenchel", "kümmel", "pfeffer", "dost", "quirl", "zahn", 
            "topf", "bart", "salat", "ling", "queller", "quendel", "brech", "hopfen"
            "schwanz", "lattich", "becher", "ampfer", "stöckel", "apfel", "knöterich", 
            "abbiss", "bärlapp", "kolben", "weizen", "sporn", "schnabel", "pippau", 
            "portulak", "porst", "farn", "rhabarber", "senf", "hafer", "schwaden", "halm", 
            "schöterich", "klee", "günsel", "regen", "flieder", "gamander", 
            "wedel", "schaft", "bock", "schlauch", "ziest", "gundermann", "hanf", "fuß", 
            "löffel", "gagel", "finger", "hut", "krokus", "dill", "same", "weiderich", 
            "ginster", "harnisch", "rachen", "helm", "ehrenpreis", "wacholder", "stab",
            "stängel", "lolch", "baum", "könig", "biss", "hals", "rauch", "heinrich", 
            "mantel", "spargel", "spinat", "dingel", "mohn", "flachs", "knopf", "odermennig")

nom2_m_f <- c("würger")

# female second halves of composed nouns
nom2_w <- c("rute", "wicke", "wurz", "simse", "binse", "birne", "beere", "nuss", "rapunzel",
            "pimpinelle", "berberitze", "distel", "möhre", "quecke", "miere", "melde", 
            "schote", "rübe", "kralle", "blume", "rose", "nelke", "rauke", "raute", "zunge",
            "kresse", "winde", "pimpernuss", "bohne", "quitte", "lilie", "schelle", "mistel",
            "klaue", "kirsche", "traube", "zwenke", "minze", "aster", "zichorie", "hirse",
            "eiche", "nessel", "pest", "palme", "erbse", "rebe", "mispel", "petersilie",
            "gurke", "kartoffel", "schere", "braunelle", "kerze", "trespe", "tomate", 
            "schneide", "segge", "schmiele", "klette", "alraune")

# neutral second halves of composed nouns
nom2_n <- c("röschen", "kraut", "blatt", "maul", "kissen", "blümchen", "ohr", "auge", "moos",
            "radieschen", "gras", "horn", "glöckchen", "pfötchen", "vöglein", "schwänzchen",
            "schötchen", "kätzchen", "hähnlein", "mütterchen", "schlafmützchen", "heu", 
            "mädesüß")

wordlist <- list(ad1 = ad1, ad2 = ad2, ad_whole = ad_whole,
                 nom1 = nom1, nom2_m = nom2_m, nom2_n = nom2_n, nom2_w = nom2_w)

wordlist_sorted <- lapply(wordlist, sort)
lapply(wordlist_sorted, function(x) x[duplicated(x)])


# function that randomly choses one element of vector x
samp1 <- function(x) {
  sample(x, 1)
}

# assigns second halves of composed nouns to their gender
nom2list <- list(m = nom2_m, w = nom2_w, n = nom2_n)


#######################################################################################
# function that pastes one plant name -------------------------------------------------

# Each plant name consists of an adjective and a noun. The adjective can be composed,
# and the noun can have a prefix.

plantname <- function(){
  
  # randomly samples one gender, with equal propabilities for all second halves of composed
  # nouns
  gend <- sample(gender, 1, prob = sapply(nom2list, length))
  
  # Create adjective

  if(runif(1) < 0.6) {
    # with a propability of 0.6, the adjective is drawn randomly from the group of complete
    # adjectives, and pasted together with the adequate gender ending
    ad <- paste0(samp1(ad_whole), gender_ender[gend])
  } else {
    # with a propability of 0.4, the adjective is a composition of a random first half and
    # a random second half, plus adequate gender ending
   ad <- paste0(samp1(ad1), samp1(ad2), gender_ender[gend]) 
  }
  
  # Noun
  if(runif(1) < 0.1){
    # with a propability of 0.1, the noun gets a prefix, which is randomly drawn from the 
    # group of first halves of composed nouns, and attached with a "-"
    prefix <- paste0(samp1(nom1), "-")
  } else {
    # with a propability of 0.9, the noun gets no prefix
    prefix <- ""
  }
  # the noun is composed of the prefix, a randomly drawn first half, and a randomly drawn
  # second half with the adequate gender
  noun <- paste0(prefix, samp1(nom1), samp1(nom2list[[gend]]))  
  
  # adjective and noun are pasted
  paste0(ad, noun)
}



# this function executes the plantname-function n times
paste_plantnames <- function(n){
  replicate(n, plantname()) 
}

# to get examples for export, this bit saves 200 random plant names 
exp <- c(paste_plantnames(200))

# and this one exports them as .csv
write.csv(exp, "examples.csv")

