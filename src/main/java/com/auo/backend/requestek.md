# Requestek, amik kellenek, és a responseok

Adminként mindent lehet látni, törölni, módosítani, stb...

# User

- saját profil
  - 
    - (id)
    - username
    - nickname
    - date of birth
    - email
    - isPublic
    - profile_img
    - bio
    - date of signup
- felhasználóként más user
    -
  - (id)
  - username
  - nickname
  - isPublic
  - profile_img
  - bio
  - date of signup

# Connections

- Privát profil: követőknek látható
- publikus: {Following:[], Followers:[]}

# Vehicles

- Privát profilon is látszik
- user összes autója (csak nevek, id, hp)
- user egy autója

# Groups

- Ha publikus ha nem, az összes adatot megkapjuk a táblából

- Posztok:
  - 
  - Nyilvános csoport: összes (relevancia szerinti lekérdezés, 1 request 10 poszt?, görgetéssel többet lekérdez)
  - Privát csoport: ugyanaz, csak tagoknak, ha nem tag semmit nem kap

- Események:
  - 
  -  