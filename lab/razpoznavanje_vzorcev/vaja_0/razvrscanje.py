import numpy as np
import matplotlib.pyplot as plt
from sklearn.neighbors import KNeighborsClassifier

if __name__ == "__main__":
    # Nalaganje učne in testne zbirke
    X_train = np.load("ucni_vzorci.npy")
    y_train = np.load("ucne_oznake.npy")
    X_test = np.load("testni_vzorci.npy")
    y_test = np.load("testne_oznake.npy")

    # iz vsakega razreda vzamemo manjše število učnih vzorcev,
    # za hitrejše učenje:

    # število učnih vzorcev / razred
    # TODO: ovrednoti odvisnost med številom učnih vzorcev in
    # natančnostjo razvrščanja testne množice
    N = 10

    X_train_manjsi = np.zeros((10 * N, 28, 28))
    y_train_manjsi = np.zeros(((10 * N,)))

    for razred in range(10):
        indikator_razreda = (y_train == razred)
        vzorci_razreda = X_train[indikator_razreda]

        # TODO: premešaj vzorce razreda, tako, da se vsakič naključno vzorčijo

        X_train_manjsi[razred * N : (razred + 1) * N] = vzorci_razreda[:N]
        y_train_manjsi[razred * N : (razred + 1) * N] = razred

    # Primer izpeljave značilk iz vzorcev:
    # Vsako sliko predstavimo z velikostjo področja predmeta,
    # t.j., z deležem neničelnih pikslov.
    # Vsak vzorec je torej predstavljen z eno vrednostjo:
    velikost_znacilk = 1

    X_train_znacilke = np.zeros((X_train_manjsi.shape[0], velikost_znacilk))

    for i, vzorec in enumerate(X_train_manjsi):
        znacilka = np.mean(vzorec != 0)
        X_train_znacilke[i, :] = znacilka

    # Z istim postopkom izpeljemo še značilke testnih vzorcev
    
    X_test_znacilke = np.zeros((X_test.shape[0], velikost_znacilk))

    for i, vzorec in enumerate(X_test):
        znacilka = np.mean(vzorec != 0)
        X_test_znacilke[i, :] = znacilka

    # Inicializacija in učenje razvrščevalnika na značilkah
    # TODO: preizkusi razvrščevalnik z metodo najmanjših kvadratov
    razvrscevalnik = KNeighborsClassifier()
    razvrscevalnik.fit(X_train_znacilke, y_train_manjsi)

    # Preizkušanje razvrščevalnika na značilkah testnih vzorcev

    y_test_hat = razvrscevalnik.predict(X_test_znacilke)

    # Izračun deleža pravilno razvrščenih testnih vzorev
    pravilni = 0
    for i in range(len(y_test)):
        if y_test[i] == y_test_hat[i]:
            pravilni += 1
        
    natancnost_for = pravilni / len(y_test)


    # Isti izračun kot zgoraj, z vektorskimi operacijami namesto for zanke
    natancnost_vec = np.mean(y_test_hat == y_test)

    # Potrditev, da se izračuna natančnosti ujemata:
    assert np.allclose(natancnost_for, natancnost_vec), "Natančnosti se ne ujemata!"

    print("Uspešnost razvrščanje testne zbirke: %.4f" % natancnost_vec)
