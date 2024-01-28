CFLAGS = -O2 -Wall -Wno-narrowing \
  -I./ \
  -I../../libSNL/src \
  -I/opt/X11/include 

LFLAGS = \
  -L/usr/lib \
  -L/opt/X11/lib  -lX11 -lXi -lXmu -lXext -lXt -lSM -lICE \
  -lm -lpthread 

include Makefile.inc

ULIB = \
 userFunction.c

SUTIL = \
 uselibSNL.cpp \
 generateTet.cpp \
 ../../libSNL/src/*.cpp

OLIB = $(SLIB:.c=.o)
xOULIB = $(ULIB:.c=.o)
OUTIL = $(SUTIL:.c=.o)

cgx: $(OLIB) $(OUTIL) $(OULIB)
	g++  $(OULIB)  $(OLIB) $(OUTIL)  $(CFLAGS) $(LFLAGS) -framework GLUT -framework OpenGL -o $@



