All: recMult
//LIB=libFunctions.o
CC=gcc

recMult: recMult.o $(LIB)
	$(CC) $@.o -g -o $@

//guessNumber: guessNumber.o $(LIB)
	//$(CC) $@.o $(LIB) -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
