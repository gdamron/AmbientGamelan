/*Ambient Gamelan Model							   //
//written by Grant Damron							   //
//December 12, 2010								   //
//gdamron@nyu.edu								   //
//											   //
//It emulates a basic section of a Balinese Gamelan composition //
//but slowly evolves into something more abstract...		   //
////////////////////////////////////////////////////////////////*/

<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

sr = 48000
ksmps = 128
nchnls = 2
0dbfs = 1

; Global variables defining the Balinese Pelog Scale.
; They are kept as variables because they COULD change over time
; That would be a fun thing to implement next.
;=======================================================================

; Jegogan tuning
gidingG		=		138.929
gidongG		=		148.797
gidengG		=		162.084
gidungG		=		206.502
gidangG		=		222.46

; Jublag tuning
gidingJ		=		283.303
gidongJ		=		303.089
gidengJ		=		326.876
gidungJ		=		417.606
gidangJ		=		452.323

; Calung tuning
gidung0C		=		212.306
gidang0C		=		226.191
gidingC		=		285.669
gidongC		=		307.661
gidengC		=		331.623
gidungC		=		414.006
gidangC		=		449.881

; Ugal tuning
gidong0U		=		305.96
gideng0U		=		328.147
gidung0U		=		418.07
gidang0U		=		451.13
gidingU		=		571.338
gidongU		=		611.92
gidengU		=		662.878
gidungU		=		827.531
gidangU		=		885.9
giding1U		=		1150.304

; Pemade Tuning
gidong0P		=		303.426
gideng0P		=		326.514
gidung0P		=		417.838
gidang0P		=		451.631
gidingP		=		571.338
gidongP		=		612.26
gidengP		=		660.31
gidungP		=		829.214
gidangP		=		893.795
giding1P		=		1149.029

; Kantil Tuning
gidong0K		=		611.581
gideng0K		=		661.043
gidung0K		=		827.835
gidang0K		=		893.7948
gidingK		=		1152.22
gidongK		=		1232.011
gidengK		=		1333.128
gidungK		=		1663.032
gidangK		=		1792.553
giding1K		=		2295.512

; Global Variables for bussing signals
;=====================================
gasuschn		init		0										; output for instr1 (main instrument)
gaatt1		init		0										; output for instr2 (hard mallets)
gaatt2		init		0										; output for instr2 (medium mallets)
gaatt3		init		0										; output for instr2 (soft mallets)
gagong		init		0										; output for instr2 (big gong)
gapur			init		0										; output for instr2 (medium gong)
gatong		init		0										; output for instr2 (small gong)

; Mixer Channels (instr 97-100)
;======================================
chn_a		"RevInL", 1												; Reverb busses
chn_a		"RevInR", 1
chn_a		"RevL", 1												; Reverb instrument inputs 
chn_a		"RevR", 1
chn_a		"Dry1L", 1												; Dry signal busses
chn_a		"Dry1R", 1
chn_a		"Del1L", 1												; Delay instrument inputs
chn_a		"Del1R", 1
chn_a		"Del2L", 1
chn_a		"Del2R", 1
chn_a		"Del3L", 1
chn_a		"Del3R", 1

; Pitched Instruments
;======================================
		instr 1												; Main instrument -- generates all pitched material besides gongs		
idur		=		p3
iscamp	=		p4
ifreq		=		p5
iamp		=		iscamp
ifdur		=		24											; This would be the maximum duration if the bar was left to ring.
kenv		linseg	0, .0001*idur, 1,.9998*idur, 1, .0001*idur, 0			; envelope to cleanly cut off notes
kfenv		expon		1, ifdur, .0001


af		oscili	kfenv*iamp, ifreq, 1								; Fundamental

ih1		=		ifreq*2										; Harmonics
ih1amp	=		iamp*.003
ih1dur	=		ifdur*.1
kh1		linseg	1, ih1dur, 0, (idur-ih1dur), 0
ah1		oscili	kh1*ih1amp, ih1, 1

ih2		=		ifreq*2.76132
ih2amp	=		iamp*.0004
ih2dur	=		ifdur*.05
kh2		linseg	1, ih2dur, 0, (idur-ih2dur), 0
ah2		oscili	kh2*ih2amp, ih2, 1

ih3		=		ifreq*4
ih3amp	=		iamp*.0004
ih3dur	=		ifdur*.25
kh3		linseg	1, ih3dur, 0, (idur-ih3dur), 0
ah3		oscili	kh3*ih3amp, ih3, 1

