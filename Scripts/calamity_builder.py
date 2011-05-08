from tech_builder import id_for_name

cards = [
    #id, name, level, tradeable, rules
    [0, "Volcanic Eruption or Earthquake", 2, False, """30.211 If the primary victim has any cities in an area touched by a volcano, the volcano erupts and eliminates all units, irrespective of ownership, in the areas touched by the volcano. If the primary victim has cities in areas touched by more than one volcano, the site of the eruption is that which causes the greatest total damage to the primary victim and any secondary victims. In the event of a tie, the primary victim selects the location of the eruption.

30.212 If the primary victim has no cities in an area touched by a volcano, one of his cities is destroyed by earthquake. One city belonging to another player is reduced. This second city must be in an area adjacent to the destroyed city, even across water. As above, the site of the earthquake is that which causes the greatest total damage.

30.213 If the primary victim holds Engineering, an earthquake reduces, rather than destroys, his city. A player who holds Engineering may not be selected as a secondary victim of an Earthquake. Engineering has no effect on Volcanoes."""],
    [1, "Treachery", 2, True, """30.221 One city belonging to the primary victim is replaced by one city belonging to the player who traded him the card. If the trading player has no available cities, the victim's city is eliminated. The player trading the card selects the city.

30.222 If Treachery is drawn by a player and not traded, one city belonging to that player is reduced. As no one traded the card to the primary victim, no other player benefits from the primary victim's misfortune."""],
    [2, "Famine", 3, False, """30.311 The primary victim loses ten unit points himself, and must instruct other players to remove 20 unit points, no more than eight of which may come from any one player. The primary victim decides how many unit points are lost by each of the secondary victims, but the secondary victims decide which units to remove.

30.312 Players who hold Pottery may reduce their losses by four unit points for each Grain trade card held. Grain cards used for this purpose are not discarded, but must be placed face up in front of the player until the end of the turn and may not be used to acquire civilization cards until the following turn."""],
    [3, "Superstition", 3, True, """30.321 Three cities belonging to the primary victim are reduced. The primary victim chooses which cities.

30.322 If the primary victim has Mysticism, two cities are reduced; if the primary victim holds Deism, one city is reduced; if the primary victim holds Enlightenment, there is no effect. These effects are not cumulative. The governing efect is that of the highest level Religion card held."""],
    [4, "Civil War", 4, False, """30.411 The primary victim's nation is divided into two factions. The player with the most unit points in stock is the beneficiary of the Civil War. This determination is made by counting tokens in stock (one each) and cities in stock (five each). If the primary victim has the most units in stock there is no Civil War.

30.412 The composition of the first faction is decided by both the primary victim and the beneficiary as follows:

30.4121 The primary victim begins by selecting 15 unit points.

30.4122 If the primary victim holds Music he selects an additional five unit points. If the primary victim holds Drama and Poetry he selects an additional five unit points. If the primary victim holds Democracy he selects an additional ten unit points. The effects of Music, Drama and Poetry, and Democracy are cumulative.

30.4123 After the primary victim completes his selection, the beneficiary selects an additional 20 unit points belonging to the primary victim to complete the first faction.

30.4124 If the primary victim holds Philosophy, the first faction is automatically comprised of 15 units chosen by the beneficiary, regardless of any other civilization cards held by the primary victim.

30.413 Whatever remains constitutes the second faction. If there is no second faction there is no Civil War.

30.414 If the primary victim holds Military, five unit points are removed from each faction to reflect the increased destructiveness of the Civil War. The required units are removed after factions are selected. Each player must, if possible, remove the required units from areas adjacent to the other faction.

30.415 The primary victim then decides whether he will continue to play the units of the first or second faction. The primary victim retains his stock, ships, treasury, civilization cards, and position on the A.S.T. The beneficiary annexes whichever faction is not retained by the primary victim by replacing the units involved with his own. If he runs out of units, the remainder are taken over by the next player with the most units in stock, and so on."""],
    [5, "Slave Revolt", 4, True, """30.421 Fifteen tokens belonging to the primary victim may not be used to support his cities. This effect is resolved immediately. After the end of the current calamity phase, the tokens again function normally.

30.422 Cities are reduced one at a time, with the newly available tokens being eligible to provide support for the victim's remaining cities (see 26.6). If the primary victim has less than fifteen tokens on the board, only those tokens are affected by Slave Revolt. Tokens placed on the board after the resulting reduction of the primary victim's cities may always be used for city support.

30.423 If the primary victim holds Mining, an additional five tokens may not be used for city support. If the primary victim holds Enlightenment, the number of tokens which may not be used for city support is reduced by five. If a player holds both Mining and Enlightenment, the efects cancel."""],
    [6, "Flood", 5, False, """30.511 If the primary victim has units on a flood plain (4.42), he loses a maximum of 17 unit points from that flood plain. Cities are vulnerable to flood if they have been built in areas with no city site or a city shown as a white square. Cities on black city sites are safe.

30.512 Ten unit points on the same flood plain belonging to one or more secondary victims are also removed. The primary victim divides the ten unit point loss among the secondary victims as he chooses, but the secondary victims themselves choose which units are to be lost. If the number of units on the affected flood plain belonging to other players totals ten unit points or less, all those other players automatically become secondary victims and all their units are eliminated.

30.513 If the primary victim has units on more than one flood plain, the flood occurs on the flood plain containing the greatest number of his unit points. In the event of tie, the primary victim selects the location of the flood.

30.514 If the primary victim has no units in a flood plain, one of his coastal cities is eliminated. The primary victim chooses the city. If the primary victim has no coastal cities, he is unaffected by the flood.

30.515 A player who holds Engineering who has units on a food plain loses a maximum of seven unit points from food, whether as a primary or secondary victim. If a primary victim who holds Engineering has no units on a food plain, one of his coastal cities is reduced rather than eliminated."""],
    [7, "Barbarian Hordes", 5, True, """30.521 Initial placement

30.5211 Fifteen tokens belonging to one of the nations which did not start the game are placed in one of the primary victim's start areas. These Barbarian tokens are placed in the start area which causes the greatest damage to the primary victim. If the primary victim does not have units in any of his start areas, the Barbarians are initially placed in an empty start area. They may be placed in an area which contains units belonging to a player other than the primary victim only if no other area is available.

30.5212 Immediately after initial placement, conflict is resolved between the newlyplaced Barbarians and any units, including those of nations other than the primary victim, in the area occupied by the Barbarians.

30.523 Continued movement

30.5231 Once conflict arising out of their initial placement is resolved, all surviving Barbarians in excess of the population limit of the area of initial placement move to the adjacent area which will result in the greatest damage to the primary victim. Conflict is again resolved.

30.5232 This process is repeated until there are no surplus Barbarian tokens. At the end of the calamity phase, surviving Barbarian tokens may not exceed the population limits of the areas they occupy.

30.5233 Barbarians always move as a unit, other than when they leave tokens in areas they have already occupied. Barbarians may move across water boundaries, but not across open sea areas.

30.5234 The movement of Barbarians is governed by the principle that they always move into the area which causes the greatest immediate damage to the primary victim. No calculation is made as to whether the overall damage to the primary victim would be greater if the Barbarians went into one area as opposed to another, as the determination of greatest damage is made for each Barbarian movement in turn.

30.5235 All movement and conflict involving Barbarians is completed during the calamity phase, prior to the resolution of any other calamities. Once the Barbarians have stopped moving, they remain on the board until eliminated by other players. Barbarians do not increase their population and may not be selected as secondary victims of calamities.

30.524 Conflict with other nations

30.5241 Barbarians must enter areas occupied solely by cities or tokens belonging to the primary victim, provided they can inflict damage on the primary victim by entering such areas. If they are unable to move into such an area, they may enter empty areas or areas occupied by units belonging to other nations in order to reach the nearest area in which they can inflict damage on the primary victim.

30.5242 If Barbarians enter areas containing units belonging to nations other than the primary victim, they engage in conflict with those units. Barbarians do not attack their own tokens, and thus may pass through areas they have already occupied with no ill effects. It is possible that a primary victim who has no units near his starting areas might not suffer any ill effects from this calamity, as the Barbarians might exhaust themselves ravaging and occupying areas while trying to reach the nearest vulnerable primary victim units.

30.525 Resolving ties

30.5251 If Barbarians have a choice of areas to enter, the player who traded the calamity to the primary victim selects the area. If the calamity was not traded, such decisions are made by the player with the most units in stock at the time the calamity is resolved.

30.5252 Barbarian tokens do not benefit from any of the attributes of their controlling player.

30.526 If Barbarians eliminate a city, no trade card is drawn from the victim.

30.527 Crete may not be the primary victim of Barbarian Hordes."""],
    [8, "Epidemic", 6, True, """30.611 The primary victim loses 16 unit points. The primary victim must also order other players to lose 25 unit points of their choice, no more than 10 of which may come from any one player. The player who traded Epidemic to the primary victim may not be selected as a secondary victim.

30.612 A nation removing tokens as a result of an Epidemic must leave at least one token in each affected area. Cities which are eliminated by an Epidemic are replaced by at least one token, so cities account for a maximum of four unit points when calculating losses from this calamity.

30.613 If a primary victim of Epidemic holds Medicine, his losses are reduced by eight unit points. If a secondary victim of Epidemic holds Medicine, his losses are reduced by five unit points.

30.614 A player who holds Roadbuilding loses an additional five unit points to Epidemic, both as a primary and a secondary victim.

30.615 The effects of 30.613 - 30.614 are cumulative."""],
    [9, "Civil Disorder", 7, True, """30.711 All but three of the primary victim's cities are reduced. The primary victim chooses which cities are reduced.

30.712 The number of the primary victim's cities reduced is decreased by one for each of the following civilization cards held: Music, Drama and Poetry, Law and Democracy.

30.713 The number of the primary victim's cities reduced is increased by one if the primary victim holds Military.

30.714 The number of the primary victim's cities reduced is increased by one if the primary victim holds Roadbuilding.

30.715 The effects of 30.712 - 30.714 are cumulative."""],
    [10, "Iconoclasm and Heresy", 8, True, """30.811 Four of the primary victim's cities are reduced. The primary victim chooses which cities are reduced.

30.812 If the primary victim holds Law, the number of cities reduced is decreased by one.

30.813 If the primary victim holds Philosophy, the number of cities reduced is decreased by one.

30.814 If the primary victim holds Theology, the number of cities reduced is decreased by three.

30.815 If the primary victim holds Monotheism, the number of cities reduced is increased by one.

30.816 If the primary victim holds Roadbuilding, the number of cities reduced is increased by one.

30.817 The effects of 30.812 - 30.816 are cumulative.

30.818 The primary victim must also order the reduction of a total of two cities belonging to other players. The player who traded Iconoclasm and Heresy to the primary victim may not be selected as a secondary victim.

30.819 A secondary victim who holds Philosophy may not lose more than one city as a result of the primary victim's order. A player who holds Theology cannot be named as a secondary victim."""],
    [11, "Piracy", 9, True, """30.911 The primary victim loses two coastal cities. The player trading the card selects the cities. These cities are replaced by two pirate cities belonging to one of the nations which did not start the game (for convenience, use the same units as for Barbarian Hordes).

30.912 Two coastal cities belonging to two other players are similarly replaced by pirate cities, even if the primary victim had fewer than two coastal cities and was thus not himself fully affected. The primary victim selects these cities. The secondary victims may each lose only one city. The player who traded Piracy to the primary victim may not be selected as a secondary victim.

30.913 Pirate cities do not require city support, and remain on the board until attacked and destroyed. When a pirate city is attacked, it is replaced by unused tokens solely for the purpose of resolving combat. After combat is resolved, any surviving pirate tokens are eliminated. When a pirate city is destroyed, the attacker may pillage the city."""]
]

