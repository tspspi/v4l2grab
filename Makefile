all: v4l2grab v4l2grab_mmap v4l2grab_read v4l2grab_userptr

v4l2grab: v4l2grab.o

	clang -o v4l2grab -L/usr/local/lib v4l2grab.o -ljpeg

v4l2grab_mmap: v4l2grab_mmap.o

	clang -o v4l2grab_mmap -L/usr/local/lib v4l2grab_mmap.o -ljpeg

v4l2grab_read: v4l2grab_read.o

	clang -o v4l2grab_read -L/usr/local/lib v4l2grab_read.o -ljpeg

v4l2grab_userptr: v4l2grab_userptr.o

	clang -o v4l2grab_userptr -L/usr/local/lib v4l2grab_userptr.o -ljpeg

v4l2grab.o: v4l2grab.c

	clang -c -I/usr/local/include -Wall -ansi -std=c99 -Werror -o v4l2grab.o v4l2grab.c -DIO_READ -DIO_MMAP -DIO_USERPTR

v4l2grab_mmap.o: v4l2grab.c

	clang -c -I/usr/local/include -Wall -ansi -std=c99 -Werror -o v4l2grab_mmap.o v4l2grab.c -DIO_MMAP

v4l2grab_read.o: v4l2grab.c

	clang -c -I/usr/local/include -Wall -ansi -std=c99 -o v4l2grab_read.o v4l2grab.c -DIO_READ

v4l2grab_userptr.o: v4l2grab.c

	clang -c -I/usr/local/include -Wall -ansi -std=c99 -Werror -o v4l2grab_userptr.o v4l2grab.c -DIO_USERPTR

test: v4l2grab_mmap v4l2grab_read v4l2grab_userptr

	-./v4l2grab_mmap -o test_mmap.jpg
	-./v4l2grab_read -o test_read.jpg
	-./v4l2grab_userptr -o test_userptr.jpg

clean:

	rm *.o
	rm *.jpg

.PHONY: clean test

	rm *.o
