### Tomfuckery

A useless name for a (hopefully) useful program.
  
#### What's it do?
Use it to get timestamps in an MKV of particular sounds. Feed in the MKV and the sound (haven't yet decided what format the sound will be). Scans through the file for instances of that sound. Creates a TXT with the timestamps marking the "beginning" of that sound.

#### Sounds fuckin dumb
Yea but check this: it is. However, it might be useful to some people (me) for feeding in a video pre-editing and finding timestamps for sounds. I was hoping it could also be used for syncing animation and effects to audio. You can pick out the exact frame of a drum hit in your timeline and sync it to a footstep however ya want. 

### Development TODO:
* [<b>DONE</b>] Make sample MKV file with two audio tracks and a video track
* [<b>DONE</b>] Read and print bits of sample MKV file
  * Just print the whole thing and let it fit to terminal
* Use that info and the MKV spec (https://tools.ietf.org/id/draft-lhomme-cellar-matroska-04.html) (https://datatracker.ietf.org/doc/html/rfc8794) (https://docs.fileformat.com/video/mkv/) (https://www.matroska.org/technical/elements.html) to feel your way around
  * LINE 4 SAYS "matroska" :DDDDDDD
  * first four octets are the master element ID 0x1A45DFA3
  * Subtask: print bytes as hexadecimal (big-endian)
  * This is super hard since ordering is less.. fixed... than I thought it would be. Found MKVToolNix (https://www.matroska.org/downloads/mkvtoolnix.html) and it should help a lot.
* Based on that, decide how it might be most practical to identify "sounds" 
  * Seems like my sound codec is AAC (Advanced Audio Encoding, A_AAC).
* Create a test that uses a direct copy of the bytes to find sounds
* Play around with some math libraries or something for more useful, general sound identification
* Throw together a basic CLI
* Anything after that is gravy, baby.