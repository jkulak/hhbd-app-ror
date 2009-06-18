#!/bin/bash
svn ci -m $2
svn copy https://hhbd20.googlecode.com/svn/trunk https://hhbd20.googlecode.com/svn/tags/$1 -m "$2"
