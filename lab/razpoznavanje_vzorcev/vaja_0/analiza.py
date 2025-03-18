import numpy as np
import matplotlib.pyplot as plt

if __name__ == "__main__":
    X_train = np.load("ucni_vzorci.npy")
    y_train = np.load("ucne_oznake.npy")
    X_test = np.load("testni_vzorci.npy")
    y_test = np.load("testne_oznake.npy")

    # preveri atribute prebranih podatkov - velikost, tip, zaloga vrednosti


    for polje in (X_train, y_train, X_test, y_test):
        print(f"Shape: {polje.shape} | Type: {polje.dtype} | Min: {polje.min()} | Max: {polje.max()}") 

    # izpis prvih nekaj oznak

    print(f"Prve oznake: {y_train[:20]}") 

    # izris prvih nekaj slik s podatkovne zbirke

    for i in range(6):
        plt.subplot(2, 3, i + 1)
        plt.imshow(X_train[i], cmap="gray")

    plt.tight_layout()
    plt.show() 

    # izris vzorcev vsakega razreda

    """ for razred in range(10):
        print("Oznaka razreda:", razred)
        indikator_razreda = (y_train == razred)
        vzorci_razreda = X_train[indikator_razreda]
        plt.figure(0, (10, 5))
        for i in range(8):
            plt.subplot(2, 4, i + 1)
            plt.imshow(vzorci_razreda[i], cmap="gray")
        
        plt.tight_layout()
        plt.savefig("vzorci_razred_%d.png" % razred)
        plt.show() """

    # Izračun statistik populacije

    """ for razred in range(10):
        populacija = np.sum(y_train == razred)
        print("-" * 40)
        print("Populacija razreda %d: %d" % (razred, populacija))
        indikator_razreda = (y_train == razred)
        vzorci_razreda = X_train[indikator_razreda]
        delez_nicel = np.mean(vzorci_razreda == 0)
        srednja_vrednost = np.mean(vzorci_razreda)
        standardni_odklon = np.std(vzorci_razreda)
        print("Povp. velikost področij slik: %.4f" % (1 - delez_nicel))
        print("Vrednosti pikslov: %.4f ± %.4f" % (srednja_vrednost, standardni_odklon)) """
