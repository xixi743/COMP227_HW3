# COMP227 Game Design
#### Spring 2020 with Professor Chen @ Occidental College

### Homework 3

For this homework assignment we were asked to create a game featuring a farmer as the main character. The farmer grows different kinds of crops. The different kinds of crops will require different amounts of times to ripen. Once a crop is ready to harvest, the character will walk over to the crop and harvest it.

![HWscreenshot2](https://user-images.githubusercontent.com/33335169/79684062-78a72280-81e3-11ea-8c33-595b59c317ee.png)

![HWscreenshot1](https://user-images.githubusercontent.com/33335169/79684049-4f869200-81e3-11ea-9c6a-32e8ab130771.png)

A play through of the game is available here: [https://youtu.be/v8RyI1G3jNU](https://youtu.be/v8RyI1G3jNU).

### Finite State Machine
To manage the autonomous agents, I used a finite state machine.

#### Farmer's States
The farmer's (obj_farmer) finite state machine consists of the following states:
- standstill
- back it up
- wait
- dig
- walk
- plant
- water
- harvest tomatoes
- harvest corn

#### Tools
The farmer uses multiple tools throughout the process of growing his crops.
He can hold the following tools:
- none
- shovel
- seed
- watering can

#### Tool's States
Each of these tools also use finite state machines to manage their states.
Tool states include:
- stop
- idle
- water (unique to watering can)
- dig (unique to shovel)
- plant (unique to seed)

#### Tool Actions & Growing Process
The farmer can only hold one tool at once and completes the growing process in
the following steps:
- digs holes with the shovel
- plants seeds in holes with the seed
- waters seeds with the watering can

Then, the farmer waits for the crops to ripen. The crops planted include tomatoes and corn which both grow through 3 stages (seed, growing, and ripe). The corn takes twice as long to grow, so the farmer collects the ripe tomatoes first when they are ready. When the corn is ripe, the farmer collects the corn as well. When the crops are collected, they turn into coins and the coins disappear.

The game then restarts and the farmer infinitely grows tomatoes and corn until the
user decides that their sick of it and exit the game.


### Asset Credits
#### Visual Assets
- Aztrakatze's Simple Cute Farm (https://aztrakatze.itch.io/simple-cute-farm)
  (I edited some of these assets so they would work better in my game. For example, adding water to the watering can.)
#### Sound Assets
- ProjectsU012's Coins 1 (https://freesound.org/people/ProjectsU012/sounds/341695/)
- Setuniman's easy 1c85f (https://freesound.org/people/Setuniman/sounds/201060/)
