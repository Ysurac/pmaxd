# build helloworld executable when user executes "make"
all: pmaxd xplsendjson jsongetxplstate testpmaxd onlyxplstate mysqlxplstate
pmaxd: pmaxd.o
	$(CC) $(LDFLAGS) pmaxd.o -o pmaxd -lxPL -lconfig
pmaxd.o: pmaxd.c
	$(CC) $(CFLAGS) -c pmaxd.c 
xplsendjson: xplsendjson.o
	$(CC) $(LDFLAGS) xplsendjson.o -o xplsendjson.cgi -lxPL 
xplsendjson.o: xplsendjson.c
	$(CC) $(CFLAGS) -c xplsendjson.c
jsongetxplstate: jsongetxplstate.o
	$(CC) $(LDFLAGS) jsongetxplstate.o -o jsongetxplstate.cgi -lxPL
jsongetxplstate.o: jsongetxplstate.c
	$(CC) $(CFLAGS) -c jsongetxplstate.c
onlyxplstate: onlyxplstate.o
	$(CC) $(LDFLAGS) onlyxplstate.o -o onlyxplstate -lxPL
onlyxplstate.o: onlyxplstate.c
	$(CC) $(CFLAGS) -c onlyxplstate.c
testpmaxd: testpmaxd.o
	$(CC) $(LDFLAGS) testpmaxd.o -o testpmaxd -lxPL -lconfig
testpmaxd.o: testpmaxd.c
	$(CC) $(CFLAGS) -c testpmaxd.c
mysqlxplstate: mysqlxplstate.o
	$(CC) $(LDFLAGS) mysqlxplstate.o -o mysqlxplstate -lmysqlclient -lxPL -lconfig
mysqlxplstate.o: mysqlxplstate.c
	$(CC) $(CFLAGS) -c mysqlxplstate.c

		
	
	

# remove object files and executable when user executes "make clean"
clean:
	rm *.o pmaxd testpmaxd xplsendjson.cgi jsongetxplstate.cgi mysqlxplstate onlyxplstate
