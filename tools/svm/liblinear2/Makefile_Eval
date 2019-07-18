CXX ?= g++
CC ?= gcc
CFLAGS = -Wall -Wconversion -O3 -fPIC
LIBS ?= blas/blas.a
#LIBS ?= -lblas

all: train predict

train: tron.o linear.o train.c blas/blas.a eval.o
	$(CXX) $(CFLAGS) -o train train.c tron.o eval.o linear.o $(LIBS)

predict: tron.o linear.o predict.c blas/blas.a eval.o
	$(CXX) $(CFLAGS) -o predict predict.c tron.o eval.o linear.o $(LIBS)

eval.o: eval.h eval.cpp
	$(CXX) $(CFLAGS) -c -o eval.o eval.cpp

tron.o: tron.cpp tron.h
	$(CXX) $(CFLAGS) -c -o tron.o tron.cpp

linear.o: linear.cpp linear.h
	$(CXX) $(CFLAGS) -c -o linear.o linear.cpp

blas/blas.a:
	cd blas; make OPTFLAGS='$(CFLAGS)' CC='$(CC)';

clean:
	cd blas;	make clean
	rm -f *~ tron.o linear.o train predict
