# Make ROT (mkrot)

### Make all possible shits/rotations in the alphabets (26 shifts).

`mkrot.py` can help you bruteforce or decode plaintext from a substitution cipher (Ceaser cipher) encoded string. Can come in handy in a CTF challenge.

It replaces/shifts a letter recursively with all the alphabet 26 letters. You MUST get a plaintext but you'll need to check all the 26 possible rotations and pick a valid dictionary word.

### Note to users :

There is a chance you might get two or maybe more words that seem legit, from the 26 rotational output. In this case, `mkrot.py` can't help you, use your insticts? But at least it will lower your scope of 26 possible guesses to less than 5.

## Rotation Maps :

|  A  |  B  |  C  |  D  |  E  |  F  |  G  |  F  |  I  |  J  |  K  |  L  |  M  |  N  |  O  |  P  |  Q  |  R  |  S  |  T  |  U  |  V  |  W  |  X  |  Y  |  Z  |
|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|
|  1  |  2  |  3  |  4  |  5  |  6  |  7  |  8  |  9  | 10 | 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18 | 19 | 20 | 21 | 22 | 23 | 24 | 25 | 26 |


| mkrot   | 12 | 11 | 10 | 9  | 8  | 7  | 6  | 5  | 4  | 3  | 2  | 1  | 13 |
|-------|----|----|----|----|----|----|----|----|----|----|----|----|----|
| ROT | 14 | 15 | 16 | 17 | 18 | 19 | 20 | 21 | 22 | 23 | 24 | 25 | 26 |


|mkrot | 14 | 15 | 16 | 17 | 18 | 19 | 20 | 21 | 22 | 23 | 24 | 25 | 26 |
|------|----|----|----|----|----|----|----|----|----|----|----|----|----|
|ROT   | 12 | 11 | 10 | 9  | 8  | 7  | 6  | 5  | 4  | 3  | 2  | 1  | 13 |


NB :  ROT 26 is equal to the normal alphabet order


# Example :

```bash

./mkrot.py WujnolyNbyZfua
mkrot 0 = WujnolyNbyZfua

mkrot 1 = XvkopmzOczAgvb

mkrot 2 = YwlpqnaPdaBhwc

mkrot 3 = ZxmqrobQebCixd

mkrot 4 = AynrspcRfcDjye

mkrot 5 = BzostqdSgdEkzf

mkrot 6 = CaptureTheFlag

mkrot 7 = DbquvsfUifGmbh

mkrot 8 = EcrvwtgVjgHnci

mkrot 9 = FdswxuhWkhIodj

mkrot 10 = GetxyviXliJpek

.......
redacted
```
### Output

`mkrot 6` contains a string that is readable. Using the Rotation Map, `ROT20` was used to creat the cipher text `WujnolyNbyZfua`


