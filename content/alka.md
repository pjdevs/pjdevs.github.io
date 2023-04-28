+++
title = "ALKA"
date = "2023-01-01"
description = "A 3D online co-op PvE FPS made in collaboration with multiple universities in Québec"

[extra]
index = 0
img = "alka.jpg"
skills = ["Unreal Engine", "C++"]
+++

<iframe src="https://www.youtube.com/embed/_pX1EpqLWC4" title="Alka" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

## Description

ALKA is an online multiplayer game where 2 to 4 players take control of armed drones whose duty is to eliminate an infection spreading in a bunger after the humanity has disappeared. They will have to destroyed nodes of infection which are protected by various enemies.

## Project overview

ALKA began its development during the winter 2022 semester. Students from UQAC, NAD-UQAC and UdeM started to develop the first prototype of the game.
Then, our team continued the developement during fall, winter and spring 2022.
<a href="https://uqac.itch.io/alka" target="_blank">See first prototype</a>

Our team worked on the project during two quarters. The first was a pre-production phase and the second a production phase.
We were in an every-day collaboration with the artists during the production phase after some prototyping.

We had an Agile workflow with Sprint Reviews and Build Reviews once a week and every two weeks. Moreover, tasks were distributed with tickets on a Kanban like board. Each task had <span style="color:gold">Gold</span>, <span style="color:silver">Silver</span>, <span style="color:maroon">Bronze</span> steps to validate a certain level of *polish* for each one.

## My contribution to the project

I spent the main part of the development working on the new system currency system *"Creep Units"* in tandem with the new store *"Alchemy Lab"*
which will let players revive others and buy weapons and abilities.

### Currency system

A new featured was designed by our team during the prototyping phase. Players should be able to loot currency on the existing and future ennemies in the game, grab them, drop it and use it in the Lab. Players can carry one type at a time among 4 planned types of currency (Fire, Water, Wind, Earth) like a tank/stack.

#### Loot Component

This Actor Component is a generic piece of code to loot/spawn anything. It is designed to be generic and not specific to currencies, that way future temas will be able to reuse it if needed. It provides a simple functionnality <span class="code">Loot</span> which owners of the component are responsible to call **server side**.

Given a list of *loot entries*, a probality and a radius it simply spawns all actors around the owner.

![Creep Units](/img/alka_loot_code.png)

In our game, this component was placed inside the <span class="code">MasterEnnemy</span> class, and the <span class="code">Loot</span> was triggered on destroy of the Actor. This way, all existing and future ennemies could directly drop the currencies.

#### Creep Unit

A base <span class="code">CreepUnit</span> Actor was created to put inside the LootComponent. It contained all common behavior to all currencies (spawn on the ground, grabbed by the player, lifetime, ...) and then had been *subclassed* to create all creep unit types.

The main thing to keep in mind here is that all *collisions* checks, *spawns*, *destroys*, and *changes* in the PlayerState (number of creep unit of each types) had to be done on the **server** and then be replicated to avoid cheating and ensure a good networking.

![Creep Units](/img/alka_cu.png)

A debug tool was also programmed to let artists and designers spawn as many currencies as they wanted anywhere.

### Unreal Player State

The PlayerState present in Unreal framework was largely used to keep track of each creep unit count, the current type carried and the maximum amount that can be carried.
This is where each event occured when the current type or the stack count changed to update all concerned UI.
This properties was replicated with *OnRepNotify* behavior of Unreal in C++ allowing to trigger events client side after replication.

### Integration into the Lab UI and player HUD

After adding this features, I had to integrate them into the already made UI of the lab and of the HUD.
Thanks to all the events it was easy to sync the UI according to all players' state.

First the Lab :

![Alchemy Lab](/img/alka_lab.png)

![Alchemy Lab UI](/img/alka_lab_ui.png)

Then the creep unit stack HUD (with one color for each type) :

![Alchemy Lab UI Fire](/img/alka_cu_ui_fire.png)

![Alchemy Lab UI Wind](/img/alka_cu_ui_wind.png)

## Technical and Design challenges

This project was full of challenges which allowed me to increase my skills!

### Online multiplayer game

ALKA was my first multiplayer game programming experience and my first Unreal Engine project at the same time. I had to learn the basics of the engine in a short pre-production period to be ready and efficient during the production. Moreover, programming a multiplayer game increases the complexity of development. As a first time, it was a challenge to have the Client/Server/RPC mindset. This was very instructive and I learned various things on Unreal Engine and networking inside of it.

In particular, as part of my work, I had to make sure that every spawning, dropping, inventory like states (how much currencies in the lab? how much on each player?) and events (my currency count changed, I dropped currencies inside the lab, ...) were properly replicated across all client and on the coherent one the server. Indeed, P2P was even harder because you have to keep in mind that the server is also a client/player.

Eventually, I am now confident about getting involved in a new mutliplayer project if needed!

### Adaptation to a project already started with a new team

When we joined the team, the project was already in a decent state. Moreover, all programmers (except one) and artists were new to the project.
This led to a certain adaptation time to a consequent C++ code base and to the Agile worlfow with this particular team.
I had to analyze all part of the code (C++ and some Blueprints) to ensure I understood the code and I could  makes required changes without breaking any existing behavior.

### Collaboration with multiple universities

ALKA is a game developed in collaboration with 3 universities (programmers, artists/designers, sound designers). This collaboration brings couple difficulties, such as the distance which leads in a less easy communication. The team managed to communicate efficiently but it is always harder to share ideas an opinions this way than in a face-to-face meeting.

## Credits

#### Supervisors

- Yannick Francillette (DIM)
- Kevin Lavigne-Bourque (NAD)
- Pierre Tousignant (NAD)

#### Programmers (DIM)

- Adrien Garbani
- Clément Chastaingt
- Jean-Sébastien Boutin
- Léonard Rizzo
- Marc-Antoine Lebel
- Samuel Potvin
- Thomas Bergeron
- Patrick McRea-Desjardins
- Eli Lapointe
- Minh-Qhan Bui
- Pierre-Jean Morel

#### Artists (NAD)

- Alexandre Bonin
- Cyril Beze
- Émilie Lavoie
- Issam Aloulou
- Jérémie Auclair
- Julien Berthier
- Qian Ting Zhang
- Vincent Gagnon
- Karîm Désir
- William van Herck
- Laurence Cloutier
- Félix Lemonde-Champagne
- Hugo Babin
- Alexandre Mignot
- Vincent Dupéron
- Virginie Juteau
- François Chiasson
- Samuel Gauthier Cyr
- Natalya Fedorenko
- Nickolas Ménard
- Alexandre Ruel

#### Musicians and Sound Designers (UdeM)

- Evan Burman
- David Caron-Proulx
- Eliazer Kramer
- Frédérique Le Duc-Moreau
- Antoine Lussier
- Rémi Sève
