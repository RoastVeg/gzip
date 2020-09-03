CC=		gcc
CFLAGS=		-g -O2 -DSMALL=1 -DNO_XZ_SUPPORT=1 -DNO_BZIP2_SUPPORT=1 -Wall
#-Du_char="unsigned char" -Du_short="unsigned short" -Du_int="unsigned int"
LDFLAGS=	-lz

MAN=		gzip.1 gzexe.1 zdiff.1 zforce.1 zgrep.1 zmore.1 znew.1

SCRIPTS=	gzexe zdiff zforce zgrep zmore znew

MLINKS+=	gzip.1 gunzip.1 \
		gzip.1 gzcat.1 \
		gzip.1 zcat.1 \
		zdiff.1 zcmp.1 \
		zgrep.1 zegrep.1 \
		zgrep.1 zfgrep.1 \
		zmore.1 zless.1

OBJS=		gzip.o

%.o: %.c
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

all: gzip

gzip: $(OBJS)
	$(CC) $(LDFLAGS) $(CFLAGS) -o $@ $(OBJS) $(LIBS)

clean:
	rm $(OBJS)
