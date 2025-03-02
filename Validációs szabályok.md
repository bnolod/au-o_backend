
## Bejelentkezés

- Felhasználónév 
	- minimum 3 karakter
	- maximum 24 karakter
	- legalább 1 **alfanumerikus** karakter (a-z, A-Z, 0-9)
	- különleges karakterek NEM engedélyezettek
- E-mail cím
	- tartalmaz @ jelet és domaint
	- minimum 2 karakter a @ előtt
	- minimum 2 karakter a @ és . között
	- minimum 2 karakter a . után
	- esetleg email confirm ha van rá időnk
- Jelszó
	- minimum 8 karakter
	- maximum 255 karakter (vagy amennyit az adattípus bír, ha kevesebb)
	- tartalmaz kis és nagybetűket
	- tartalmaz számokat és betűket
	- legalább 1 különleges karakter
## Regisztráció

- Becenév
	- minimum 3 karakter
	- maximum 24 karakter
	- legalább 1 **alfanumerikus** karakter (a-z, A-Z, 0-9)
	- különleges karakterek NEM engedélyezettek (kiv.  _ .)
- Jelszó megerősítése
	- megegyezik a jelszóval
- Születési dátum
	- maximum 16 év a mai nap előtt
	- minimum 1900.01.01
## Poszt
- Leírás
	- üresen hagyható
	- maximum 255 karakter
	- linkeket talán kiszűrhetné
- Helyszín
	- üresen hagyható
	- maximum 32 karakter
- Képek
	- minimum 1 kép
	- maximum 10 kép
	- csak .png, .jpg, .jpeg, 
- Jármű
	- üresen hagyható
	- csak Car típusú lehet
	- valid listából van kiválasztva
- Event
	- üresen hagyható
	- csak SocialEvent típusú lehet
	- valid listából van kiválasztva
## Reakció
- FIRE
- HEART
- COOL
## Komment
- Szöveg
	- minimum 1 karakter
	- linkek esetleg kiszűrve
	- max. 255 karakter
## Válasz
- Szöveg
	- minimum 1 karakter
	- linkek esetleg kiszűrve
	- max. 255 karakter
## Jármű
- Márka
	- min. 2 karakter
	- max. 32 karakter
	- különleges karakterek NEM engedélyezettek (kiv. szóköz, kötőjel)
- Modell
	- min. 2 karakter
	- max. 32 karakter
	- különleges karakterek NEM engedélyezettek (kiv. szóköz, kötőjel, alsóvonal, csillag)
- Típus
	- enum
		- SEDAN, COUPE, GRANDCOUPE, HATCH, KOMBI, CABRIOLET, PICKUP, ROADSTER, SUV
		- default SEDAN
- Lóerő
	- integer
	- minimum érték 1
	- maximum érték 2000
- Hengerűrtartalom
	- tízszeres szorzóval van elmentve (pl. 16 -> 1.6l)
	- integer
	- minimum érték 1
	- maximum érték 160
- Évjárat
	- integer
	- minimum érték 1908 (a szerény Ford T-modell)
	- maximum érték a jelenlegi év (nem hardcoded)
## Csoport

- Név
	- min. 6 karakter
	- max. 64 karakter
	- különleges karakterek NEM engedélyezettek (kiv. szóköz, kötőjel)
- Leírás
	- kihagyható
	- max. 255 karakter
- Alias
	- kihagyható auto-assignért
	- max. 8 karakter
	- kizárólag betűk
- Banner kép
	- kihagyható
	- érvénes kép URL
	- max 1 kép
- Láthatóság
	- boolean
