README - Tema 1 - Metode Numerice
Mieilă Eduard-Robert, 313CA

Part 1
	Pentru functia generate_probablities_system am reprezentat labirintul
intr-o matrice maze de rows linii si rows coloane. Pe fiecare rand vom avea
1, 2, 3...rows numere, reprezentand numaratoarea intersectiile din labirint.
Acestea vor fi aliniate la stanga. 
	S-a constatat ca Vectorul b va avea 1 pe ultimele rows linii si 0
pe celelalte pozitii.
	Pentru matricea A se va verifica fiecare element non-zero din matricea
maze. Mai exact, vom cauta vecini in pozitiile sus, jos, stanga, dreapta si
sus-stanga, respectiv jos-dreapta.
	De asemenea, s-au constatat urmatoarele detalii:
	- Daca o intersectie are 2 vecini non-zero, aceasta se afla intr-unul
		din colturile labirintului si are, de fapt, 4 iesiri.
	- Daca o intersectie are 4 vecini non-zero, ea este la marginea labirintului
		si are, in realitate, 5 iesiri.
	- Daca o intersectie are 6 vecini non-zero, se afla in interiorul labirintului
		si are 6 iesiri.
	In matricea A, pe pozitia intersectiei vom pune numarul iesirilor.

	Pentru celelalte functii, s-au aplicat algoritmii din enunt, respectiv cei
studiati in cadrul laboratoarelor.


Part 2
	Pentru functia clustering_pc am decis ca listele sa fie de fapt centroidul.
Practic, in matricea centroids, initializata cu 0, vom aduna punctele peste
pozitia centroidului caruia ii apartine, numarand cate puncte au fost adaugate
in acel cluster. La final, fiecare pozitie va fi impartita la numarul de puncte
adunate la acel centroid.
	Dupa intializare, in care fiecare punct se duce in clusterul numarul liniei
mod NC, vom determina de fiecare data distantele fiecarui punct fata de fiecare
centroid. Ne vom folosi de matricea dist pentru a determina carui centroid ii
apartine fiecare punct. Vom face acesti pasi, pana cand centroizii nu se vor
mai modifica.

	Pentru functia compute_cost, vom determina distanta minima dintre fiecare
punct si centroizi. Vom aduna distanta la cost.

Part 3
	Pentru rgbHistogram vom citi imaginea cu imread. imRead va returna o matrice
WxHx3, pe fiecare nivel al matricei tridimensionale aflandu-se valoarea R,G,
respectiv B a fiecarui pixel. Vom folosi functia histcpentru a numara numarul
pixelilor cu valoarea 0, 1, 2...255 in valorile R,G,B. Vom aduga rezultatul lui
histc la stanga pentru a avea pe fiecare linie numarul total al pixelilor cu acea
valoare.
	Vom calcula apoi capetele intervalelor(16 intervale implica 17 capete)
in care urmeaza sa fie impartita histograma. Primul capat al intervalului va fi
considerat 0.9999. Toate celelate capete vor fi calculate ca fiind
precedentul + 256 / count_bins. Ultimul capat va fi considerat 257, pentru a fi
siguri ca valorile cu 255(care in matricele noastre/vectorii nostri se afla pe
pozitiile 256) nu vor fi "uitate".
	La final vom adauga numarul pixelilor la fiecare bin caruia ii apartine.
In vectorul sol, valorile R se vor afla pe primele count_bins pozitii, G pe 
urmatoarele count_bins pozitii, iar B pe ultimele count_bins pozitii.

	Pentru hsvHistogram vom citi imaginea si vom transforma valorile din RGB
in HSV folosind functia RGBtoHSV(care foloseste algoritmul din enunt).
	Vom genera intervalele in mod similar ca cele de la RGB, diferenta fiind
ca primul element va fi 0, iar urmatoarele vor fi calculate ca fiind precedentul +
1.01 / count_bins.
	In final, vom adauga fiecare pixel la bin-ul corespunzator.

	Celelalte functii nu au fost implementate.

Part 4
	Functiile nu au fost implementate.


Feedback:
	Personal, Tema 1 la MN a fost foarte interesanta si diversa. Pe alocuri mi-a
dat batai de cap, uneori chiar parti care nu tin neaparat de MN, dar s-au rezolvat.
Cerintele au fost destul de clare(desi initial, unele exemple erau ambigue, s-au
rezolvat prin update-uri la enunt). Poate cate 2 exemple pentru aceasi caz ar fi o
idee buna pe viitor. Foarte faina ideea de la part-3 cu histogramele.
	Numarul mare de functii ce trebuiau implementate mai departe la part-3 m-a
descurajat sa continui. Desi sunt sigur ca unele dintre ele nu sunt complicate,
timpul limitat si suprapunerea cu alte teme nu mi-au permis sa merg mai departe.
	In orice caz, felicitari pentru o tema geniala!
	Long live the numerical methods! :)