All: recMult fibonacci
//LIB=libFunctions.o
CC=gcc

recMult: recMult.o $(LIB)
	$(CC) $@.o -g -o $@

fibonacci: fibonacci.o $(LIB)
	$(CC) $@.o -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
