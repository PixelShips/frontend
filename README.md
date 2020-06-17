# pixel_ships

Dokumentacja projektu

Identyfikacja zagadnienia biznesowego (problemu)
Jedną z najpopularniejszych gier w historii jest gra w statki. Wynaleziona na początku XX wieku wciąż przyciąga wielu graczy czy to w formie planszowej (papier) czy cyfrowej. Jej proste zasady zachęcają do gry nawet najmłodszych. Patrząc na rynek mamy jednak wrażenie, że prostota gry jest zarówno jej zaletą jak i wadą dlatego chcielibyśmy wykorzystać możliwości cyfrowe i rozbudować działanie gry. Naszym celem jest powiększenie planszy do największej możliwej dla obu graczy (jak największe pokrycie ekranu) bez równoczesnego podziału na małe kwadraty znanego z obecnych implementacji. Większa niepodzielna plansza pozwoli też na ustawienia okrętów w dowolny sposób na mapie (położenie X, Y a także kąt obrotu). Sprawi to, że wygranie z przeciwnikiem będzie jeszcze trudniejszym wyzwaniem a także zapewni dłuższy czas rozgrywki i emocji. Zwiększymy też możliwości ataków, które będą różnorodne (siła - czym większa tym większy obszar będzie narażony na uszkodzenie statku).

Wymagania systemowe i funkcjonalne
Aplikacja zostanie napisana w modelu MVC. Część frontendowa zostanie napisana w technologii Flutter. Wybraliśmy ją, ponieważ możemy stworzyć za pomocą jednego kodu aplikację na niemal wszystkie najpopularniejsze platformy wliczając Android, iOS, macOS, Windows oraz web. Skupimy się na dostarczeniu rozwiązania aplikacji mobilnej ale wybór technologii pozwoli nam na łatwy deployment aplikacji na inne platformy. Przewagą tej technologii nad innymi bardziej popularnymi jest: 
użycie jednego tego samego kodu na wszystkie platformy jednocześnie.
wydajność aplikacji mobilnych na iOS i Android zbliżona do rozwiązań natywnych dla obu tych platform (wyższa niż w rozwiązaniach opartych na JavaScript).
oszczędność czasu potrzebna do stworzenia interfejsu użytkownika
zintegrowane środowisko do testowania i debugowania aplikacji.
duże wsparcie twórcy technologii czyli Google.
Do obsługi logowania i zarządzania uwierzytelnianiem wykorzystamy gotowe rozwiązanie platformy Firebase, ze względu na większe bezpieczeństwo i znaczne skrócenie czasu tworzenia takiego rozwiązania w przypadku jego implementacji od podstaw.

Backend aplikacji stworzymy w node.js wykorzystując framework Nest.js z natywnym wsparciem TypeScript. Gra będzie typu multiplayer oparta na websocketach aby zapewnić jej dwukierunkową komunikację realtime. Wyniki poszczególnych gier, ranking graczy czy też ewentualne odtwarzanie partii z przeszłości będą zapisywane w bazie MongoDB. Pozwoli to na zapisywanie danych o dowolnej strukturze i przeniesienie większej odpowiedzialności na programistę.

C. Harmonogram prac i zespół projektowy.

https://ibb.co/xmDh2Wj

Przygotowaliśmy wykres Gantta obrazujący postęp prac i plan projektu. W skład naszego zespołu wchodzą: 
Wojciech Chrobak odpowiedzialny za część backendową aplkacji
Mateusz Rus odpowiedzialny za część frontendową

Etapy:
Rozpoczęcie projektu i ustalanie wymagań
	Zadania:
Zebranie wymagań dotyczących aplikacji tj. ustalenie problemu biznesowego, wyszukanie grupy potencjalnych odbiorców, sprawdzenie konkurencyjnych produktów o podobnej tematyce. 
Wykonanie - cały zespół
Kamień milowy - Ustalenie potrzebnych wymagań 
Rozpoczęcie pracy nad poprawną architekturą aplikacji (specyfikacją) odpowiadającej postawionym wymaganiom.
Zadania:
Ustalenie technologii użytej do zbudowania UI sprawdzenie potencjalnych możliwości i dopasowanie do potencjalnych odbiorców oraz urządzeń, z których będą korzystali - wykonanie Mateusz Rus
Ustalenie technologii użytej do zbudowania backendu aplikacji biorąc pod uwagę komunikację klient serwer w czasie rzeczywistym oraz wybranie bazy danych spełniającej postawione wymagania - wykonanie Wojciech Chrobak
	Kamień milowy - ustalenie pełnej architektury aplikacji

Dewelopment aplikacji.
Zadania:
Mateusz Rus:
zbudowanie podstawowego ekranu logowania
zbudowanie wstępnej planszy do gry
	Wojciech Chrobak:
zbudowanie logiki logowania
	Kamień milowy 1 - wersja beta, Podstawowy kod funkcjonalny aplikacji zawierający logowanie i wstępną wizję planszy gry.
	Mateusz Rus:
	      -     zbudowanie planszy gry.
	     -     połączenie klient-klient za pomocą websocketów
	     -     zbudowanie pozostałej logiki gry
Wojciech Chrobak:
obsluga websocket
obsluga interakcji uzytkowników
zapisywanie wyników gier do bazy
	Kamień milowy 2 - wersja finalna z zaimplementowanymi funkcjonalnościami gotowa do testowania.
Stabilizacja aplikacji 
Zadania:
testowanie i naprawa błędów po stronie frontendu - Mateusz Rus
testowanie i naprawa błędów po stronie backendu - Wojciech Chrobak

D.  Analiza i modelowanie.
![Analiza i modelowanie](https://ibb.co/47T0gS8)


Frontend - podstawowy schemat  klas:
![FrontEnd](https://ibb.co/FmqgNkv)


Backend - podstawowy schemat klas