ih4		=		ifreq*5.33333
ih4amp	=		iamp*.003
ih4dur	=		ifdur*.008
kh4		linseg	1, ih4dur, 0, (idur-ih4dur), 0
ah4		oscili	kh4*ih4amp, ih4, 1

ih5		=		ifreq*5.6
ih5amp	=		iamp*.008
ih5dur	=		ifdur*.1
kh5		linseg	1, ih5dur, 0, (idur-ih5dur), 0
ah5		oscili	kh5*ih5amp, ih5, 1

ih6		=		ifreq*6.4
ih6amp	=		iamp*.03
ih6dur	=		ifdur*.0075
kh6		linseg	1, ih6dur, 0, (idur-ih6dur), 0
ah6		oscili	kh6*ih6amp, ih6, 1

ih7		=		ifreq*7.4
ih7amp	=		iamp*.075
ih7dur	=		ifdur*.005
kh7		linseg	1, ih7dur, 0, (idur-ih7dur), 0
ah7		oscili	kh7*ih7amp, ih7, 1

ih8		=		ifreq*8.75
ih8amp	=		iamp*.075
ih8dur	=		ifdur*.0025
kh8		linseg	1, ih8dur, 0, (idur-ih8dur), 0
ah8		oscili	kh8*ih8amp, ih8, 1

ih9		=		ifreq*9.64286
ih9amp	=		iamp*.1
ih9dur	=		ifdur*.0205
kh9		linseg	1, ih9dur, 0, (idur-ih9dur), 0
ah9		oscili	kh9*ih9amp, ih9, 1

ih10		=		ifreq*11
ih10amp	=		iamp*.05
ih10dur	=		ifdur*.00013
kh10		linseg	1, ih10dur, 0, (idur-ih10dur), 0
ah10		oscili	kh10*ih10amp, ih10, 1

ih11		=		ifreq*12.5
ih11amp	=		iamp*.05
ih11dur	=		ifdur*.0005
kh11		linseg	1, ih11dur, 0, (idur-ih11dur), 0
ah11		oscili	kh11*ih11amp, ih11, 1

ih12		=		ifreq*16.5696
ih12amp	=		iamp*.075
ih12dur	=		ifdur*.0005
kh12		linseg	1, ih12dur, 0, (idur-ih12dur), 0
ah12		oscili	kh12*ih12amp, ih12, 1

ain1		=		af+ah1+ah2+ah3+ah4+ah5+ah6+ah7+ah8+ah9+ah10+ah11+ah12		; Full note -- harmonics' amplitueds are scaled previously
ain2		butterhp	ain1, 200										; trimming off the ocassional unwanted thud

a1		=		ain2	

gasuschn	=		(.2*a1)+gasuschn									; output
		endin

		instr	2												; Hard mallet attack -- just enveloped, filtered white noise
idur		=		p3
iamp		=		p4
ilpf1		=		-.95
ilpf2		=		1
iattamp1	=		iamp*.8
iattamp2	=		iamp*.5
							

katenv	linseg	1, .0005, 0, idur-.1, 0
aat1		noise		(iattamp1)*katenv, ilpf1
aat2		noise		(iattamp2)*katenv, ilpf2
aat		=		aat1+aat2
aatf		butterhp	aat, 1000
gaatt1	=		aat+aatf+gaatt1

		endin

		instr	3												; Medium mallet attack -- also just enveloped, filtered white noise
idur		=		p3
iamp		=		p4
ilpf1		=		.6
ilpf2		=		.8
iattamp1	=		iamp*.8
iattamp2	=		iamp*.5
								
;ainL		=		gasuschn
;ainR		=		gasuschn

katenv	linseg	1, .0006, 0, idur-.1, 0
aat1		noise		(iattamp1)*katenv, ilpf1
aat2		noise		(iattamp2)*katenv, ilpf2
aat		=		aat1+aat2
aatf		butterhp	aat, 800
gaatt2	=		gaatt2+aat+aatf
		endin

		instr	4												; Soft mallet attack -- you guessed it: enveloped, filtered white noise
idur		=		p3
iamp		=		p4
ilpf1		=		0
ilpf2		=		1
iattamp1	=		iamp*.8
iattamp2	=		iamp*.5

