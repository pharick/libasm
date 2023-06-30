# libasm

**A static library of standard and not-so-standard functions implemented in Assembly. A project completed at Ecole42.**

## Implemented Functions

- strlen (computes the length of a string)
- strcpy (copies a string)
- strcmp (compares two strings lexicographically)
- write (sends characters to a stream, uses the write system call)
- read (reads characters from a stream, uses the read system call)
- strdup (allocates memory for a copy of a string, uses the standard malloc function)
- strchr (finds a character in a string)
- atoi_base (converts a string to a number with consideration of the number system)
- list_push_front (adds an element to a singly-linked list)
- list_size (computes the length of a singly-linked list)
- list_sort (sorts a singly-linked list)
- list_remove_if (removes elements from a singly-linked list that satisfy a certain condition specified by a function)

## Library Build

make

*Requires the nasm compiler for building and is supported on macOS.*
