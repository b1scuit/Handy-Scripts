#!/usr/bin/python
# Maltego transform for whois data

# Imports
from MaltegoTransform import *
import sys
import os
import requests

# Command line Arguments
website = sys.argv[1]
whois = []
m = MaltegoTransform()

try:
    r = requests.get('http://' + website + '/robots.txt')

    if r.status_code == 200:
        robots = str(r.text).split('\n')

        for i in robots:
            m.addEntity('maltego.Phrase', i)
    else:
        m.addUIMessage('No Robot.txt found.')
except Exception as e:
    m.addUIMessage(str(e))

m.returnOutput()
