Prefixes
Prefixes in the LATVIAN language are bound to beginning of other words.




=================================== !
The Latvian morphophonological/twolc rules file !
=================================== !



And following triggers to control variation
 * **%^RVow:0** rakt:roc
 * **%^VowRM:0** vowel removal redzēt:redzu
 * **%^VowL:0** vowel lengthening celt:cēlu
 * **%^K2C:0** rakt:roc
 * **%^JPal:0** sakne:sakņu
 * **%^SP3:0** stum%^JPal%^SP3:stumj0 





## VOWELS
**a2o**


*rak%^RVow%^K2C examples:*

*roc00 examples:*

**a2ā**

*dalī%^VowRM%>am examples:*

*dal000ām examples:*

**e2ē**

*cel%^VowL examples:*

*cēl0 examples:*

**u2ū**

*stum%^VowL examples:*

*stūm0 examples:*




**ē20**

**a20**

**ī20**

*dalī%^VowRM%>u examples:*

*dal000u examples:*

## CONSONANTS
**02j**

**%^VowRM:j**

### J_PALATALIZATION
**%^JPal:j**


**s2š THIS CAN BE REMOVED**

**t2š**

**c2č**

**d2ž**

**z2ž**

**n2ņ**

**l2ļ**

*cel%^JPal examples:*

*ceļ0 examples:*


**k2c**


*rak%^RVow%^K2C examples:*

*roc00 examples:*


*rak%^RVow%^K2C examples:*

*rak00 examples:*

**t2s**

**d2s**

**t2z**

**d2z**



# Symbol affixes





Noun inflection
The LATVIAN language nouns inflect in cases.


 * _LEXICON NMN_1_ _ abinieks:abiniek






 * **LEXICON NMN-FEM_7ROKA_  ** roka:rok


 * **LEXICON NMN-MSC_8PUIKA_ ** puika:puik









Proper noun inflection
The Latvian language proper nouns inflect in the same cases as regular
nouns, but with a colon (':') as separator.















HUMANS




















Verb inflection
The LATVIAN language verbs inflect in persons.







 * **LEXICON V_15_4_STUMT** stumt:stum




 * **LEXICON V_15_5_SALT** salt:sal













WORK



 * **LEXICON V_16_DEJOT** dejot:dejo oāēī













WORK

 * **LEXICON V_17_REDZĒT** redzēt:redzē oāēī













 * **LEXICON V_18_4_CELTIES** celties:cel


























Adjective inflection
The LATVIAN language adjectives compare.



 * **LEXICON A_14ZAĻŠ_** zaļš:zaļ






# Latvian morphological analyser                      !
INTRODUCTION TO MORPHOLOGICAL ANALYSER OF Latvian LANGUAGE.


 # Definitions for Multichar_Symbols

 * **+WORK** Underdeveloped
## Analysis symbols
The morphological analyses of wordforms for the Latvian
language are presented in this system in terms of the following symbols.
(It is highly suggested to follow existing standards when adding new tags).

The parts-of-speech are:

The parts of speech are further split up into:

The Usage extents are marked using following tags:

The nominals are inflected in the following Case and Number

The possession is marked as such:
The comparative forms are:
 * **+Pos** positive grade 
 * **+Comp** comparative grade
 * **+Superl** superlative grade
Numerals are classified under:
Verb moods are:
Verb personal forms are:
Other verb forms are

 * +Symbol = independent symbols in the text stream, like £, €, ©
Special symbols are classified with:
The verbs are syntactically split according to transitivity:
Special multiword units are analysed with:
Non-dictionary words can be recognised with:

Question and Focus particles:

Gender is marked with:

Semantics are classified with


Derivations are classified under the morphophonetic form of the suffix, the
source and target part-of-speech.

Morphophonology
To represent phonologic variations in word forms we use the following
symbols in the lexicon files:

And following triggers to control variation
 * **%^RVow** raise vowel rakt:roc
 * **%^VowRM** vowel removal redzēt:redzu
 * **%^VowL** vowel lengthening celt:cēlu
 * **%^K2C** rakt:roc
 * **%^JPal** sakne:sakņu
 * **%^SP3** stum%^JPal%^SP3:stumj0 

## Flag diacritics
We have manually optimised the structure of our lexicon using following
flag diacritics to restrict morhpological combinatorics - only allow compounds
with verbs if the verb is further derived into a noun again:
 |  @P.NeedNoun.ON@ | (Dis)allow compounds with verbs unless nominalised
 |  @D.NeedNoun.ON@ | (Dis)allow compounds with verbs unless nominalised
 |  @C.NeedNoun@ | (Dis)allow compounds with verbs unless nominalised

For languages that allow compounding, the following flag diacritics are needed
to control position-based compounding restrictions for nominals. Their use is
handled automatically if combined with +CmpN/xxx tags. If not used, they will
do no harm.
 |  @P.CmpFrst.FALSE@ | Require that words tagged as such only appear first
 |  @D.CmpPref.TRUE@ | Block such words from entering ENDLEX
 |  @P.CmpPref.FALSE@ | Block these words from making further compounds
 |  @D.CmpLast.TRUE@ | Block such words from entering R
 |  @D.CmpNone.TRUE@ | Combines with the next tag to prohibit compounding
 |  @U.CmpNone.FALSE@ | Combines with the prev tag to prohibit compounding
 |  @P.CmpOnly.TRUE@ | Sets a flag to indicate that the word has passed R
 |  @D.CmpOnly.FALSE@ | Disallow words coming directly from root.

Use the following flag diacritics to control downcasing of derived proper
nouns (e.g. Finnish Pariisi -> pariisilainen). See e.g. North Sámi for how to use
these flags. There exists a ready-made regex that will do the actual down-casing
given the proper use of these flags.
 |  @U.Cap.Obl@ | Allowing downcasing of derived names: deatnulasj.
 |  @U.Cap.Opt@ | Allowing downcasing of derived names: deatnulasj.

 * **@U.DEB.ON@** This is for debitive in verbs
 * **@U.DEB.OFF@** This is for debitive in verbs
 * **@U.SUPERL.OFF@** This is for superlative in adjectives
 * **@U.SUPERL.ON@** This is for superlative in adjectives


The word forms in the LATVIAN language start from the lexeme roots of basic
word classes, or optionally from prefixes:





We describe here how abbreviations are in Latvian are read out, e.g.
for text-to-speech systems.

For example:

 * s.:syntynyt # ;  
 * os.:omaa% sukua # ;  
 * v.:vuosi # ;  
 * v.:vuonna # ;  
 * esim.:esimerkki # ; 
 * esim.:esimerkiksi # ; 


















































% komma% :,      Root ;
% tjuohkkis% :%. Root ;
% kolon% :%:     Root ;
% sárggis% :%-   Root ; 
% násti% :%*     Root ; 

