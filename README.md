# 1d-piskvorky

## Pravidla

* 1d piškvorky se hrají na jednom řádku dlouhém 20 polí.
* Hráči střídavě pokládají své kameny (X a O) do řádku.
* Vyhrává hráč, který první položí 3 kameny vedle sebe.

## Zadání úkolu

* Implementujte třídy popsané níže.
* Použijte Test / Behaviour Driven Development.
* Volba testovací knihovny není omezena.
* Všimněte si, jak vás testy vedou či omezují.

## Třídy

### Game - [game.rb](game.rb)

Udržuje stav hry a slouží jako interface pro ovládání.

### Player - [player.rb](player.rb)

Provadí tah na základě předané hry (Game).

### ComputerPlayer - [computer_player.rb](computer_player.rb)

Dědí z Player a obsahuje logiku pro odehrání tahu.

### HumanPlayer - [human_player.rb](human_player.rb)

Dědí z Player a obsahuje kód pro získání tahu od hráče.
