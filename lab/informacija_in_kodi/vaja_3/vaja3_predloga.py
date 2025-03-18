def kompresiraj(ST):
    """Kompresira zaporedje bajtov ST v kompresijsko kodo KT."""

    # inicializacija slovarja PT - vsi veljavni 8-bitni znaki
    dict_size = 256
    PT = {bytes([i]): i for i in range(dict_size)}
    KT = []

    # 1. korak:
    s = bytes([ST[0]])

    # 2. korak:
    for i in range(1, len(ST)):
        t = bytes([ST[i]])
        u = s + t
        if u in PT:
            s = u
        else:
            KT.append(PT[s])
            PT[u] = dict_size
            dict_size += 1
            s = t

    # 3. korak:
    KT.append(PT[s])
 
    return KT
 
def dekompresiraj(KT):
    """Dekompresira kompresijsko kodo KT v zaporedje bajtov ST."""
    # gradimo inverzni slovar PT - vsi veljavni 8-bitni znaki
    dict_size = 256
    PT = {i: bytes([i]) for i in range(dict_size)}
    ST = []
    
    #prvi znak v nizu 
    c0 = KT[0]
    s0 = PT[c0]
    ST.append(s0)
    for i in range(1, len(KT)):
        c=KT[i]
        if c in PT:
            s = PT[c]
        elif c == dict_size:
            s = s0 + s0[0:1]

        ST.append(s)
        PT[dict_size] = s0+s[0:1]
        dict_size +=1
        s0 = s
        c0 = c

    rezultat = bytes()
    for element in ST:
        rezultat += element
    return rezultat

def izracunaj_velikost(KT):
    import math
    dict_size = 256
    num_bits = 8
    total_bits = 0
    for code in KT:
        total_bits += num_bits
        if dict_size == (2**num_bits):
            num_bits += 1

        dict_size += 1

    total_size = math.ceil(total_bits / 8)
    return total_size

