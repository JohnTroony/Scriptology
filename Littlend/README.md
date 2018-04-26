# Litend


1) `litend.py beefdade`

	Writes a given Memory Address (e.g. beefdade) in Little Endian  without any 
	additional format characters/separators.

	Output : dedaefbe


2) `litend.py beefdade x`
	
	Writes a given Memory Address (e.g. beefdade) in Little Endian with additonal '\x'

	Output : \xde\xda\xef\xbe


3) `litend.py beefdade sep=.`

	Writes a given Memory Address (e.g. beefdade) in Little Endian  with an additional 
	characters/separators supplied by the user.

	Output : .de.da.ef.be
