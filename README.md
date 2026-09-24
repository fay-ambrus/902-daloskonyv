# 902-daloskönyv

Ez a repó a **902. Kucsera Ferenc cserkészcsapat** tábori daloskönyvét tartalmazza. A daloskönyv LaTeX-ben készül, ami azt jelenti, hogy nem egy Word-fájlt szerkesztünk, hanem egy szöveges fájlba írjuk a dalokat, és egy program állítja össze belőle a szép, nyomtatható PDF-et (kottákkal együtt).

Ez a leírás végigvezet azon, hogyan tudsz te is szerkeszteni, akkor is, ha még soha nem programoztál. A leírás Windows-t használ – ha Mac-en vagy Linux-on dolgozol, a lépések nagyon hasonlóak, csak a telepítőket a saját operációs rendszeredhez kell letöltened.

Ha bármelyik lépésnél elakadsz, vagy technikai problémába futsz, keresd **Kerakot**.

---

## 1. Mire lesz szükséged?

Három programot kell telepítened a gépedre:

1. **Visual Studio Code** (röviden VS Code) – ebben fogsz szerkeszteni.
2. **Docker Desktop** – ez biztosítja a "gépet a gépben", amiben minden szükséges eszköz (LaTeX, kottaszedő program, betűtípusok) már telepítve van. Így neked nem kell ezekkel külön foglalkoznod, és mindenkinél ugyanúgy fog működni.
3. **Git** – ezzel tudod letölteni (klónozni) a projektet, és ezzel tudod majd feltölteni a változtatásaidat.

### 1.1. Visual Studio Code telepítése

