.. Rovercode documentation master file, created by
   sphinx-quickstart on Mon Dec 26 16:06:49 2016.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

rovercode
============
:License: GPLv3
:Source: `<https://github.com/aninternetof/rovercode>`_
:Hosted at: `<https://rovercode.com>`_ (master) and `<https://beta.rovercode.com>`_ (development)

.. image:: https://img.shields.io/badge/chat-on%20Slack-41AB8C.svg?style=flat
      :target: http://chat.rovercode.com/
.. image:: https://img.shields.io/badge/join-mailing%20list-yellow.svg?style=flat
      :target: https://1988.onlinegroups.net/groups/rovercode-developers/
.. image:: https://api.travis-ci.org/aninternetof/rovercode.svg
      :target: https://travis-ci.org/aninternetof/rovercode
.. image:: https://coveralls.io/repos/github/aninternetof/rovercode/badge.svg?branch=development
      :target: https://coveralls.io/github/aninternetof/rovercode?branch=deveopment

Welcome!
#########

rovercode is an easy-to-use system for controlling robots (rovers) that can sense and react to their environment.
The Blockly editor makes it easy to program and run your bot straight from your
browser. Just drag and drop your commands to drive motors, read values from a
variety of supported sensors, and see what your rover sees with the built
in webcam viewer.

.. image:: https://rovercode.com/static/images/screenshot.jpg

Architecture
#############

rovercode is made up of two parts:

- rovercode (the docs you're reading right now) is the service that runs on the rover.
- rovercode-web (a separate repo `documented here <http://rovercode-web.readthedocs.io/>`_) is the web app running at `rovercode.com <https://rovercode.com>`_.

rovercode runs on the rover. The rover can be
any single-board-computer supported by the Adafruit Python GPIO wrapper library,
including the NextThingCo CHIP, Raspberry Pi, and BeagleBone Black.

rovercode-web is hosted on the Internet at `rovercode.com <https://rovercode.com>`_.
It has a Blockly-based editor (which we call Mission Control) for creating a
routine. The routine executes in the browser (sandboxed, of course), and commands
are sent to the rover for rovercode to execute (e.g. "stop motor, turn on light").
Events on the rover ("right eye detects something") are sent to the browser via
a WebSocket connection.

The rover and the device running the browser must be on the same local network.

Get Started
############
Check out the `quickstart guide <quickstart.html>`_. Then see `how to
contribute <contribute.html>`_.

Contact
########
Please join the rovercode developer mailing list! `Go here
<https://1988.onlinegroups.net/groups/rovercode-developers/>`_, then
click "register".

Also, we'd love to chat with you! Join the `the rovercode Slack channel
<http://chat.rovercode.com>`_.

You can also email brady@rovercode.com.

Contents
########

.. toctree::
   :maxdepth: 1
   :caption: Contents:

   quickstart
   detailed-usage
   contribute
   api

Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