katenv	linseg	1, .0008, 0, idur-.1, 0
aat1		noise		(iattamp1)*katenv, ilpf1
aat2		noise		(iattamp2)*katenv, ilpf2
aat		=		aat1+aat2
aatf		butterlp	aat, 600
gaatt3	=		gaatt3+aat+aatf	
		endin

		instr	5												;Big Gong
idur		=		p3
iamp		=		p4
ifdur		=		16
ifreq		=		57.33
kfenv		expon		1, ifdur, .0001

af		oscili	kfenv*iamp, ifreq, 1								; Fundamental

ih1		=		ifreq*2										; Harmonics -- just a couple for now
ih1amp	=		iamp*.05
ih1dur	=		ifdur*.5
kh1		linseg	1, ih1dur, 0, (idur-ih1dur), 0
ah1		oscili	kh1*ih1amp, ih1, 1

ih2		=		ifreq*3.002
ih2amp	=		iamp*.01
ih2dur	=		ifdur*.3
kh2		linseg	1, ih2dur, 0, (idur-ih2dur), 0
ah2		oscili	kh2*ih2amp, ih2, 1

agong		=		af+ah1+ah2
gagong	=		gagong+.9*agong									;output
		endin

		instr	6												; Kenpur -- the medium gong
idur		=		p3
iamp		=		p4
ifdur		=		10
ifreq		=		76.36
kfenv		expon		1, ifdur, .0001

af		oscili	kfenv*iamp, ifreq, 1								; Fundamental

ih1		=		ifreq*2										; Harmonics
ih1amp	=		iamp*.05
ih1dur	=		ifdur*.5
kh1		linseg	1, ih1dur, 0, (idur-ih1dur), 0
ah1		oscili	kh1*ih1amp, ih1, 1
ih2		=		ifreq*3.05
ih2amp	=		iamp*.01
ih2dur	=		ifdur*.3
kh2		linseg	1, ih2dur, 0, (idur-ih2dur), 0
ah2		oscili	kh2*ih2amp, ih2, 1

apur		=		af+ah1+ah2
gapur		=		gapur+.9*apur									; output
		endin

		instr	7												; Klentong -- the small gong
idur		=		p3
iamp		=		p4
ifdur		=		5
ifreq		=		410.8
kfenv		expon		1, ifdur, .0001

af		oscili	kfenv*iamp, ifreq, 1								; Fundamental

ih1		=		ifreq*2.3										; Harmonics
ih1amp	=		iamp*.05
ih1dur	=		ifdur*.5
kh1		linseg	1, ih1dur, 0, (idur-ih1dur), 0
ah1		oscili	kh1*ih1amp, ih1, 1
ih2		=		ifreq*3.702
ih2amp	=		iamp*.01
ih2dur	=		ifdur*.3
kh2		linseg	1, ih2dur, 0, (idur-ih2dur), 0
ah2		oscili	kh2*ih2amp, ih2, 1

atong		=		af+ah1+ah2
gatong	=		gatong+atong									; output
		endin

		instr 8												; Byar -- doesn't play much but is important
istart	=		p2
idur		=		p3
								
		;Jublag
		event_i 	"i", 1, istart, idur, 1, gidengJ
		event_i 	"i", 3, istart, idur, 1
		; Ugal
		event_i 	"i", 1, istart, idur, 1, gidengU
		event_i 	"i", 3, istart, idur, 1
		; Jegogan
		event_i 	"i", 1, istart, idur, 1, gidengG
		event_i 	"i", 4, istart, idur, 1
		; Pemade polos
		event_i 	"i", 1, istart, idur, .8, gidengP
		event_i 	"i", 2, istart, idur, 1
		; Pemade sangsih
		event_i 	"i", 1, istart, idur, .8, giding1P
		event_i 	"i", 2, istart, idur, 1
		; Kantil polos
		event_i 	"i", 1, istart, idur, .8, gidengK
		event_i 	"i", 2, istart, idur, 1
		; Kantil sangsih
		event_i 	"i", 1, istart, idur, .8, giding1K
		event_i 	"i", 2, istart, idur, 1
		; Gong
		event_i	"i", 5, istart, idur, 1
		endin


;Score generating instruments
;==========================================================
		instr	9												; Parsing instrument -- produces the score
isecdur	=		p3											; User determines length of section
ibyardur	=		6											; duration of opening "byar chord"