1. Menj a [code.visualstudio.com](https://code.visualstudio.com) oldalra.
2. Kattints a **Download for Windows** gombra.
3. Futtasd a letöltött telepítőt (`VSCodeUserSetup-....exe`), és fogadd el az alapértelmezett beállításokat (mindenhol mehet a **Next**, majd **Install**).
4. A végén hagyd bejelölve a **Launch Visual Studio Code** opciót, és kattints a **Finish** gombra.

### 1.2. Docker Desktop telepítése

1. Menj a [docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop/) oldalra.
2. Kattints a **Download for Windows** gombra.
3. Futtasd a letöltött telepítőt (`Docker Desktop Installer.exe`), és fogadd el az alapértelmezett beállításokat.
   - Ha a telepítő felajánlja a **WSL 2** (Windows Subsystem for Linux) telepítését is, fogadd el – ez szükséges a Dockerhoz.
   - Ha a telepítés végén újraindítást kér a gép, indítsd újra.
4. Újraindítás után indítsd el a **Docker Desktop** programot (Start menü → keresd rá "Docker Desktop"). Várd meg, amíg elindul (ez eltarthat egy kicsit) – a jobb alsó tálcán megjelenő bálna ikon jelzi, hogy fut.
5. Ha a program elsőre kér egy Docker Hub fiókot / bejelentkezést, ezt átugorhatod ("Skip" / "Continue without signing in"), nem szükséges.

Nem kell érteni, hogy a Docker pontosan mit csinál – elég, hogy telepítve van és fut a háttérben, amíg dolgozol.

### 1.3. Git telepítése

1. Menj a [git-scm.com/download/win](https://git-scm.com/download/win) oldalra – a letöltés automatikusan elindul.
2. Futtasd a telepítőt, és mindenhol hagyd az alapértelmezett beállításokat (nyugodtan kattints végig **Next** gombokkal, majd **Install**).
3. A telepítés végén a **Finish** gombra kattintva befejezheted.

### 1.4. VS Code kiegészítő (extension) telepítése

VS Code-ban telepítened kell egy kiegészítőt, ami lehetővé teszi, hogy a projekt "konténerben" (a Docker által biztosított elszigetelt gépben) nyíljon meg.

1. Nyisd meg a VS Code-ot.
2. A bal oldali sávban kattints a kockákat formázó ikonra (Extensions / Kiegészítők), vagy nyomd meg: `Ctrl+Shift+X`.
3. Keresd meg: **Dev Containers** (kiadó: Microsoft).
4. Kattints a **Install** gombra.

### 1.5. GitHub fiók létrehozása

A projekt a GitHub nevű oldalon van tárolva. A projekt letöltéséhez (klónozáshoz) nincs szükséged fiókra, mivel a repó nyilvános – de amikor először szeretnél te is feltölteni egy változtatást, be kell majd jelentkezned egy GitHub fiókkal. Érdemes ezt már most elintézni:

1. Menj a [github.com](https://github.com) oldalra.
2. Kattints a **Sign up** gombra.
3. Add meg az e-mail címedet, válassz egy jelszót, majd egy felhasználónevet – kövesd a képernyőn megjelenő lépéseket.
4. A GitHub e-mailben (vagy egy rövid ellenőrző kóddal) megerősítteti a fiókodat – kövesd az utasításokat.

Ha már van GitHub fiókod, ezt a lépést kihagyhatod.

---

## 2. A projekt letöltése (klónozás)

Ha még nincs a géped egy másolata a repóból, ezt egyszer kell megcsinálnod.

1. Nyiss egy terminált: Start menü → keresd rá "Git Bash", és nyisd meg.
2. Navigálj oda, ahova le szeretnéd tölteni a projektet (pl. az Asztalra):
   ```
   cd Desktop
   ```
3. Másold le a projektet a következő paranccsal:
   ```
   git clone https://github.com/fay-ambrus/902-daloskonyv.git
   ```
4. Ez létrehoz egy `902-daloskonyv` mappát az Asztalon, benne az összes fájllal.

A projekt letöltéséhez (klónozáshoz) és a mások változtatásainak lehívásához (`git pull`) nem kell bejelentkezned semmilyen fiókba, mivel a repó nyilvános. Bejelentkezésre csak akkor lesz szükség, amikor először szeretnél te is feltölteni egy változtatást (`git push`) – ezt a következő szakaszban részletezzük.

---

## 3. A projekt megnyitása VS Code-ban, konténerben

1. Nyisd meg a VS Code-ot.
2. **File → Open Folder...** (Fájl → Mappa megnyitása), és válaszd ki a letöltött `902-daloskonyv` mappát.
3. A jobb alsó sarokban felugrik egy értesítés: *"Folder contains a Dev Container configuration file. Reopen folder to develop in a container?"* – kattints a **Reopen in Container** gombra.

   Ha nem jön fel az értesítés: nyomd meg `Ctrl+Shift+P`, írd be "Reopen in Container", és nyomj Entert.

4. Az első alkalommal ez eltarthat néhány percig – ekkor a Docker letölti és felépíti azt a "gépet", amiben minden LaTeX-eszköz megvan. Ezt csak egyszer kell megvárni, utána gyors lesz.
5. Amikor elkészült, a bal oldali fájllistában látnod kell a projekt fájljait (pl. `902-daloskonyv.tex`).
6. Felugorhat egy értesítés, ami megkérdezi, hogy engedélyezed-e egy háttérfolyamat elindítását ("Allow" / "Do you want to allow this task to run?"). Ez a folyamat figyeli a kottafájlok (`.ly`) változásait, hogy mentés után azok is automatikusan újrarenderelődjenek – kattints az **Allow** gombra.

Ha ezt a lépést kihagyod, és a saját géped LaTeX-programjaival próbálod megnyitni/futtatni a fájlokat, valószínűleg hibákat fogsz kapni, mert hiányoznak róla a szükséges eszközök. Ezért fontos a konténerben dolgozni.

---

## 4. Szerkesztés és a PDF előállítása

1. A bal oldali fájllistában kattints a `902-daloskonyv.tex` fájlra – ez tartalmazza a daloskönyv szerkezetét és a dalszövegeket.
2. Írj bele, módosíts, ahogy szükséges.
3. Mentsd el a fájlt (`Ctrl+S`). Mentés után a rendszer automatikusan újra elkészíti a PDF-et.
4. A PDF megnyílik egy új fülön a VS Code-on belül, és minden mentés után automatikusan frissül.

Ha egy dalhoz kotta is tartozik, azt a `kottak` mappában található `.ly` kiterjesztésű fájlokban lehet megadni (ez egy kottaszedő nyelv, LilyPond néven). A LilyPond szintaxis részletes leírását a hivatalos dokumentációban találod: [lilypond.org/doc](https://lilypond.org/doc/v2.24/Documentation/notation/index.html).

---

## 5. Nagyon egyszerű Git útmutató

A Git egy olyan eszköz, amivel nyomon tudjuk követni, ki mit változtatott, és biztonságosan tudunk együtt dolgozni ugyanazon a projekten. Nem kell mindent érteni belőle. A VS Code beépített, gombokkal kezelhető felületét fogjuk használni, a **Source Control** (Forráskezelés) panelt. Nincs szükség parancsok beírására.

A panel megnyitásához kattints a bal oldali sávban a harmadik ikonra (elágazó vonalakat formázó ikon), vagy nyomd meg: `Ctrl+Shift+G`.

### 5.1. Mielőtt elkezdenél dolgozni: hozd naprakészre a saját másolatodat

A Source Control panel közepén található a **"Graph"** menü, ahol egy lefelé mutató folytonos nyilat kell keresni ("Pull"). Munka megkezdése előtt kattints erre, hogy letöltsd mások esetleges változtatásait, és ne dolgozz elavult fájlokon.

### 5.2. Miután befejezted a munkát: mentsd el és töltsd fel a változtatásokat

Amikor elmentettél egy fájlt (`Ctrl+S`), a Source Control panelen megjelenik egy lista a módosított fájlokról, "Changes" felirat alatt.

1. **Jelöld ki, mit szeretnél elmenteni:** minden módosított fájl mellett van egy `+` ikon – kattints rá egyenként, vagy vidd az egeret a "Changes" felirat fölé, és kattints az ott megjelenő `+` ikonra, hogy egyszerre az összeset kijelöld.
2. **Írj egy rövid, érthető leírást** a panel tetején lévő szövegmezőbe arról, mit változtattál (pl.: "Kaláka: Finálé hozzáadva").
3. **Kattints a ✓ Commit gombra** a szövegmező alatt – ez elmenti a változtatást.
4. **Kattints a "Push"** gombra (felfelé mutató nyil a "Pull" mellett) – ez tölti fel a változtatást a közös tárhelyre.

**Első alkalommal**, amikor a Source Control pnalet használod, felugorhat egy böngészőablak, ami arra kér, hogy jelentkezz be a GitHub fiókoddal. Ez teljesen normális – jelentkezz be, engedélyezd a hozzáférést, majd térj vissza a VS Code-hoz. Ezután a géped emlékezni fog rád, és többször nem kell újra bejelentkezned.

---

## 6. Gyakori kérdések

**Nem jelenik meg a "Reopen in Container" felugró ablak.**
Nyomd meg `Ctrl+Shift+P`, írd be: `Dev Containers: Reopen in Container`.

**A Docker Desktop nem indul el / hibát ír, vagy WSL 2-vel kapcsolatos hibát kapok.**
Indítsd újra a gépet, majd próbáld újra elindítani a Docker Desktopot. Ha a hiba WSL-lel kapcsolatos, nyisd meg a PowerShell-t (Start menü → "PowerShell"), írd be: `wsl --update`, majd indítsd újra a gépet. Ha ez sem segít, kérj segítséget Keraktól.

**Az első megnyitás nagyon sokáig tart.**
Ez normális – a konténer felépítése (a LaTeX-eszközök letöltése) néhány percet vehet igénybe, de csak első alkalommal, vagy ha a beállítások változnak.

**A PDF nem frissül mentés után.**
Ellenőrizd, hogy tényleg a konténerben nyitottad meg a projektet (a VS Code bal alsó sarkában "Dev Container" felirat látható, ha igen).
