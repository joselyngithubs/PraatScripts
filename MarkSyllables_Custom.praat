# Code adapted from Praat Vocal Toolkit plugin by Ramon Corretge, 2012:
# http://www.praatvocaltoolkit.com/

# This code creates a Textgrid for each selected sound file, separating
# the recording into syllables. The difference between this code
# and the original code by Corretge is that you have the option to manually
# correct the Textgrids and do whatever you want to them before saving them.
# Textgrids are saved into the folder of your choice, and the original
# sound files are unaltered.
# github.com/joselyngithubs

# To use this code:
# 1. Load your .wav files into Praat.
# 2. Highlight the files of your choice -- don't select too many at once.
# 3. Run this code. You will be asked to choose where to save the textgrids.
# 4. For each recording, you will view the resulting textgrid (and
# adjust it if needed). Click "Continue" to automatically save the textgrid
# and move onto the next recording.

###################################

textgrid_dir$ = chooseDirectory$: "Choose where to save the textgrids"
textgrid_dir$ = textgrid_dir$+"\"

n_batch = numberOfSelected("Sound")
for i_batch to n_batch
	bsel'i_batch' = selected("Sound", i_batch)
endfor
for i_batch to n_batch
	select bsel'i_batch'
	call action
	new_batch'i_batch' = selected()
endfor
if n_batch >= 1
	select new_batch1
	for i_batch from 2 to n_batch
		plus new_batch'i_batch'
	endfor
endif



procedure action
	s$ = selected$("Sound")
	s = selected("Sound")
	Scale... 0.9999
	dur = Get total duration
	intensity = To Intensity... 40 0.05 0
	intensitytier = Down to IntensityTier
	tableofreal = Down to TableOfReal
	pnts = Get number of rows
	for i from 1 to pnts
		pnt'i' = Get value... 'i' 1
		db'i' = Get value... 'i' 2
	endfor
	tg = Create TextGrid... 0.0 'dur' 's$'_markbysyllables 1
	thld = 40
	mrgn = 3
	for i from 1 to pnts
		tPnt = pnt'i'
		iPrev = i - 1
		iNext = i + 1
		db = db'i'
		if i<>1
			dbPrev = db'iPrev'
		else
			dbPrev = db
		endif
		if i<>pnts
			dbNext = db'iNext'
		else
			dbNext = db
		endif
		if ((db<thld and dbPrev>thld) or (db<thld and dbNext>thld)) or (db<dbPrev+mrgn and db<dbNext-mrgn and db>thld)
			Insert boundary... 1 tPnt
		endif
	endfor
	select intensity
	plus intensitytier
	plus tableofreal
	Remove
	select tg
	call zerocrossing
	plus s
	Edit
	pauseScript: "Click Continue when you've finished editing the TextGrid"
	selectObject: tg
	Save as text file... 'textgrid_dir$''s$'_markbysyllables.TextGrid
	
endproc


procedure zerocrossing
	numberOfTiers = Get number of intervals... 1
	select tg
	for i from 2 to numberOfTiers
		timeoriginal_'i' = Get starting point... 1 i
	endfor
	select s
	for i from 2 to numberOfTiers
		timeoriginal = timeoriginal_'i'
		zerocrossing_'i' = Get nearest zero crossing... Left timeoriginal
	endfor
	select tg
	for i from 2 to numberOfTiers
		timeoriginal = timeoriginal_'i'
		zerocrossing = zerocrossing_'i'
		Remove boundary at time... 1 timeoriginal
		nocheck Insert boundary... 1 zerocrossing
	endfor
endproc
