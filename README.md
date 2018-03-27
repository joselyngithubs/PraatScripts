# PraatScripts
Praat scripts that I use to analyze speech prosody

## PitchInfoPerSyllable.praat

This code goes through all the sound files in a folder and extracts pitch information (mean, min, and max F0 in semitones) for each syllable. Each sound file should already have a corresponding textgrid file. Each textgrid should share the same name as its sound file, but end with "_markbysyllables.TextGrid". Each textgrid should have a tier that labels the interval for each syllable. The labels can be any text.
For each labeled interval (syllable), the code will extract the pitch contour via autocorrelation, and print the mean, min, and max F0 into a txt file called "pitchresult". Each row of the txt file represents one syllable of a sound file.

Code mostly written by Joselyn Ho (https://github.com/joselyngithubs/), but with lots of inspiration from code written by:
* Mietta Lennes
* Pauline Welby
* Katherine Crosswhite
* http://praatscripting.lingphon.net/

To run:
1. Put sound files and textgrids in the same folder.
2. Run the code. You'll be asked to pick the folder where they're stored.
3. The resulting pitchresults.txt file will be stored in that same folder.