iphrase	rnd31		1, 0											; determines length of phrase:
iphrase	=		(int(iphrase)+2)*16								; 16, 32, or 48 notes long
imelody[]	init		iphrase
imelCounter	=		0

		loop:
imelNote	rnd31		5, 0											; random number determines base scale degree
imelNote	=		int(imelNote) + 4
imelody[imelCounter]	= imelNote

		loop_lt imelCounter, 1, iphrase, loop

		event_i	"i", 8, 0, ibyardur								; speak of the devil
		start:												; initialize variables for loop
istart	init		0											; sets start time for notes
icounter	init		0											; counter, obviously
igongcount	init		0											; counter for keeping track of gong cycle
inote		init		0											; scale degree
ifreq		init		0											; Jublag's frequency in Hz
ifreqG	init		0											; Jegogan's frequency
ifreqU	init		0											; Ugal
ifreqP	init		0											; Pemade (polos)
ifreqK	init		0											; Kantil (polos)
ifreqP2	init		0											; Pemade (sangsih)
ifreqK2	init		0											; Kantil (sangsih)
iprevG	init		0											; Previous Jegogan note (so it never has silence)
iprevP2	init		0											; Previous pemade (sangsih)
iprevK2	init		0											; Previous kantil (sangsih)
ipdyn		init		0											; Pokok dynamics
igdyn		init		0											; Gangsa dynamic
idyn		rnd31		4, 0											; random numbero generate dynamics:
idyn		=		abs(int(idyn))									; all quite, all medium, all loud, half quiet/loud, half loud/quiet	

idur		rnd31		3, 0											; set slow, medium, fast, or FAST	
idur		=		(int(idur)+3.25)*.25					
			
timout	0, iphrase*idur, continue
		reinit	start
continue:

		start_loop1:
istart	=		icounter*idur+ibyardur								; adds offeset for byar chord and sets note start times
igongcount	=		int(icounter%16)									; dividing phrase into gong cycle
ijegon	=		1											; jegogan star on downbeat
inote 	=		imelody[icounter%iphrase]

		if		(inote == 0) then								; scale degrees converted (0 means silence)
ifreq		=		0											; to frequencies for each instrument
ifreqG	=		iprevG										; sangsih parts are given their off-beat notes as well	
ifreqU	=		0											; in a basic niriti pattern
ifreqP	=		0
ifreqK	=		0
ifreqP2	=		iprevP2
ifreqK2	=		iprevK2
		elseif	(inote == 1) then
ifreq		=		gidingJ
ifreqG	=		gidingG
ifreqU	=		gidingU
ifreqP	=		gidingP
ifreqK	=		gidingK
ifreqP2	=		gidongP
ifreqK2	=		gidongK
		elseif	(inote == 2) then
ifreq		=		gidongJ
ifreqG	=		gidongG
ifreqU	=		gidongU
ifreqP	=		gidongP
ifreqK	=		gidongK
ifreqP2	=		gidengP
ifreqK2	=		gidengK
		elseif	(inote == 3) then
ifreq		=		gidengJ
ifreqG	=		gidengG
ifreqU	=		gidengU
ifreqP	=		gidengP
ifreqK	=		gidengK
ifreqP2	=		gidungP
ifreqK2	=		gidungK
		elseif	(inote == 4) then
ifreq		=		gidungJ
ifreqG	=		gidungG
ifreqU	=		gidungU
ifreqP	=		gidungP
ifreqK	=		gidungK
ifreqP2	=		gidangP
ifreqK2	=		gidangK
		elseif	(inote == 5) then
ifreq		=		gidangJ
ifreqG	=		gidangG
ifreqU	=		gidangU
ifreqP	=		gidangP
ifreqK	=		gidangK
ifreqP2	=		giding1P
ifreqK2	=		giding1K
		elseif	(inote == 6) then
ifreq		=		gidingJ
ifreqG	=		gidingG
ifreqU	=		giding1U
ifreqP	=		giding1P
ifreqK	=		giding1K
ifreqP2	=		gidangP
ifreqK2	=		gidangK
		elseif	(inote == 7) then
ifreq		=		gidongJ
ifreqG	=		gidongG
ifreqU	=		gidong0U
ifreqP	=		gidong0P
ifreqK	=		gidong0K
ifreqP2	=		gideng0P
ifreqK2	=		gideng0K
		elseif	(inote == 8) then
