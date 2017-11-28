{ALGORITHME : jeu_de_l_oie
//BUT : Reproduire le jeu de l'oie avec pascal, en laissant dans un premier temps le
//joueur choisir le nombre de case qu'il souhaite avancer, puis rendre les dés
//aléatoires.
//ENTREE : le nombre de case à avancer dans le premier cas et le passage du tour dans l'autre.
//SORTIE : le numéro de la case et son potentiel effet

const
	derniereCase <- 66 : ENTIER
	caseMort <- 58 :ENTIER
var
	place, de1, de2 : ENTIER

DEBUT
	randomize //Randomize sert à ce que le random ne donne pas le même résultat à chaque fois
	ECRIRE "Bienvenu dans le jeu de l'oie"
	place <- 0
	TANT QUE (place <> derniereCase) FAIRE
		de1 <- random(6+1)//+1 car ça part de 0 et prend 6 chiffres
		de2 <- random(6+1)
		place <- place + de1 + de2
		ECRIRE place
		SI (place MOD 9 = 0) ET (place <> 63) ET (place < 66) ALORS //S'il tombe sur une case multiple de 9 sauf 63, son déplacement est doublé
			place <- place + de1 + de2
			ECRIRE place
		FINSI
		SI (place = caseMort) ALORS//s'il tombe sur la case mort, il retourne au départ
			place <- 0
			ECRIRE place
		FINSI
		SI (place > derniereCase) ALORS //Si le lancer du dé dépasse la dernière case, le joueur doit retourner du nombre de case restante en arrière
			place <- derniereCase - (place - derniereCase)
			ECRIRE place
		FINSI
	FINTANTQUE
	ECRIRE "Vous avez gagné"
FIN}

program jeu_de_l_oie;

uses crt;

const
	derniereCase = 66;
	caseMort = 58;
var
	place, de1, de2 : integer;

begin
	clrscr;
	randomize; //Randomize sert à ce que le random ne donne pas le même résultat à chaque fois
	writeln('Bienvenu dans ke jeu de l''oie');
	place := 0;
	while (place <> derniereCase) do
	begin
		de1 := random(6) + 1; //+1 car ça part de 0 et prend 6 chiffres
		de2 := random(6) + 1;
		place := place + de1 + de2;
		writeln(place);
		if (place MOD 9 = 0) and (place <> 63) and (place < 66) then //S'il tombe sur une case multiple de 9 sauf 63, son déplacement est doublé
		begin
			place := place + de1 + de2;
			writeln(place);
		end;
		if (place = caseMort) then//s'il tombe sur la case mort, il retourne au départ
		begin
			place := 0;
			writeln(place);
		end;
		if (place > derniereCase) then //Si le lancer du dé dépasse la dernière case, le joueur doit retourner du nombre de case restante en arrière
		begin	
			place := derniereCase - (place - derniereCase);
			writeln(place);
		end;
		de1 := 0;
		de2 := 0;
		readln;
	end;
	writeln('Vous avez gagné');
	readln;
end.
	