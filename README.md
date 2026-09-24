# 902-daloskönyv

Ez a repó a **902. Kucsera Ferenc cserkészcsapat** tábori daloskönyvét tartalmazza. A daloskönyv LaTeX-ben készül, ami azt jelenti, hogy nem egy Word-fájlt szerkesztünk, hanem egy szöveges fájlba írjuk a dalokat, és egy program állítja össze belőle a szép, nyomtatható PDF-et (kottákkal együtt).

Ez a leírás végigvezet azon, hogyan tudsz te is szerkeszteni, akkor is, ha még soha nem programoztál.

---

## 1. Mire lesz szükséged?

Két programot kell telepítened a gépedre:

1. **Visual Studio Code** (röviden VS Code) – ebben fogsz szerkeszteni.
2. **Docker Desktop** – ez biztosítja a "gépet a gépben", amiben minden szükséges eszköz (LaTeX, kottaszedő program, betűtípusok) már telepítve van. Így neked nem kell ezekkel külön foglalkoznod, és mindenkinél ugyanúgy fog működni.

### 1.1. Visual Studio Code telepítése

1. Menj a [code.visualstudio.com](https://code.visualstudio.com) oldalra.
2. Kattints a letöltés gombra (a saját operációs rendszeredhez: Windows, Mac, vagy Linux).
3. Futtasd a telepítőt, és fogadd el az alapértelmezett beállításokat.

### 1.2. Docker Desktop telepítése

1. Menj a [docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop/) oldalra.
2. Töltsd le a saját operációs rendszeredhez való verziót.
3. Telepítsd, majd indítsd el a Docker Desktop programot. (Mac esetén felül a menüsorban meg fog jelenni egy bálna ikon – ha ez látható és nem "betölt" állapotban van, akkor Docker fut.)

Nem kell érteni, hogy a Docker pontosan mit csinál – elég, hogy telepítve van és fut a háttérben, amíg dolgozol.

### 1.3. Git telepítése

A fájlok verziózásához (ld. lejjebb a Git szakaszt) szükséges a Git program is.

- **Mac:** Nyisd meg a Terminál-t (Launchpad → Terminál), és írd be: `git --version`. Ha nincs telepítve, a rendszer felajánlja a telepítést – fogadd el.
- **Windows:** Töltsd le a [git-scm.com](https://git-scm.com/download/win) oldalról, és telepítsd az alapértelmezett beállításokkal.

### 1.4. VS Code kiegészítő (extension) telepítése

VS Code-ban telepítened kell egy kiegészítőt, ami lehetővé teszi, hogy a projekt "konténerben" (a Docker által biztosított elszigetelt gépben) nyíljon meg.

1. Nyisd meg a VS Code-ot.
2. A bal oldali sávban kattints a kockákat formázó ikonra (Extensions / Kiegészítők), vagy nyomd meg: `Cmd+Shift+X` (Mac) / `Ctrl+Shift+X` (Windows).
3. Keresd meg: **Dev Containers** (kiadó: Microsoft).
4. Kattints a **Install** gombra.

---

## 2. A projekt letöltése (klónozás)

Ha még nincs a géped egy másolata a repóból, ezt egyszer kell megcsinálnod.

1. Nyiss egy terminált:
   - **Mac:** Launchpad → Terminál
   - **Windows:** Start menü → keresd rá "Git Bash"
2. Navigálj oda, ahova le szeretnéd tölteni a projektet (pl. az Asztalra):
   ```
   cd Desktop
   ```
3. Másold le a projektet a következő paranccsal:
   ```
   git clone https://github.com/fay-ambrus/902-daloskonyv.git
   ```
4. Ez létrehoz egy `902-daloskonyv` mappát az Asztalon, benne az összes fájllal.

---

## 3. A projekt megnyitása VS Code-ban, konténerben

1. Nyisd meg a VS Code-ot.
2. **File → Open Folder...** (Fájl → Mappa megnyitása), és válaszd ki a letöltött `902-daloskonyv` mappát.
3. A jobb alsó sarokban felugrik egy értesítés: *"Folder contains a Dev Container configuration file. Reopen folder to develop in a container?"* – kattints a **Reopen in Container** gombra.

   Ha nem jön fel az értesítés: nyomd meg `Cmd+Shift+P` (Mac) / `Ctrl+Shift+P` (Windows), írd be "Reopen in Container", és nyomj Entert.

4. Az első alkalommal ez eltarthat néhány percig – ekkor a Docker letölti és felépíti azt a "gépet", amiben minden LaTeX-eszköz megvan. Ezt csak egyszer kell megvárni, utána gyors lesz.
5. Amikor elkészült, a bal oldali fájllistában látnod kell a projekt fájljait (pl. `902-daloskonyv.tex`).

Ha ezt a lépést kihagyod, és a saját géped LaTeX-programjaival próbálod megnyitni/futtatni a fájlokat, valószínűleg hibákat fogsz kapni, mert hiányoznak róla a szükséges eszközök. Ezért fontos a konténerben dolgozni.

---

## 4. Szerkesztés és a PDF előállítása

1. A bal oldali fájllistában kattints a `902-daloskonyv.tex` fájlra – ez tartalmazza a daloskönyv szerkezetét és a dalszövegeket.
2. Írj bele, módosíts, ahogy szükséges.
3. Mentsd el a fájlt (`Cmd+S` / `Ctrl+S`). Mentés után a rendszer automatikusan újra elkészíti a PDF-et.
4. A PDF megnyílik egy új fülön a VS Code-on belül, és minden mentés után automatikusan frissül.

Ha egy dalhoz kotta is tartozik, azt a `kottak` mappában található `.ly` kiterjesztésű fájlokban lehet megadni (ez egy kottaszedő nyelv, LilyPond néven).

---

## 5. Nagyon egyszerű Git útmutató

A Git egy olyan eszköz, amivel nyomon tudjuk követni, ki mit változtatott, és biztonságosan tudunk együtt dolgozni ugyanazon a projekten. Nem kell mindent érteni belőle – az alábbi néhány parancs elég a mindennapi használathoz.

Ezeket a parancsokat a VS Code alján található **Terminal** ablakban írd be (ha nem látod, nyisd meg: **Terminal → New Terminal** felül a menüsorban).

### 5.1. Mielőtt elkezdenél dolgozni: hozd naprakészre a saját másolatodat

```
git pull
```

Ez letölti mások esetleges változtatásait, hogy ne dolgozz elavult fájlokon.

### 5.2. Miután befejezted a munkát: mentsd el és töltsd fel a változtatásokat

Három lépés van, mindig ebben a sorrendben:

**1. lépés – jelöld ki, mely fájlokat szeretnéd elmenteni:**
```
git add .
```
(A pont azt jelenti, hogy "minden módosított fájlt".)

**2. lépés – írj egy rövid, érthető leírást arról, mit változtattál:**
```
git commit -m "Ide írd, mit csináltál, pl.: Hozzáadtam egy új cserkészdalt"
```

**3. lépés – töltsd fel a változtatást a közös tárhelyre:**
```
git push
```

### 5.3. Összefoglalva – ez a négy parancs a lényeg

| Parancs | Mit csinál |
|---|---|
| `git pull` | Letölti mások változtatásait |
| `git add .` | Kijelöli a te változtatásaidat mentésre |
| `git commit -m "..."` | Elmenti egy leírással, mit csináltál |
| `git push` | Feltölti a változtatást mindenki számára |

**Tipp:** Mindig `git pull`-lal kezdj, és `git push`-sal zárj, ha végeztél egy munkamenettel. Ha valamiben elakadsz, nyugodtan kérdezz – a Git parancsok nem törölnek semmit visszavonhatatlanul, amíg nem használsz különleges, "erőltetett" parancsokat.

---

## 6. Gyakori kérdések

**Nem jelenik meg a "Reopen in Container" felugró ablak.**
Nyomd meg `Cmd+Shift+P` / `Ctrl+Shift+P`, írd be: `Dev Containers: Reopen in Container`.

**A Docker Desktop nem indul el / hibát ír.**
Indítsd újra a gépet, majd próbáld újra elindítani a Docker Desktopot. Ha ez sem segít, kérj segítséget.

**Az első megnyitás nagyon sokáig tart.**
Ez normális – a konténer felépítése (a LaTeX-eszközök letöltése) néhány percet vehet igénybe, de csak első alkalommal, vagy ha a beállítások változnak.

**A PDF nem frissül mentés után.**
Ellenőrizd, hogy tényleg a konténerben nyitottad meg a projektet (a VS Code bal alsó sarkában "Dev Container" felirat látható, ha igen).
