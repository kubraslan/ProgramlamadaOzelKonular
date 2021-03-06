CC = gcc -std=c11 -Wall
AR = ar rcs     # Kütüphane haline getir
RANLIB = ranlib # Sıkıştır
OBJ = src/mattranspose.o src/fastfibo.o src/matarith.o 
EXEC = mattest
all: lib test

lib: $(OBJ)     # Tüm objeleri
	$(AR) src/libmatarith.a $^
	$(RANLIB) src/libmatarith.a

test: src/libmatarith.a
	$(CC) -o $(EXEC) -L./src test/matrix_test.c -lmatarith 

src/*.o : src/*.c
	$(CC) -c $< -o $@

run: lib test
	./$(EXEC)

clean:
	@rm -f src/*.o src/*.a $(EXEC)