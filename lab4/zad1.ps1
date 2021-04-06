# Tablica partycji  – sposób zapisu informacji o partycjach na dysku twardym.

diskpart

#wylistowanie dysków (sprawdzenie tablicy partycji)
list disk

select disk 3  # w tym przypadku byl to pendrive

#wylistowanie partycji
list partiton

select part 1

#przypisanie litery
assign letter = X

#stworzenie partycji
create partition primary size = 1000 # tworzy partycje o rozmiarze 1000mb

#formatowanie partycji
format fs=ntfs

#zamontowanie dysku do katalogu

assign mount=C:\Users\huber\Desktop\katalog