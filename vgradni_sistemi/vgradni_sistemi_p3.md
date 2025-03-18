# Funkcije za uporavljanje datotek
- Sistemski klici, funkcije za upravljanje datotek in I/O prenosov
- Daotecni deskriptorji
- Hiter pregled najpomembnejsih funkcij`


## Funkcije za upravljanje datotek
- `open, creat, read, write, close, lseek` $\Rightarrow$ Sistemski klici za I/O in datotecni sistem
	- `open`: odpri *obstojeco datoteko*
	- `creat`: ustvari datoteko
	- `read`: preberi datoteko
	- `write`: pisi v datoteko
	- `close`: zapri datoteko
	- `lseek`: premakni *datotecni kazalec*, premikanje naprej in nazaj znotraj datoteke
- Funkcije, ki pred imenom ne vsebujejo `f`, so _zapecene v operacijskem sistemu UNIX_
- Funkcije, ki pred imenom vsebujejo `f`, so del _standardne c knjiznice_ `stdlib, glibc`
### Funkciji `open` in `creat`
- Funkcija `open` odpre datoteko in vrne _deskriptor_, ki nam sluzi kot nekaksna identifikacijska stevilka datoteke
- *Zastavice:*
	- `O_RDONLY`: samo za branje
	- `O_WRONLY`: samo za pisanje
	- `O_RDWR`: dovoljeno branje in pisanje
	- `O_CREAT`: ce datoteka ne obstaja jo ustvarimo
	- `O_APEND`: dodajamo na obstojeco datoteko
	- `O_TRUNC`: povozimo datoteko, ko jo posodobimo
- __Bitna dovoljenja:__
	- Zaradi varnosti obstajajo razlicni nacini in nivoji dostopa do datotek
	- 9 polij, ki vsebujejo podatke odovoljenjih za dostop do datotek, ki jih beremo z desne proti levi
	- To so biti, ki kazejo, kaksne pravice ima uporabnik pri dostopu do datotek
	- _Prvi trije elementi_: Vsebujejo pravice __lastnika__ (`owner`)
	- _Drugi trije elementi:_ Vsebujejo pravice __skupine__ (`group`)
	- _Zadnji trije elementi_: Vsebujejo pravice __uporabnika__ (`user`)
	- Vsaka skupina 3 elementov ima mesta za:
		- `r`: Dovoljenje za _branje_
		- `w`: Dovoljenje za _pisanje_
		- `x`: Dovoljenje za *izvajanje executable datoteke*
	- To lahko zakodiramo v _osmiski zapis_ za vsako od 3 skupin


| Format v sistemu unix | `r-w-_` | `r-_-w` | `r-w-x` |
| :-------------------: | :-----: | :-----: | :-----: |
| __Binarno kodiranje__ | `1-1-0` | `1-0-1` | `1-1-1` |
| __Osmisko kodiranje__ |   `6`   |   `5`   |   `7`   |

### Funkcija `close`
```c
int close(int fd);
```
- Zapre datoteko, na katero kaze _datotecni dekriptor_ `fd`
- Po tem operacije niso vec mozne
- Vrne `0` o uspehu in `-1` ob napaki
### Funkcija `read`
```c
ssize_t read(int fd, void *buff, size_t nbytes);
```
- Prebere `nbytes` bajtov iz `fd` v `buff`
- Vrne *dejansko stevilo prebranih bajtov* ali `-1` ob napaki
- Vrne `0`, ce pride do konca datoteke (`EOF`)

### Funkcija `write`
```c
ssize_t write(int fd, const void *buff, size_t nbytes);
```
- Zapise `nbytes` bajtov iz `buff` v datoteko na katero kaze `fd`
- Ce  rpogram vrne _manj od_ `nbytes`, pomeni, da je prislo do napake (npr. poln disk)

### Funkcija `lseek`
```c
off_t lseek(int fd, off_t offset, int whence);
```
- Spremeni datotecni odmik (file offset)  odprte datoteke
- `whence`: Od kod naj se premakne za `offset`
### Funkciji `dup` in `dup2`
```c
int dup(int fd);
int dup2(int fd, int fdupd);
```
prekocimo apparently

### Funkciji `fnctl` in `ioctl`

## Datotecni deskriptor
- Vsaka datoteka ima 