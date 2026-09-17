# KERNEL KRASH 🖥️

## Play the first prototype

1. Download [Godot 4](https://godotengine.org/download/windows/) and extract it.
2. Open Godot, choose **Import**, and select this repository's `project.godot` file.
3. Press **F6** to run the open scene or **F5** to run the project.

Click an empty grid tile to build a Firewall for 50 Data. It automatically shoots nearby viruses. Defeated viruses earn 10 Data; defend the CPU through increasing waves. Press **R** to restart after a loss. This is an early prototype with placeholder shapes; the towers, enemies, art, and events described below are planned features.

The first scene is `scenes/main/main.tscn`, and its game logic is in `scripts/managers/game.gd`. The viewport is 1280×720. The old roadmap dates below are historical planning notes.

> **A hyper-focused, single-screen tower defense game built in Godot.**
> > Protect the CPU core from waves of digital Virus enemies on a fixed grid.
> >
> > **Status:** 🚧 Early Access – Active Development
> > **Engine:** Godot 4 | **Art Style:** 8-bit, 16×16 / 32×32 px sprites | **Palette:** Neon Cyan, Magenta, Yellow on Black
> >
> > ---
> >
> > ## 🎮 Core Concept
> >
> > Protect the Central Processing Unit (CPU) core from incoming waves of digital threats ("Viruses") on a fixed, non-rotational grid. Every tile an enemy passes over becomes **Corrupted**, reducing any tower placed on it by 25% fire rate — forcing constant strategic recalculation.
> >
> > ---
> >
> > ## 🏗️ Project Structure
> >
> > ```
> > KERNEL-KRASH/
> > ├── scenes/          # Godot scene files (.tscn)
> > │   ├── main/        # Main game scene, CPU core
> > │   ├── towers/      # Firewall, Defragmenter, EMP, ByteMiner
> > │   ├── enemies/     # Swarmers, Tanks, Skippers
> > │   └── ui/          # HUD, shop, popups
> > ├── scripts/         # GDScript files (.gd)
> > │   ├── managers/    # WaveManager, ResourceManager
> > │   ├── towers/
> > │   ├── enemies/
> > │   └── ui/
> > ├── assets/
> > │   ├── sprites/     # 8-bit pixel art
> > │   ├── audio/       # SFX and music
> > │   └── fonts/
> > └── docs/            # Design documents, roadmap
> > ```
> >
> > ---
> >
> > ## 🗼 Towers
> >
> > | Tower | Role | Special |
> > |-------|------|---------|
> > | **Firewall** | High fire rate, low damage | Best vs Swarmers |
> > | **Defragmenter** | Long range, high damage | Targets highest-HP enemy |
> > | **EMP Emitter** | AOE stun | Essential for dense waves |
> > | **ByteMiner** | Economy | Generates Data Fragments passively |
> >
> > Each tower has **2 upgrade tiers** unlockable via the Code Injection mini-game.
> >
> > ---
> >
> > ## 👾 Enemies
> >
> > | Enemy | Speed | HP | Special |
> > |-------|-------|----|---------|
> > | **Swarmers** | Fast | Low | Numerous, basic threat |
> > | **Tanks** | Slow | High | Blocks line-of-sight for towers behind them |
> > | **Skippers** | Very Fast | Medium | Reduced AOE damage taken |
> >
> > ### Boss: Trojan Horse
> > High HP boss that spawns "packet" minions at towers (triggering Pop-up Crisis events). On defeat, releases a final high-speed mini-boss charge.
> >
> > ---
> >
> > ## ⚙️ Core Mechanics
> >
> > ### System Corruption
> > Tiles that enemies walk over become **Corrupted** — towers placed on corrupted tiles suffer a **25% fire rate penalty**.
> >
> > ### Data Fragments (Currency)
> > Earned by defeating enemies. Used to buy towers, upgrades, and items.
> >
> > ### System Overload (Ability)
> > Global slow on all enemies. Temporary. High cost.
> >
> > ### Code Injection Challenge (Tower Upgrade)
> > A timed command prompt popup appears. Type the randomized pseudo-code within **5 seconds** to upgrade a tower.
> > - ✅ **Success:** Tower upgrades
> > - - ❌ **Fail:** Tower gets a 'Bug' debuff — 50% reduced damage & fire rate for 10 seconds
> >  
> >   - ### Pop-up Crisis (Boss Ability)
> >   - Small popups spawn around a tower. Click them in time or the tower gets stunned (Windows BSOD sprite shown).
> >  
> >   - ### Debug Challenge
> >   - A UI lockout event — pick the correct pseudo-code syntax from 4 options or your shop is temporarily locked.
> >  
> >   - ---
> >
> > ## 🛒 Items (Shop)
> >
> > | Item | Effect |
> > |------|--------|
> > | **Anti-Virus** | Removes debuffs from towers in a 5-tile cross radius |
> > | **New RAM** | Towers in a 3-tile horizontal row attack 2× faster for 5s |
> > | **Defrag Cache** | Instantly clears ALL Corrupted tiles on the map |
> > | **Overclock Chip** | One tower deals 100% bonus damage for 3 seconds |
> >
> > ---
> >
> > ## 🗓️ 11-Week Development Roadmap (May 29 – Aug 10)
> >
> > | Week | Dates | Nadeem (Structural/Economy/UI) | Jesse (Combat/Mechanics/Content) |
> > |------|-------|-------------------------------|----------------------------------|
> > | **1** | May 29 – Jun 4 | Initialize Godot project & Git repo. Set up CPU core scene. | Set up TileMap grid & coordinate system. Import placeholder 8-bit assets. |
> > | **2** | Jun 5 – Jun 11 | Set up A* pathfinding environment & define enemy path nodes. | Implement Swarmer enemy scene & navigation logic. |
> > | **3** | Jun 12 – Jun 18 | Implement tower placement logic (input detection, no overlap). | Develop basic Firewall tower scene (instancing, target detection). |
> > | **4** | Jun 19 – Jun 25 | Implement projectile logic (movement, collision, damage calc). | Build Wave Manager & enemy health/death logic. |
> > | **5** | Jun 26 – Jul 2 | Design & implement primary UI (currency display, buy buttons). Data Fragments resource system. | Develop ByteMiner economy tower & resource generation. |
> > | **6** | Jul 3 – Jul 9 | Implement tile-flagging logic for Corrupted status. | Implement 25% fire rate debuff on towers on Corrupted tiles. |
> > | **7** | Jul 10 – Jul 16 | Implement Defragmenter tower (long range, targets highest HP). | Implement EMP Emitter tower (AOE stun). |
> > | **8** | Jul 17 – Jul 23 | Design & implement Code Injection popup UI & timer logic. | Implement Code Injection logic (random string gen, input check, consequences). |
> > | **9** | Jul 24 – Jul 30 | Implement Tank enemy (line-of-sight blocking). | Implement Skipper enemy (fast, AOE resistance). Balance waves. |
> > | **10** | Jul 31 – Aug 6 | Implement System Overload ability. Integrate SFX. | Art polish (final sprites/animations) & bug fixing. |
> > | **11** | Aug 7 – Aug 10 | Final build testing & release package prep. | Documentation & post-launch roadmap (Crisis Challenges). |
> >
> > ---
> >
> > ## ✅ Week 1 Checklist — Nadeem (May 29 – Jun 4)
> >
> > > **Goal: Initialize the Godot project and Git repository, and set up the CPU core scene.**
> > >
> > > - [ ] Install Godot 4 (latest stable)
> > > - [ ] - [ ] Create new Godot project named `KERNEL-KRASH`
> > > - [ ] - [ ] Initialize local Git repository inside the Godot project folder
> > > - [ ] - [ ] Connect local repo to this GitHub remote (`git remote add origin https://github.com/Nouh-jpg/GRIDLOCK-84.git`)
> > > - [ ] - [ ] Create the following folder structure in the Godot project: `scenes/`, `scripts/`, `assets/sprites/`, `assets/audio/`, `docs/`
> > > - [ ] - [ ] Create the main game scene (`main.tscn`) with a `Node2D` root node
> > > - [ ] - [ ] Add a placeholder **CPU Core** node to the main scene (can be a `ColorRect` or `Sprite2D` with a neon cyan square for now)
> > > - [ ] - [ ] Position the CPU Core at the center/end of where the enemy path will terminate
> > > - [ ] - [ ] Set the Godot project's window size to **640×360** (or **1280×720**) for the 8-bit layout
> > > - [ ] - [ ] Make the first commit: `git commit -m "Week 1: Project init, folder structure, CPU core scene"`
> > > - [ ] - [ ] Push to GitHub main branch
> > >
> > > - [ ] ---
> > >
> > > - [ ] ## 🤝 Contributors
> > >
> > > - [ ] | Name | Role |
> > > - [ ] |------|------|
> > > - [ ] | **Nadeem (Nouh-jpg)** | Structural / Economy / UI |
> > > - [ ] | **Jesse** | Combat / Mechanics / Content |
> > >
> > > - [ ] ---
> > >
> > > - [ ] ## 📋 Post-Launch Roadmap (Future Updates)
> > >
> > > - [ ] - Pop-up Crisis Challenge (Boss ability, full implementation)
> > > - [ ] - Debug Challenge mini-game (full implementation)
> > > - [ ] - Additional enemy types and boss variants
> > > - [ ] - More tower types and upgrade paths
> > > - [ ] - Level editor / multiple maps
> > > - [ ] - Leaderboard & high score system
> > >
> > > - [ ] ---
> > >
> > > - [ ] *KERNEL KRASH — Early Access. Built with ❤️ in Godot.*