mods = [
    #id, calamity, tech, effect
    [0, 2, id_for_name("Pottery"), "The effects of Famine are reduced if the affected player holds Pottery and one or more Grain cards (30.312)."],
    [1, 8, id_for_name("Roadbuilding"), "Roadbuilding aggravates the effects of Epidemic (30.614)"],
    [2, 9, id_for_name("Roadbuilding"), ", Civil Disorder (30.714"],
    [3, 10, id_for_name("Roadbuilding"), " and Iconoclasm and Heresy (30.816)."],
    [4, 5, id_for_name("Mining"), "Mining aggravates the effects of a Slave Revolt (30.423)."],
    [5, 0, id_for_name("Engineering"), "Engineering reduces the effects of Earthquake (30.213)"],
    [6, 6, id_for_name("Engineering"), " and Flood (30.515)"],
    [7, 8, id_for_name("Medicine"), "Medicine reduces the effect of Epidemic (30.613)."],
    [8, 4, id_for_name("Drama & Poetry"), "Drama and Poetry reduces the effects of Civil War (30.4122)"],
    [9, 9, id_for_name("Drama & Poetry"), " and Civil Disorder (30.712)."],
    [10, 4, id_for_name("Music"), "Music reduces the effects of Civil War (30.4122)"],
    [11, 9, id_for_name("Music"), " and Civil Disorder (30.712)."],
    [12, 9, id_for_name("Law"), "Law reduces the effects of Civil Disorder (30.712)"],
    [13, 10, id_for_name("Law"), " and Iconoclasm and Heresy (30.812)."],
    [14, 4, id_for_name("Democracy"), "Democracy reduces the effects of Civil War (30.4122)"],
    [15, 9, id_for_name("Democracy"), " and Civil Disorder (30.712)."],
    [16, 4, id_for_name("Military"), "If a player holding Military has a Civil War, both factions lose 5 unit points after the Civil War is resolved (30.414)."],
    [17, 9, id_for_name("Military"), "\n\nMilitary aggravates the effects of Civil Disorder (30.713)."],
    [18, 4, id_for_name("Philosophy"), "Philosophy alters the effects of Civil War (not necessarily for the better 30.4124)"],
    [19, 10, id_for_name("Philosophy"), " and reduces the effects of Iconoclasm and Heresy (30.813, 30.819)."],
    [20, 3, id_for_name("Mysticism"), "Mysticism reduces the effects of Superstition (30.322)."],
    [21, 3, id_for_name("Deism"), "Deism reduces the effects of Superstition (30.322)."],
    [22, 3, id_for_name("Enlightenment"), "Enlightenment nullifies the effects of Superstition (30.222)"],
    [23, 5, id_for_name("Enlightenment"), ", and reduces the effects of Slave Revolt (30.423)."],
    [24, 10, id_for_name("Monotheism"), "Monotheism aggravates the effects of Iconoclasm and Heresy (30.815)."],
    [25, 10, id_for_name("Theology"), "Theology reduces the effects of Iconoclasm and Heresy (30.814, 30.819)."],
]
