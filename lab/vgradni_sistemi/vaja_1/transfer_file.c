#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>

#define BUFFER_SIZE 1024

int main(int argc, char *argv[]) {
    if (argc != 3)
    {
        fprintf(stderr, "Uporaba: %s <izvorna_datoteka> <ciljna_datoteka>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    int izvorna_dat, ciljna_dat;
    ssize_t num_read;
    char buffer[BUFFER_SIZE];

    // Odpremo izvorno datoteko za branje
    izvorna_dat = open(argv[1], O_RDONLY);
    if (izvorna_dat == -1) {
        perror("open izvorne datoteke");
        exit(EXIT_FAILURE);
    }

    // Odpremo ciljno datoteko za pisanje (ustvari, če ne obstaja)
    ciljna_dat = creat(argv[2], 0644);
    if (ciljna_dat == -1) {
        perror("creat ciljne datoteke");
        close(izvorna_dat);
        exit(EXIT_FAILURE);
    }

    // Beremo iz izvorne datoteke in pišemo v ciljno
    while ((num_read = read(izvorna_dat, buffer, BUFFER_SIZE)) > 0) {
        if (write(ciljna_dat, buffer, num_read) != num_read) {
            perror("write v ciljno datoteko");
            close(izvorna_dat);
            close(ciljna_dat);
            exit(EXIT_FAILURE);
        }
    }

    if (num_read == -1) {
        perror("read iz izvorne datoteke");
    }

    // Zapremo obe datoteki
    if (close(izvorna_dat) == -1) {
        perror("close izvorne datoteke");
    }

    if (close(ciljna_dat) == -1) {
        perror("close ciljne datoteke");
    }

    return 0;
}
