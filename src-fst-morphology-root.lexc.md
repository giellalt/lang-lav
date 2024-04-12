
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

* * *

<small>This (part of) documentation was generated from [src/fst/morphology/root.lexc](https://github.com/giellalt/lang-lav/blob/main/src/fst/morphology/root.lexc)</small>
