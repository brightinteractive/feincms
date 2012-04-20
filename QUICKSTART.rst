========================================
Setup FeinCMS in less than five minutes
========================================

Quickstart
===============

Clone FeinCMS from github (https://github.com/feincms/feincms) into your desired development directory:

::

	$ git clone git://github.com/feincms/feincms.git

Now you find a directory named 'feincms' in your development directory. This is your project directory. Feel free to change its name:

::

	$ mv feincms/ myFeinCMSSite

Now you can choose between the quickstart variant which takes about a minute (depending on your network connection) or the manual setup, which is as easy as the quickstart variant, but let's you understand what your doing.


Quickstart Variant
-------------------

Change into your project folder and run the setup script

::

	$ cd myFeinCMSSite
	$ ./quickstart-virtualenv.sh # (or use ./quickstart.sh instead if you want to install the development versions of the libraries from git, like the manual variant does)

Wait while django and mptt are being fetched and then follow the on-screen instructions to start the runserver and enjoy the installation.

The username and password for the examples admin-interface are 'admin' and 'password'.


Manual Setup Variant
---------------------

Create a directory named 'lib' in your development folder and clone the django-mptt module (https://github.com/django-mptt/django-mptt) into it

::

	$ mkdir lib
	$ cd lib
	$ git clone git://github.com/django-mptt/django-mptt.git

Change into your project root and create a symbolic link to the downloaded mptt module

::

	$ cd ../myFeinCMSSite/
	$ ln -s ../lib/django-mptt/mptt/ mptt

Step into the example app and start the runserver

::

	$ cd example 
	$ ./manage.py runserver

The username and password for the examples admin-interface are 'admin' and 'password'


Further Steps
-------------

Feel free to delete all files you do not need for your installation:

::

/docs/
/MANIFEST.in
/quickstart.sh
/setup.py
/tests/

