Program Bataille_navale;
uses crt;

CONST
	 Effectif=6;
	 BatteauT3=3;
	
Type EnregPlace=Record
	 Ligne:integer;
	 Colonne:Char;
End;
Type EnregPlace2=Record
	 Ligne:integer;
	 Colonne:Char;
End;
Type Tabl=Array[1..10] of EnregPlace;
Type Tabl2=Array[1..10] of EnregPlace2;
Type Bateau=Record
	 Cases:Array [1..10] of EnregPlace;
End;
Type TablFlotteJ1=Array[1..10] of Bateau;
Type TablFlotteJ2=Array[1..10] of Bateau;
Type TabBool=Array [1..10] of Boolean;

Procedure PlaceBateau(VAR T1:Tabl);
VAR
	i:integer;

Begin
	For i:=1 to BatteauT3 do
				Begin
					Writeln('Entrez les coordonees de votre bateau de 3 cases comme ceci : A3 (Entree) : ',i);
					Readln(T1[i].Colonne,T1[i].Ligne);
				End;
				Write('Vous avez poser un bateau en : ',T1[1].Colonne,T1[1].Ligne,T1[2].Colonne,T1[2].Ligne,T1[3].Colonne,T1[3].Ligne);
				Readln;
				clrscr;
End;

Procedure PlaceBateau2(VAR T1:Tabl);
VAR
	i:integer;
Begin
	For i:=4 to 5 do
				Begin
					Writeln('Entrez les coordonees de votre bateau de 2 cases comme ceci : A3 (Entree) : ',i);
					Readln(T1[i].Colonne,T1[i].Ligne);
				End;
			Write('Vous avez posez un bateau en : ',T1[4].Colonne,T1[4].Ligne,T1[5].Colonne,T1[5].Ligne);
			Readln;
			clrscr;
End;

Procedure PlaceBateau3(VAR T1:Tabl);
VAR
	i:integer;

Begin
	For i:=6 to 6 do
		Begin
			Writeln('Entrez les coordonees de votre bateau de 1 cases comme ceci : A3 (Entree)');
			Readln(T1[i].Colonne,T1[i].Ligne);
		End;
	Write('Vous avez poser un bateau en : ',T1[6].Colonne,T1[6].Ligne);
	Readln;
	clrscr;
End;

Procedure PlaceBateauJ2(VAR T2:Tabl2);
VAR
	i:integer;

Begin
	For i:=1 to 3 do
				Begin
					Writeln('Entrez les coordonees de votre bateau de 3 cases comme ceci : A3 (Entree) : ',i);
					Readln(T2[i].Colonne,T2[i].Ligne);
				End;
				Write('Vous avez poser un bateau en : ',T2[1].Colonne,T2[1].Ligne,T2[2].Colonne,T2[2].Ligne,T2[3].Colonne,T2[3].Ligne);
				Readln;
				clrscr;
End;

Procedure PlaceBateau2J2(VAR T2:Tabl2);
VAR
	i:integer;
Begin
	For i:=4 to 5 do
				Begin
					Writeln('Entrez les coordonees de votre bateau de 2 cases comme ceci : A3 (Entree) : ',i);
					Readln(T2[i].Colonne,T2[i].Ligne);
				End;
			Write('Vous avez poser un bateau en : ',T2[4].Colonne,T2[4].Ligne,T2[5].Colonne,T2[5].Ligne);
			Readln;
			clrscr;
End;

Procedure PlaceBateau3J2(VAR T2:Tabl2);
VAR
	i:integer;

Begin
	For i:=6 to 6 do
		Begin
			Writeln('Entrez les coordonees de votre bateau de 1 cases comme ceci : A3 (Entree)');
			Readln(T2[i].Colonne,T2[i].Ligne);
		End;
	Write('Vous avez poser un bateau en : ',T2[6].Colonne,T2[6].Ligne);
	Readln;
	clrscr;
End;

Procedure FlotteJ1 (VAR T1:Tabl);
Var
	i:integer;
Begin
			Clrscr;
			Writeln('JOUEUR 1');
			PlaceBateau(T1);
			Writeln('JOUEUR 1');
			PlaceBateau2(T1);
			Writeln('JOUEUR 1');
			PlaceBateau3(T1);
	{For i:=1 to Effectif do
		begin
			Write(TFlotteJ1[i].cases);
		End;}
End;

Procedure FlotteJ2 (VAR T2:Tabl2);
Var
	i:integer;
Begin
			Writeln('JOUEUR 2');
			PlaceBateauJ2(T2);
			Writeln('JOUEUR 2');
			PlaceBateau2J2(T2);
			Writeln('JOUEUR 2');
			PlaceBateau3J2(T2);
End;
	
Function FctBool (var T2:Tabl2; var ATKFlotteJ2:TabBool) :Boolean;
var
		i,Nbin:integer;
        NbChar:Char;
Begin
	writeln('JOUEUR 1 : Veuillez entrer la case a laquelle vous voulez attaquer : ');
	readln(NbChar,Nbin);
	For i:=1 to effectif do
		begin
			If (T2[i].Colonne=Nbchar) AND (T2[i].Ligne=Nbin) then
                Begin
					FctBool:=TRUE;
					ATKFlotteJ2[i]:=FctBool;
                End
         	Else FctBool:=FALSE;
		End;
	For i:=1 to effectif do
		Begin
			Write(ATKFlotteJ2[i]);
		End;
	Readln;
End;

Function FctBool2 (var T1:Tabl; var ATKFlotteJ1:TabBool) :Boolean;
Var
		i,Nbin:integer;
        NbChar:Char;
Begin
	writeln('JOUEUR 2 : Veuillez entrer la case a laquelle vous voulez attaquer : ');
	Readln(NbChar,Nbin);
	For i:=1 to effectif do
		begin
			If (T1[i].Colonne=NbChar) AND (T1[i].Ligne=Nbin) then
                begin
					FctBool2:=TRUE;
					ATKFlotteJ1[i]:=FctBool2;
                End
				Else FctBool2:=FALSE;
		End;
	For i:=1 to Effectif do
		Begin
			Write(ATKFlotteJ1[i]);
		End;
	Readln;
End;

VAR
	T1: Array [1..10] of EnregPlace;
	T2: Array [1..10] of EnregPlace2;
	ATKFlotteJ1: Array[1..10] of Boolean;
	ATKFlotteJ2 : Array [1..10] of Boolean;
    TFlotteJ1: Array [1..10] of Bateau;
	TFlotteJ2: Array [1..10] of Bateau;
	
BEGIN
	FlotteJ1(T1);
	FlotteJ2(T2);
	Repeat
	begin
		fctBool(T2,ATKFlotteJ2);
		fctBool2(T1,ATKFlotteJ1);
	End;
	until (ATKFlotteJ1[1]=TRUE AND ATKFlotteJ1[2]=TRUE AND ATKFlotteJ1[3]=TRUE AND ATKFlotteJ1[4]=TRUE AND ATKFlotteJ1[5]=TRUE) XOR (ATKFlotteJ2[1]=TRUE AND ATKFlotteJ2[2]=TRUE AND ATKFlotteJ2[3]=TRUE AND ATKFlotteJ2[4]=TRUE AND ATKFlotteJ2[5]=TRUE);
	Readln;
END.
