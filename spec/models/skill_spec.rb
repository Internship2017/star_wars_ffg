require 'rails_helper'

RSpec.describe Skill, type: :model do
  let(:skill) { FactoryGirl.create :skill }

  	it { should validate_presence_of(:name) }
  	it { should validate_presence_of(:characteristic) }
 	  it { should validate_presence_of(:type_of_skill) }
  	it { should validate_presence_of(:difficulty) }
  	it { should validate_presence_of(:description) }
  	it { should validate_numericality_of(:rank).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(5) }
  	
	describe "parse_skills" do
		it "should return all the skills of the jason" do 
			expect(Skill.parse_skills).to eql [{ "Name"=>"Astrogation", "Description"=>{"General"=>"There are many billions of stars populating the galaxy, all of which are in motion relative to one an­ other. Planets and smaller masses are in constant orbit around many of these stars. Vast numbers of nebulae and other astronomical anomalies are also present throughout the galaxy. Traveling between the worlds of the galaxy requires at least a rudimentary knowledge of the galaxy’s organization and compo­ sition. It also requires a navicomputer that is up to date on the current time and relative motion of all of these objects. The Astrogation skill represents a character’s ability to use his knowledge of the galaxy to most effectively program the hyperspace coordi­ nates for any jump. It can also represent a charac­ ter’s knowledge of stellar locations, astronomy, and the formation of the galaxy.", "Examples"=>[{"example"=>"Programming a navicomputer for a hyperspace jump requires a successful Astrogation check."}, {"example"=>"Astrogation governs a character’s basic knowledge of galactic geography. It may be checked any time a character wonders what other systems are nearby."}, {"example"=>"In the event that characters arrive in an unknown system, they may use a navicomputer and their Astrogation skill to identify their location."}, {"example"=>"Astrogation also covers familiarity with the galaxy’s hyperspace routes and the types of craft and commerce most common along those routes."}], "Difficulty"=>"The difficulty of a hyperspace jump is based on the area targeted and the distance traveled. Travel to a nearby system along a well-established route is generally an Easy (1d8) check The difficulty increases based on the accuracy of navigational information and other factors. See page 252 for more information on hyperspace travel. \n Additional [success] beyond those required to calculate a hyperspace jump may be used to better target the location. While a single net [success] reaches the target system without incident, extras might place the character’s vessel directly into orbit around the target planet. Alternatively, characters may use additional [success] to reduce the time spent calculating, when rushed. \n [advantage] generated as part of an Astrogation check are most commonly used to reduce travel time. On extended journeys, they might be used to identify convenient stopovers en route, where the vessel can resupply or conduct additional business to help defray the cost of the trip. [triumph] could be spent either to com plete Astrogation calculations in the minimum amount of time, or to greatly reduce the travel time involved. It could also reveal some highly valuable but previously unknown information, such as a safer or quicker alternative route. \n Conversely, [disavantage] generated on an Astrogation check could decrease the accurracy or increase the travel time of hyperspace jump, or it could simply cause a character to miss relevant details when analyzing a hyperspace routes or galactic maps, [dispair] could be spent in the same way but to greater magnitude, or it could trigger some truly disastrous occurence, such as jumping out of hyperspace into the path of an asteroid."}, "Sources"=>{"Source"=>[{"page"=>"104", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"116", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"114", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Intellect", "Type"=>"General"}, {"Name"=>"Athletics", "Description"=>{"General"=>"Player Characters lead dramatic lives filled with con­ stant physical confrontation. Often, that confrontation comes from an enemy with a blaster, but sometimes it may be a mountain to be scaled, a river to be swum, or a chasm that must be leapt. The Athletics skill governs these actions. It serves as a measure of the character’s overall fitness and physical conditioning. Those who actively engage in a regimen of physical training, such as field infantry or scouts, are the most likely to have a high rank in Athletics.", "Examples"=>[{"example"=>"All aspects of climbing—including rappelling and swinging on a line—fall under the purview of the Athletics skill. The difficulty of these tasks is cal­ culated based on the surface, incline, and other basic conditions of the surface being climbed."}, {"example"=>"Characters who attempt to swim in difficult conditions must check their Athletics. Water conditions-particularly waves, current, and tides dictate the overall challenge of any effort to swim."}, {"example"=>"A character's vertical and horizontal jump are both determined through use of an Athetics check. Gravitational conditions and the distance required factor into the difficulty."}, {"example"=>"Most characters can run, but sprinting or running for an extended time falls under the purview of an Athletics check."}], "Difficulty"=>"The difficulty of an Athletics check is set by the severity of the task. Attempting to perform a routine task under normal conditions should never require a check. A more demanding task—jumping more than a person’s body length or staying afloat for hours should require [difficulty] commensurate with the difficulty of the task. Adverse conditions extreme rain, rough winds, or aggressive pursuit—could impose one or more [setback]. A combination of these elements can make a check significantly more challenging. Extremely adverse conditions hurricane force winds or a surface covered in oil—and attempts at superhuman feats may introduce one or more [1d12][difficulty], in addition to increasing the difficulty. \n Additional [success] on an Athetlics check can either reduce the time required to make the check or increse the distance traveled with that check. \n [advantage][advantage] on an Athletics check may be used to grant the character an additional maneuver during the course of his turn. The maneuver should be one that involves movement or some sort of physical activity. See page 206 for more information, and remember that characters can take a maximum of only two maneuvers during their turn. [advantage] can also generate bonus [bonusdice] on other physical checks performed by allies during that round, or on physical checks the character performs later. \n [triumph] results on successful checks should allow the character to perform the check with a truly impres­ sive outcome. Instead of heaving a boulder aside, he hurls it into the air; instead of grabbing onto the edge of a hovering platform, he uses his momentum to flip atop it, landing on his feet. \n As Athletics is generally used to perform physical actions, [disavantage] and [dispair] results should most often result in physical penalties. Small amounts of [disavantage] may cause the character to suffer strain, while larger amounts of [disavantage] may cause the character to fall prone, or even suffer a wound from sprains and bruises. [dispair] could even inflict a Critical Injury, either chosen by the GM to fit the circumstances or rolled randomly."}, "Sources"=>{"Source"=>[{"page"=>"105", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"117", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"115", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Brawn", "Type"=>"General"}, {"Name"=>"Brawl", "Description"=>{"General"=>"During some physical confrontations, a character seeks to incapacitate a foe without causing serious injury. At other times, a fight erupts with little preparation, and a character may not have any weapon at hand. Some individuals are trained in unarmed combat, or have natural weapons that they prefer to use during altercations. In any of these situations, Brawl is the skill used to determine success or failure in the combat. \n Most characters who grew up in a hostile environ­ ment have some knack for Brawl. All wildlife, par­ ticularly creatures with natural weapons, use Brawl to fight. Anyone who participates in military or law enforcement training learns some basic or advanced martial arts, which fall under the Brawl skill. However, improvised weapons—such as a bottle or a table leg require the Melee skill. Of course, any fighting with fists or feet is covered by Brawl.", "Examples"=>[], "Difficulty"=>"The Brawl skill is most often used to make combat checks in melee combat while unarmed or using a weapon specifically designed to augment unarmed combat (see page 218), though there may be other uses for this skill, at the GM ’s discretion. The difficulty of Brawl checks is Average [1d8][1d8], the difficulty of all melee attacks. If the opponent is incapable of resisting, the check might be easier, at the CM's discretion. See page 210 for more details on melee attack difficulties."}, "Sources"=>{"Source"=>[{"page"=>"120", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"131", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"129", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Brawn", "Type"=>"Combat"}, {"Name"=>"Charm", "Description"=>{"General"=>"For a character with a kind smile and a silver tongue, it might be possible to travel the galaxy simply by de­ pending on the kindness of others. An individual with this knack is capable of giving just the right compli­ ment to his target—often by deciphering the subject’s social and cultural background. Note that the use of the Charm skill requires the acting character to main­ tain a degree of sincerity in his statements. A charac­ ter who employs flagrant flattery with no basis in real­ ity would be better suited to the Deception skill. See Social Skill Interactions, on the next page, for more information. Politicians, salespeople, and con artists are all renowned for their Charm.", "Examples"=>[{"example"=>"Persuading an individual to make a special exception to his usual practices through flattery, flirtation, and grace typically relies on Charm."}, {"example"=>"Appeals to a target’s better nature—even if it does not exist—generally require a character to use Charm. These sorts of requests may require the target to go out of his way to aid the characters, without any hope of remuneration."}, {"example"=>"Seduction attempts for most species typically rely on Charm, but for situations in which the interest is entirely feigned, it is usually more appropriate to use Deception."}], "Difficulty"=>"Charm is often an opposed check against the sub­ ject’s Cool. An exception is a situation in which the PC is trying to Charm a large group, in which case a set difficulty is usually employed. Of course, situational modifiers may also apply based upon the character’s style of dress, species, and other characteristics. For instances in which the desired outcome is directly opposed to the target’s interests, an additional [1d8][difficulty] may be added. \n For situations involving multiple subjects or a target predisposed to react favorably toward the charac­ ter, the character does not make an opposed check. Instead, the difficulty of the check is determined by the number of subjects and their disposition. Larger crowds or groups who are predisposed against the character’s desired outcome require a more difficult check, while charming those already partial to the character may require few, if any, [1d8][difficulty]. \n Extra [success] on a Charm check may be used to extend the target’s support for additional scenes. Each [success] spent in this way gains the character an extra scene in which the target is willing to support him. \n [advantage] may be spent to affect unexpected subjects beyond the original target. These may be bystanders or others who are not directly involved in the scene, but who may be able to aid the character in their own way. With [triumph], the player may choose to have a target NPC become a recurring character who remains predisposed to assist his character. This NPC may not join the character’s crew, but might offer a better than usual price for fencing goods, or may share certain Imperial secrets. \n [disavantage] and [dispair] are, conversely, harmful to a character’s standing with those he is trying to sway. [disavantage] may be spent to reduce the number of people the character is able to influence or to turn those affected negatively against the character. The GM may use [dispair] to turn a single NPC against the character and to make that NPC a minor recurring adversary. "}, "Sources"=>{"Source"=>[{"page"=>"105", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"117", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"116", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Presence", "Type"=>"General"}, {"Name"=>"Coercion", "Description"=>{"General"=>"Some people believe that the only way to maintain respect is to be feared. Others may only grant respect to those whom they fear. When characters attempt to instill obedience in a target through the use of threats or acts of physical intimidation, they use Coercion. A Sith Lord or an Imperial interrogator may use Coercion to frighten the weak or force innocents to do his bidding. However, even decent individuals may use Coercion to intimidate opponents into surrendering rather than fighting and killing their enemies. See Social Skill Interactions sidebar, on the next page, for more information. Imperial Intelligence agents, dark side Force adepts, and organized crime leaders are all known for their ability to coerce their subjects.", "Examples"=>[{"example"=>"Any time a character issues a threat, whether or not accompanied by hostile actions, he is using Coercion against the subject. An implied threat such as gesturing toward a weapon is sufficient to invoke Coercion. "}, {"example"=>"If a target is questioned or persuaded under conditions of physical captivity, the acting character should make a Coercion check."}, {"example"=>"Acts of physical torture always invoke Coercion. Of course, physical violence may also induce strain or wounds in a subject. Such actions are separate from the actual Coercion attempt."}, {"example"=>""}], "Difficulty"=>"Coercion is an opposed check, resisted by the subject’s Discipline. Situational modifiers, such as the degree to which a subject is helpless or a degree of threat that is less significant than expected, may sig­ nificantly affect the dice pool. Attempting to persuade a subject to betray his core beliefs should always add [1d8][difficulty] to the pool. \n In situations in which the character is attempting to intimidate multiple subjects or a target who is already threatened by the character, the character need not make an opposed check. In such circum­ stances, the difficulty of the check is determined by the number of subjects and their disposition. Larger crowds or groups that are more likely to resist authority require a more difficult check, while using Coercion on those already cowed by the character may require few, if any [1d8] [difficulty]. \n Extra [success] on a Coercion check may be used to inflict strain upon the target at a rate of 1 strain per [success][success]. \n By spending [advantage] [advantage] the character may affect unexpected subjects beyond the original target. These may be bystanders or others not directly involved in the scene, but who may be cowed by the character as a result of witnessing the Coercion attempt. With [triumph], the character may completely break the subject’s will. The target’s allegiance shifts, and he becomes a subjugated ally of the acting character, at least temporarily. The new found follower may be exploited to gain additional information or assets, or even to serve as a spy within the ranks of a foe. However, if the follower’s betrayal is discovered by the foe, this forced loyalty may not prove permanent. \n Intimidation and strong-arm tactics are only as successful as the strength and thought behind the attempt. The GM may spend [disavantage] and [dispair] to undermine the outcome of a character’s Coercion attempt. Extra [disavantage] may be spent by the GM to represent a building resentment toward the coercing character. Regardless of the success or failure of the Coercion attempt, the subject may grow to despise the character as a result of having been strong-armed. [dispair] on the other hand, may be spent to represent the character’s slipping up and revealing something about his goals and motivations to the target. For instance, a character attempting to coerce a target to give up security codes for an Imperial detention facility might let slip that he is looking to rescue Force-sensitive prisoners, and he is also Force-sensitive."}, "Sources"=>{"Source"=>[{"page"=>"106", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"118", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"116", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Willpower", "Type"=>"General"}, {"Name"=>"Computers", "Description"=>{"General"=>"The galaxy could scarcely function without the constant assistance of computers. Devices everywhere are linked together and coordinated by computers and droid brains. Those talented in computing can sometimes exploit these resources, or they might know how best to avoid those systems under com­ puter control. Many people are so unconsciously dependent upon computers that those who can cleverly manipulate them may commit crimes without their victims even becoming aware of the offenses. Even using the HoloNet for communications or enter­ tainment requires the use of computers—particularly if there are forces interfering with the system. This skill also governs the repair of a damaged computer system, defensive actions against an intruding slicer, and routine maintenance necessary to keep the soft­ ware on a com puter or droid running effectively.", "Examples"=>[{"example"=>"Attempts to open a locked door, control an elevator, or bypass a security system make use of the Computers skill."}, {"example"=>"Searching through a subject’s records, particu­ larly if those notes are encrypted, makes use of Computers to overcome any security measures and interpret the m aterial’s organizational struc­ ture and any external links."}, {"example"=>"Efforts to alter a droid’s programming or gain access to its memories require the acting character to make a Computers check."}, {"example"=>"Characters must make a Computers check to recover data from a system that has suffered physical damage."}], "Difficulty"=>"The difficulty for a Computers check is calculated based on any defenses present within the system and the inherent sophistication of the system against intrusion. Slicing into a tapcafe’s systems to alter a transaction might be trivially easy, while a military outpost could be hardened and prepared for a slicer’s assault. In general, the more vital the materials protected by the system, the more difficult the system shouldbe to overcome. \n Additional [success] may be spent to reduce the time required for the action undertaken. This is generally representative of the character’s extensive familiarity with systems of the type targeted. \n [advantage] may be spent to uncover additional information about the system. The character might discover additional assets that could be targeted, the owner’s personal journal entries, or the presence of well-concealed defenses. Once the presence of such systems is discovered, a character may attempt to gain access to them with further Computers checks. [triumph] may be spent to conceal any actions the character may have taken while slicing the system. Each [triumph] may be spent to add [1d12][difficulty] to the check if another slicer should attempt to detect or identify the character’s actions with a Computers check. \n The CM may spend [disavantage] generated on a character’s Computers check to represent the character’s doing a poor job of concealing his presence in the system. Security systems are alerted to the electronic intrusion, while other sheers attempting to discover evidence of the character’s actions may add [bonusdice] to their check for each [disavantage] generated by the character’s initial Computers check. \n [dispair] may be spent by a GM to represent the character’s leaving behind of trace information about his own system in the system he was attempting to slice. For each [dispair] generated by the character’s Computers check, the GM may add to any future Computers checks in which an NPC uses the target system to slice the character’s own system. "}, "Sources"=>{"Source"=>[{"page"=>"107", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"119", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"118", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Intellect", "Type"=>"General"}, {"Name"=>"Cool", "Description"=>{"General"=>"", "Examples"=>[{"example"=>""}, {"example"=>""}, {"example"=>""}, {"example"=>""}], "Difficulty"=>""}, "Sources"=>{"Source"=>[{"page"=>"108", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"120", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"118", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Presence", "Type"=>"General"}, {"Name"=>"Coordination", "Description"=>{"General"=>"", "Examples"=>[{"example"=>""}, {"example"=>""}, {"example"=>""}, {"example"=>""}], "Difficulty"=>""}, "Sources"=>{"Source"=>[{"page"=>"109", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"121", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"119", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Agility", "Type"=>"General"}, {"Name"=>"Core Worlds", "Description"=>{"General"=>"", "Examples"=>[{"example"=>""}, {"example"=>""}, {"example"=>""}, {"example"=>""}], "Difficulty"=>""}, "Sources"=>{"Source"=>[{"page"=>"123", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"134", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"132", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Intellect", "Type"=>"Knowledge"}, {"Name"=>"Deception", "Description"=>{"General"=>"", "Examples"=>[{"example"=>""}, {"example"=>""}, {"example"=>""}, {"example"=>""}], "Difficulty"=>""}, "Sources"=>{"Source"=>[{"page"=>"109", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"121", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"120", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Cunning", "Type"=>"General"}, {"Name"=>"Discipline", "Description"=>{"General"=>"", "Examples"=>[{"example"=>""}, {"example"=>""}, {"example"=>""}, {"example"=>""}], "Difficulty"=>""}, "Sources"=>{"Source"=>[{"page"=>"110", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"122", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"120", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Willpower", "Type"=>"General"}, {"Name"=>"Education", "Description"=>{"General"=>"", "Examples"=>[{"example"=>""}, {"example"=>""}, {"example"=>""}, {"example"=>""}], "Difficulty"=>""}, "Sources"=>{"Source"=>[{"page"=>"123", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"135", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"132", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Intellect", "Type"=>"Knowledge"}, {"Name"=>"Gunnery", "Description"=>{"General"=>"", "Examples"=>[{"example"=>""}, {"example"=>""}, {"example"=>""}, {"example"=>""}], "Difficulty"=>""}, "Sources"=>{"Source"=>[{"page"=>"120", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"131", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"130", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Agility", "Type"=>"Combat"}, {"Name"=>"Leadership", "Description"=>{"General"=>"", "Examples"=>[{"example"=>""}, {"example"=>""}, {"example"=>""}, {"example"=>""}], "Difficulty"=>""}, "Sources"=>{"Source"=>[{"page"=>"111", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"123", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"121", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Presence", "Type"=>"General"}, {"Name"=>"Lightsaber", "Description"=>{"General"=>"", "Examples"=>[{"example"=>""}, {"example"=>""}, {"example"=>""}, {"example"=>""}], "Difficulty"=>""}, "Source"=>{"page"=>"130", "source_book"=>"Force and Destiny Core Rulebook"}, "Characteristic"=>"Brawn", "Type"=>"Combat"}, {"Name"=>"Lore", "Description"=>{"General"=>"", "Examples"=>[{"example"=>""}, {"example"=>""}, {"example"=>""}, {"example"=>""}], "Difficulty"=>""}, "Sources"=>{"Source"=>[{"page"=>"123", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"135", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"132", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Intellect", "Type"=>"Knowledge"}, {"Name"=>"Mechanics", "Description"=>{"General"=>"", "Examples"=>[{"example"=>""}, {"example"=>""}, {"example"=>""}, {"example"=>""}], "Difficulty"=>""}, "Sources"=>{"Source"=>[{"page"=>"111", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"124", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"122", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Intellect", "Type"=>"General"}, {"Name"=>"Medicine", "Description"=>{"General"=>"", "Examples"=>[{"example"=>""}, {"example"=>""}, {"example"=>""}, {"example"=>""}], "Difficulty"=>""}, "Sources"=>{"Source"=>[{"page"=>"112", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"125", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"122", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Intellect", "Type"=>"General"}, {"Name"=>"Melee", "Description"=>{"General"=>"", "Examples"=>[{"example"=>""}, {"example"=>""}, {"example"=>""}, {"example"=>""}], "Difficulty"=>""}, "Sources"=>{"Source"=>[{"page"=>"121", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"133", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"131", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Brawn", "Type"=>"Combat"}, {"Name"=>"Negotiation", "Description"=>{"General"=>"", "Examples"=>[{"example"=>""}, {"example"=>""}, {"example"=>""}, {"example"=>""}], "Difficulty"=>""}, "Sources"=>{"Source"=>[{"page"=>"113", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"125", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"123", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Presence", "Type"=>"General"}, {"Name"=>"Outer Rim", "Description"=>{"General"=>"", "Examples"=>[{"example"=>""}, {"example"=>""}, {"example"=>""}, {"example"=>""}], "Difficulty"=>""}, "Sources"=>{"Source"=>[{"page"=>"124", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"135", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"133", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Intellect", "Type"=>"Knowledge"}, {"Name"=>"Perception", "Description"=>{"General"=>"", "Examples"=>[{"example"=>""}, {"example"=>""}, {"example"=>""}, {"example"=>""}], "Difficulty"=>""}, "Sources"=>{"Source"=>[{"page"=>"114", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"126", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"124", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Cunning", "Type"=>"General"}, {"Name"=>"Piloting - Planetary", "Description"=>{"General"=>"", "Examples"=>[{"example"=>""}, {"example"=>""}, {"example"=>""}, {"example"=>""}], "Difficulty"=>""}, "Sources"=>{"Source"=>[{"page"=>"115", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"126", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"124", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Agility", "Type"=>"General"}, {"Name"=>"Piloting - Space", "Description"=>{"General"=>"", "Examples"=>[{"example"=>""}, {"example"=>""}, {"example"=>""}, {"example"=>""}], "Difficulty"=>""}, "Sources"=>{"Source"=>[{"page"=>"116", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"127", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"125", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Agility", "Type"=>"General"}, {"Name"=>"Ranged - Heavy", "Description"=>{"General"=>"", "Examples"=>[{"example"=>""}, {"example"=>""}, {"example"=>""}, {"example"=>""}], "Difficulty"=>""}, "Sources"=>{"Source"=>[{"page"=>"121", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"133", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"131", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Agility", "Type"=>"Combat"}, {"Name"=>"Ranged - Light", "Description"=>{"General"=>"", "Examples"=>[{"example"=>""}, {"example"=>""}, {"example"=>""}, {"example"=>""}], "Difficulty"=>""}, "Sources"=>{"Source"=>[{"page"=>"122", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"133", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"131", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Agility", "Type"=>"Combat"}, {"Name"=>"Resilience", "Description"=>{"General"=>"", "Examples"=>[{"example"=>""}, {"example"=>""}, {"example"=>""}, {"example"=>""}], "Difficulty"=>""}, "Sources"=>{"Source"=>[{"page"=>"116", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"127", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"125", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Brawn", "Type"=>"General"}, {"Name"=>"Skulduggery", "Description"=>{"General"=>"", "Examples"=>[{"example"=>""}, {"example"=>""}, {"example"=>""}, {"example"=>""}], "Difficulty"=>""}, "Sources"=>{"Source"=>[{"page"=>"116", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"128", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"126", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Cunning", "Type"=>"General"}, {"Name"=>"Stealth", "Description"=>{"General"=>"", "Examples"=>[{"example"=>""}, {"example"=>""}, {"example"=>""}, {"example"=>""}], "Difficulty"=>""}, "Sources"=>{"Source"=>[{"page"=>"117", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"128", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"126", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Agility", "Type"=>"General"}, {"Name"=>"Streetwise", "Description"=>{"General"=>"", "Examples"=>[{"example"=>""}, {"example"=>""}, {"example"=>""}, {"example"=>""}], "Difficulty"=>""}, "Sources"=>{"Source"=>[{"page"=>"118", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"130", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"127", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Cunning", "Type"=>"General"}, {"Name"=>"Survival", "Description"=>{"General"=>"", "Examples"=>[{"example"=>""}, {"example"=>""}, {"example"=>""}, {"example"=>""}], "Difficulty"=>""}, "Sources"=>{"Source"=>[{"page"=>"119", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"130", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"128", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Cunning", "Type"=>"General"}, {"Name"=>"Underworld", "Description"=>{"General"=>"", "Examples"=>[{"example"=>""}, {"example"=>""}, {"example"=>""}, {"example"=>""}], "Difficulty"=>""}, "Sources"=>{"Source"=>[{"page"=>"124", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"136", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"133", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Intellect", "Type"=>"Knowledge"}, {"Name"=>"Vigilance", "Description"=>{"General"=>"", "Examples"=>[{"example"=>""}, {"example"=>""}, {"example"=>""}, {"example"=>""}], "Difficulty"=>""}, "Sources"=>{"Source"=>[{"page"=>"119", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"130", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"129", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Willpower", "Type"=>"General"}, {"Name"=>"Xenology", "Description"=>{"General"=>"", "Examples"=>[{"example"=>""}, {"example"=>""}, {"example"=>""}, {"example"=>""}], "Difficulty"=>""}, "Sources"=>{"Source"=>[{"page"=>"125", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"137", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"133", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Characteristic"=>"Intellect", "Type"=>"Knowledge"}, {"Name"=>"Warfare", "Description"=>{"General"=>"", "Examples"=>[{"example"=>""}, {"example"=>""}, {"example"=>""}, {"example"=>""}], "Difficulty"=>""}, "Source"=>{ "page"=>"136", "source_book"=>"Age of Rebellion Core Rulebook" }, "Characteristic"=>"Intellect", "Type"=>"Knowledge" }]
		end
end