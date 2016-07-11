all: internal.so

internal.so: popclick.o detectors.o
	$(CC) $(LIBFLAG) -o $@ -std=c++11 -stdlib=libc++ -L$(LUA_LIBDIR) popclick.o detectors.o

popclick.o: popclick.mm
	$(CC) -c $(CFLAGS) -I$(LUA_INCDIR) -std=c++11 -stdlib=libc++ $< -o $@

detectors.o: detectors.cpp
	$(CC) -c $(CFLAGS) -std=c++11 -stdlib=libc++ $< -o $@

install: internal.so popclick.lua
	mkdir -p $(INST_LIBDIR)/thume/popclick/
	cp internal.so $(INST_LIBDIR)/thume/popclick/
	mkdir -p $(INST_LUADIR)/thume/
	cp popclick.lua $(INST_LUADIR)/thume/
