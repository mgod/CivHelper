
data = [
    #Tech id, name, price, prereq, attributes
    [0,"Pottery", 45, None, None],
    [1,"Cloth Making", 45, None, "Increases ship movement by one area."],
    [2,"Metalworking", 80, None, "Increased combat effectiveness."],
    [3,"Agriculture", 110, None, "Increases population limit of areas by one."],
    [4,"Roadbuilding", 140, 6, "Allows movement through two areas. The first area may not contain units belonging to another player, Barbarian tokens or a Pirate city."],
    [5,"Mining", 180, 6, "Increases the value of a set consisting of any one of Iron, Silver, Bronze, Gems or Golds."],
    [6,"Engineering", 140, None, "Increases the effectiveness of attack against and defense of cities."],
    [7,"Astronomy", 80, None, "Allows movement across open sea areas."],
    [8,"Coinage", 110, None, "Allows taxation rates to vary from one to three tokens per city."],
    [9,"Medicine", 140, None, None],
    [10,"Mathematics", 230, None, None],
    [11,"Drama & Poetry", 60, None, None],
    [12,"Music", 60, None, None],
    [13,"Architecture", 120, None, "Up to half of the cost of building one city each turn may paid by tokens from treasury."],
    [14,"Literacy", 110, None, None],
    [15,"Law", 170, None, None],
    [16,"Democracy", 200, 15, "Prevents tax revolts."],
    [17,"Military", 180, None, "Allows the holder to build ships and move last."],
    [18,"Philosophy", 240, 15, None],
    [19,"Mysticism", 50, None, None],
    [20,"Deism", 80, None, None],
    [21,"Enlightenment", 150, None, None],
    [22,"Monotheism", 220, 21, "Allows the conversion of one adjacent area, provided the victim does not hold Monotheism or Theology."],
    [23,"Theology", 250, 21, "Immunizes the holder to the effects of Monotheism."]
]

types = [
    #0 = Craft
    #1 = Science
    #2 = Art
    #3 = Civic
    #4 = Religion
    [0,0],
    [1,0],
    [2,0],
    [3,0],
    [4,0],
    [5,0],
    [6,0],
    [6,1],
    [7,1],
    [8,1],
    [9,1],
    [10,1],
    [10,2],
    [11,2],
    [12,2],
    [13,2],
    [14,2],
    [14,3],
    [15,3],
    [16,3],
    [17,3],
    [18,3],
    [19,2],
    [19,4],
    [20,4],
    [21,4],
    [22,4],
    [23,4],
]

discounts = []

def techs_for_type(ttype):
    for pair in types:
        if pair[1] == ttype:
            yield pair[0]

def load_discounts():
    ddict = {}
    def add_discount(t, dt, discount):
        if t != dt:
            ddict[(t, dt)] = discount
    
    def tech_pairs(t, dt):
        for tech in techs_for_type(t):
            for dtech in techs_for_type(dt):
                yield tech, dtech
    
    #Crafts
    for t, dt in tech_pairs(0, 0):
        add_discount(t, dt, 10)
    
    #Engineering doesn't credit on roadbuilding or mining
    del ddict[(6,5)]
    del ddict[(6,4)]

    #Sciences
    for t, dt in tech_pairs(1, 1):
        add_discount(t, dt, 20)

    #Arts
    for t, dt in tech_pairs(2,2):
        add_discount(t, dt, 5)

    #credit for math from music
    add_discount(10, 12, 20)
    #credit for literacy from drama and poetry
    add_discount(14, 11, 20)
    
    #Civics
    #Law
    add_discount(15, 10, 5) #Math
    add_discount(15, 11, 5) #Drama & Poetry
    add_discount(15, 12, 5) #Music
    add_discount(15, 13, 15) #Architecture
    add_discount(15, 14, 25) #Literacy
    
    #Democracy
    for tech in techs_for_type(0): #Crafts
        add_discount(16, tech, 10)
    add_discount(16, 11, 10) #Drama & Poetry
    add_discount(16, 12, 10) #Music
    add_discount(16, 13, 10) #Architecture
    add_discount(16, 14, 25) #Literacy
    
    #Military
    add_discount(17, 2, 20)
    
    #Philosophy
    for tech in techs_for_type(1): #Sciences
        add_discount(18, tech, 20)
    add_discount(18, 10, 20) #Math
    add_discount(18, 12, 20) #Music
    add_discount(18, 14, 25) #Literacy
    
    #Religions
    add_discount(20, 19, 15) #Deism from Mysticism
    
    #Enlightenment
    for tech in techs_for_type(2): #Arts
        add_discount(21, tech, 10)
    #NOTE: mysticism must be after tha arts as it is one as well
    add_discount(21, 19, 15) #Mysticism
    add_discount(21, 20, 15) #Deism
    
    #Monotheism
    for tech in techs_for_type(0): #Crafts
        add_discount(22, tech, 10)
    for tech in techs_for_type(4): #Reliions
        if tech != 23: #except Theology
            add_discount(22, tech, 15)
            
    #Theology
    for tech in techs_for_type(1): #Sciences
        if tech == 10:
            add_discount(23, tech, 25)
        else:
            add_discount(23, tech, 20)
    for tech in techs_for_type(4): #Reliions
        if tech != 22: #except Monotheism
            add_discount(23, tech, 15) 
    
    #Flatten discounts
    for k, v in ddict.iteritems():
        global discounts
        discounts.append([k[0], k[1], v])
load_discounts()

def id_for_name(name):
    for t in data:
        if t[1] == name:
            return t[0]
    raise KeyError("%s not found in techs" % name)
 
def print_debug():
    def type_for_tech(tech):
        t = []
        for ttype in tech_types:
            if ttype[0] == tech:
                t.append(ttype[1])
        return "/".join([{
            0: "Craft",
            1: "Science",
            2: "Art",
            3: "Civic",
            4: "Religion"
        }[i] for i in t])
        
    def get_discount_for_pair(t, dt):
        for discount in tech_discounts:
            if discount[0] == t and discount[1] == dt:
                return discount[2]
        if t == dt:
            return "x"
        return "-"
    
    print "                      %s" % " ".join([t[1][:2] for t in tech_data])
    
    for tech in tech_data:
        st = ""
        for dt in tech_data:
            st += "%3s" % get_discount_for_pair(dt[0], tech[0])
        print "%20s %s %s" % (tech[1], st, type_for_tech(tech[0]))
#print_debug()
