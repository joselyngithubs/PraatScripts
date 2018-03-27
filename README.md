# PraatScripts
Praat scripts that I use to analyze speech prosody

Praat speech analysis software:

Boersma, Paul & Weenink, David (2018). Praat: doing phonetics by computer [Computer program]. Version 6.0.37, retrieved 27 March 2018 from http://www.praat.org/

## MarkSyllables_Custom.praat

Code adapted from Praat Vocal Toolkit plugin by Ramon Corretge, 2012:
http://www.praatvocaltoolkit.com/

This code creates a Textgrid for each selected sound file, separating the recording into syllables. The difference between this code and the original code by Corretge is that you have the option to manually correct the Textgrids and do whatever you want to them before saving them. Textgrids are saved into the folder of your choice, and the original sound files are unaltered. Each textgrid will be save with the same name as its sound file, but end with "_markbysyllables.TextGrid".
https://github.com/joselyngithubs

To use this code:
1. Load your .wav files into Praat.
2. Highlight the files of your choice -- don't select too many at once.
3. Run this code. You will be asked to choose where to save the textgrids.
4. For each recording, you will view the resulting textgrid (and adjust it if needed). Click "Continue" to automatically save the textgrid and move onto the next recording.

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