ifreq		=		gidengJ
ifreqG	=		gidengG
ifreqU	=		gideng0U
ifreqP	=		gideng0P
ifreqK	=		gideng0K
ifreqP2	=		gidung0P
ifreqK2	=		gidung0K
		elseif	(inote == 9) then
ifreq		=		gidungJ
ifreqG	=		gidungG
ifreqU	=		gidung0U
ifreqP	=		gidung0P
ifreqK	=		gidung0K
ifreqP2	=		gidang0P
ifreqK2	=		gidang0K
		elseif	(inote == 10) then
ifreq		=		gidangJ
ifreqG	=		gidangG
ifreqU	=		gidang0U
ifreqP	=		gidang0P
ifreqK	=		gidang0K
ifreqP2	=		gidingP
ifreqK2	=		gidingK
		endif		

iprevG	=		ifreqG										; rememberthe previous notess necessary
iprevP2	=		ifreqP2
iprevK2	=		ifreqK2			

		if		(idyn == 0) then									; if statment to set dynamics for this phrase
igdyn		=		.333
ipdyn		=		.333
		elseif	(idyn == 1) then
igdyn		=		.666
ipdyn		=		.666
		elseif	(idyn == 2) then
igdyn		=		1
ipdyn		=		1
		elseif	(idyn == 3) then
igdyn		=		.333
ipdyn		=		1
		elseif	(idyn == 4) then
igdyn		=		1
ipdyn		=		.333
		endif

; The actual score generation besides the opening byar chord begins here
; ======================================================================

		if		(igongcount==0) then								; Defining the gong cycle
		event_i	"i", 5, istart, idur*4, 1
		elseif	(igongcount==4 || igongcount==12) then
		event_i	"i", 6, istart, idur*4, 1
		elseif	(igongcount==8) then
		event_i	"i", 7, istart, idur*4, 1
		endif
		
		event_i 	"i", 1, istart, idur, 1*ipdyn, ifreq					; Jublag
		event_i 	"i", 3, istart, idur, 1*ipdyn

		event_i 	"i", 1, istart, idur, 1*igdyn, ifreqU					; Ugal
		event_i 	"i", 3, istart, idur, 1*igdyn
		
			if		(ijegon==1) then								; Jegogan (also determine if others have silence
		event_i	"i", 1, istart, idur*2, 1*ipdyn, ifreqG				; if so, play previous note	
		event_i 	"i", 4, istart, idur*2, 1*ipdyn
		ijegon	=		ijegon*-1
			else
		ijegon	=		ijegon*-1
			endif
		
		event_i 	"i", 1, istart, idur/2, .8*igdyn, ifreqP				; Pemade kotekan
		event_i 	"i", 2, istart, idur/2, 1*igdyn						; polos plays on the beat

		event_i 	"i", 1, (istart+idur/2), idur/2, .8*igdyn, ifreqP2			; sangsih plays off the beat
		event_i 	"i", 2, (istart+idur/2), idur/2, 1*igdyn				; if polos has silence, plays previous note

		event_i 	"i", 1, istart, idur/2, .6*igdyn, ifreqK				; Kantil kotekan
		event_i 	"i", 2, istart, idur/2, 1*igdyn						; polos plays on the beat

		event_i 	"i", 1, (istart+idur/2), idur/2, .6*igdyn, ifreqK2			; sangsih plays off the beat
		event_i 	"i", 2, (istart+idur/2), idur/2, 1*igdyn				; if polos has silence, plays previous note

		loop_lt	icounter, 1, iphrase, start_loop1					

		event_i 	"i", 10, 0, isecdur								; keep dummy instument running
		endin													; (there is no output other than events)

		instr	10												; dummy instrument
		; nothing here
		endin

		
		instr 97												; 3-part Echo/Delay  -- pretty self-explanatory	
afeed1L	init		0											; part 1		
afeed1R	init		0
adel1L	init		0
adel1R	init		0						
ain1L		chnget	"Dry1L"										; inputs
ain1R		chnget	"Dry1R"
afeed1L	=		adel1L-.01*ain1L
afeed1R	=		adel1R-.01*ain1R
adel1L	delay		ain1L+.9*afeed1L, 4
adel1R	delay		ain1R+.9*afeed1R, .6
		chnset	adel1L, "Del1L"									; outputs
		chnset	adel1R, "Del1R"
	
afeed2L	init		0											; part 2
afeed2R	init		0
adel2L	init		0
adel2R	init		0							
ain2L		chnget	"Dry1L"										; inputs
ain2R		chnget	"Dry1R"
afeed2L	=		adel2L-.02*ain2L
afeed2R	=		adel2R-.02*ain2R
adel2L	delay		ain2L+.9*afeed2L, .5
adel2R	delay		ain2R+.9*afeed2R, 3.15
		chnset	adel2L, "Del2L"									; outputs			
		chnset	adel2R, "Del2R"
	
afeed3L	init		0											; part 3
afeed3R	init		0
adel3L	init		0
adel3R	init		0
ain3L		chnget	"Dry1L"										; inputs
ain3R		chnget	"Dry1R"
afeed3L	=		adel3L-.5*ain3L
afeed3R	=		adel3R-.5*ain3R							
adel3L	delay		ain3L+.7*afeed3L, 2.1
adel3R	delay		ain3R+.7*afeed3R, 2
		chnset	adel3L, "Del3L"									; outputs
		chnset	adel3R, "Del3R"
		endin

		instr	98												; Left Channel Reverb
idur		=		p3											; Based on the large-room reverb in 
iamp		=		p4											; the Csound book (ch 24)
aout41	init		0
aout81	init		0
aout91	init		0
adel01	init		0
adel11	init		0
adel51	init		0
adel52	init		0
adel91	init		0
adel92	init		0
adel93	init		0
kdclick	linseg	0, .002, iamp, idur-.004, iamp, .002, 0
;INITIALIZE
asig0		chnget	"RevInL"

aflt01	butterlp	asig0, 1000										;PRE-FILTER
aflt02	butterbp	.5*aout41, 400,800								;FEEDBACK FILTER
asum01	=		aflt01+.6*aflt02									;INITIAL MIX
;ALLPASS 1
asub01	=		adel01-.1*asum01
adel01	delay		asum01+.3*asub01, .008
;ALLPASS 2
asub11	=		adel11-.3*asub01
adel11	delay		asub01+.3*asub11, .012
adel21	delay		asub11, .004
adel41	delay		adel21, .017
;SINGLE NESTED ALLPASS
asum51	=		adel52-.25*adel51								;first inner feedforward
aout51	=		asum51-.5*adel41									;outer feedforward
adel51	delay		adel41+.5*aout51, .025								;outer feedback
adel52	delay		adel51+.25*asum51, .062
adel61	delay		aout51, .041									;first inner feedback
adel81	delay		adel61, .023									;second inner feedback
;DOUBLE NESTED ALLPASS
asum91	=		adel92-.25*adel91								;inner feedforward
asum92	=		adel93-.25*asum91
aout91	=		asum92-.5*adel81									;outer feedforward
adel91	delay		aout81+.5*aout91, .12								;outer feedback
adel92	delay		adel91+.25*asum91, .076							;inner feedback
adel93	delay		asum91+.25*asum92, .03
;OUTPUT
aout		=		.8*aout91+.8*adel61+1.5*adel21
		chnset	aout*kdclick, "RevL"								; out goes to L and R
		chnset	-aout*kdclick, "RevR"
		endin

		instr	99												; Right Channel Reverb -- same as the other
idur		=		p3
iamp		=		p4
aout41	init		0
aout81	init		0
aout91	init		0
adel01	init		0
adel11	init		0
adel51	init		0
adel52	init		0
adel91	init		0
adel92	init		0
adel93	init		0
kdclick	linseg	0, .002, iamp, idur-.004, iamp, .002, 0
;INITIALIZE
asig0		chnget	"RevInR"

aflt01	butterlp	asig0, 1000										;PRE-FILTER
aflt02	butterbp	.5*aout41, 400,800								;FEEDBACK FILTER
asum01	=		aflt01+.6*aflt02									;INITIAL MIX
;ALLPASS 1
asub01	=		adel01-.1*asum01
adel01	delay		asum01+.3*asub01, .008
;ALLPASS 2
asub11	=		adel11-.3*asub01
adel11	delay		asub01+.3*asub11, .012
adel21	delay		asub11, .004
adel41	delay		adel21, .017
;SINGLE NESTED ALLPASS
asum51	=		adel52-.25*adel51								;first inner feedforward
aout51	=		asum51-.5*adel41									;outer feedforward
adel51	delay		adel41+.5*aout51, .025								;outer feedback
adel52	delay		adel51+.25*asum51, .062
adel61	delay		aout51, .041									;first inner feedback
adel81	delay		adel61, .023									;second inner feedback
;DOUBLE NESTED ALLPASS
asum91	=		adel92-.25*adel91								;inner feedforward
asum92	=		adel93-.25*asum91
aout91	=		asum92-.5*adel81									;outer feedforward
adel91	delay		aout81+.5*aout91, .12								;outer feedback
adel92	delay		adel91+.25*asum91, .076							;inner feedback
adel93	delay		asum91+.25*asum92, .03
;OUTPUT
aout		=		.8*aout91+.8*adel61+1.5*adel21
		chnset	aout*kdclick, "RevL"								; out goes to L and R
		chnset	-aout*kdclick, "RevR"
		endin

		instr	100												; mixer
idur		=		p3
irnflt1	rnd31		1, 0											; random numbers to set hp and lp filter limits 
irnflt2	rnd31		1, 0
irnflt1	=		abs(irnflt1)
irnflt2	=		abs(irnflt2)
ihpf		=		irnflt1*10000									; min freq for hpf
ilpf		=		10000-(irnflt2*10000)								; max freq for lpf

kenv		linseg	1, idur*.92, 1, idur*.08, 0							; envelope to fade out whole thing
kfltenv1	linseg	0, .5*idur, 0, .2*idur, ihpf, .2*idur, ihpf, .1*idur, 0		; hpf sweep env
kfltenv2	linseg	23000, .4*idur, 22000, .2*idur, ilpf, .2*idur, ilpf, .2*idur, 24000	; lpf sweep env
kdelenv	linseg	0, .2*idur, 0, .3*idur, 1, .25*idur, 1, .15*idur, 0, .1*idur, 0 		; slowly mix the delayed signal in and back ou
kdryenv	linseg	1, .3*idur, 1, .2*idur, 0, .25*idur, 1, .15*idur, 1, .1*idur, 1 		; do the opposite for the dry signal
kvrbenv	linseg	.4, .75*idur, 1, .25*idur, 1						; signal slowly gets wetter with reverb

avrbinL	chnget	"RevL"										; from reverb outputs
avrbinR	chnget	"RevR"
adel1L	chnget	"Del1L"										; from delay/echo outputs	
adel1R	chnget	"Del1R"
adel2L	chnget	"Del2L"
adel2R	chnget	"Del2R"
adel3L	chnget	"Del3L"
adel3R	chnget	"Del3R"

asus		=		gasuschn										; from instr 1 & 8 -- main instrument and byar
aatt1		=		gaatt1										; from instr 2 -- hard mallet
aatt2		=		gaatt2										; from instr 3 -- medium mallet
aatt3		=		gaatt3										; from instr 4 -- soft mallet
agong		=		gagong										; from instr 5 -- gong
apur		=		gapur											; from instr 6 -- pur
atong		=		gatong										; from instr 7 -- tong	
allgongs	=		.5*agong+.4*apur+.5*atong							; the gongs combined

avrbL		=		kvrbenv*avrbinL									; scaled/enveloped reverb
avrbR		=		kvrbenv*avrbinL

adryL		=		.7*asus+allgongs+.023*aatt1+.0575*aatt2+.12*aatt3			; instruments 1-8 combined and scaled
adryR		=		.7*asus+allgongs+.00575*aatt1+.14*aatt2+.12*aatt3

adelL		=		kdelenv*(.25*adel1L+.25*adel2L+.25*adel3L)				; delay/echo enveloped and scaled
adelR		=		kdelenv*(.25*adel1R+.25*adel2R+.25*adel3R)

adryoutL	=		kdryenv*adryL									; instruments 1-8 enveloped
adryoutR	=		kdryenv*adryR

ahpfL		butterhp	.25*adryoutL, kfltenv1*1							; the actual high-pass filter
ahpfR		butterhp	.25*adryoutL, kfltenv1*1
alpfL		butterlp	.25*adryoutL, kfltenv2*1							; and the low-pass filter
alpfR		butterlp	.25*adryoutL, kfltenv2*1

aoutL		=		ahpfL+alpfL										; the final dry" output
aoutR		=		ahpfR+alpfR


		chnset	aoutL+adelL, "RevInL"								; send to reverb
		chnset	aoutR+adelR, "RevInR"
		chnset	aoutL, "Dry1L"									; send to delay
		chnset	aoutR, "Dry1R"
		outs		kenv*(.5*aoutL+avrbL+.5*adelL), kenv*(.5*aoutR+avrbR+.5*adelR)	; THE OUTPUT!

		gasuschn	=	0										; reset global variables
		gaatt1	=	0
		gaatt2	=	0
		gaatt3	=	0
		gagong	=	0
		gapur		=	0
		gatong	=	0
		endin

</CsInstruments>
<CsScore>

f1 0 262145 10 1													; Just a sine wave

i97 0 190														; Set the durations to whatever length you desire.
i98 0 190 1														; Best to set the durations of instruments 97-100 to be
i99 0 190 1														; longer than instrument 9	(because its duration 
i100 0 190														; does not directly correlate with time!).  Setting i9's duration 	
i9 0 170	

															; to about 75%-90% of the others works well.	
e

</CsScore>
</CsoundSynthesizer>



<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>800</x>
 <y>411</y>
 <width>400</width>
 <height>345</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>125</r>
  <g>162</g>
  <b>160</b>
 </bgcolor>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>amp</objectName>
  <x>266</x>
  <y>7</y>
  <width>20</width>
  <height>98</height>
  <uuid>{a13bbf3a-0cd7-446d-a683-83384d8322b0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.12244900</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>freq</objectName>
  <x>10</x>
  <y>29</y>
  <width>239</width>
  <height>22</height>
  <uuid>{1db2c159-20f8-4d28-a3aa-eca2e78e9ab4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>100.00000000</minimum>
  <maximum>1000.00000000</maximum>
  <value>258.15899600</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBGraph" version="2">
  <objectName/>
  <x>8</x>
  <y>112</y>
  <width>265</width>
  <height>116</height>
  <uuid>{c07b416f-a9f7-407c-b167-f799de3eed32}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <value>0</value>
  <objectName2/>
  <zoomx>1.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <modex>auto</modex>
  <modey>auto</modey>
  <all>true</all>
 </bsbObject>
 <bsbObject type="BSBConsole" version="2">
  <objectName/>
  <x>279</x>
  <y>112</y>
  <width>266</width>
  <height>266</height>
  <uuid>{b8091ebd-bf3d-40a8-ac62-fa45dea665c0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <font>Courier</font>
  <fontsize>8</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>293</x>
  <y>44</y>
  <width>41</width>
  <height>24</height>
  <uuid>{97654c2f-31a2-4701-9066-54371dc5232b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Amp:</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>amp</objectName>
  <x>333</x>
  <y>44</y>
  <width>70</width>
  <height>24</height>
  <uuid>{80807c71-c637-4a35-9d7c-afc3d96a664a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>0.1837</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>66</x>
  <y>57</y>
  <width>41</width>
  <height>24</height>
  <uuid>{2580c40c-7ee6-4bc6-ab02-7afd7f4b8609}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Freq:</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>freq</objectName>
  <x>106</x>
  <y>57</y>
  <width>69</width>
  <height>24</height>
  <uuid>{06282064-a80b-4803-a329-dfc12b8effcc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>261.9247</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>425</x>
  <y>6</y>
  <width>120</width>
  <height>100</height>
  <uuid>{af4de1db-1b70-4b4e-8b39-49fc969baf95}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>freqsweep</objectName>
  <x>449</x>
  <y>68</y>
  <width>78</width>
  <height>24</height>
  <uuid>{15ce7222-e7fe-4167-859d-afb2be6a8000}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>999.6769</label>
  <alignment>center</alignment>
  <font>DejaVu Sans</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>55</r>
   <g>122</g>
   <b>116</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>Button 1</objectName>
  <x>435</x>
  <y>24</y>
  <width>100</width>
  <height>30</height>
  <uuid>{e97cd48d-d7b3-4fd2-9486-aece1f5547cf}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Sweep</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBScope" version="2">
  <objectName/>
  <x>8</x>
  <y>233</y>
  <width>266</width>
  <height>147</height>
  <uuid>{36f49d61-160a-47ae-97e2-a4989a5193bf}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <value>-255.00000000</value>
  <type>scope</type>
  <zoomx>2.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <mode>0.00000000</mode>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
<EventPanel name="" tempo="60.00000000" loop="8.00000000" x="320" y="285" width="596" height="322" visible="true" loopStart="0" loopEnd="0">    </EventPanel>
