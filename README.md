# KERNEL KRASH 🖥️

## Play the first prototype

1. Download [Godot 4](https://godotengine.org/download/windows/) and extract it.
2. Open Godot, choose **Import**, and select this repository's `project.godot` file.
3. Press **F5** to run the project.

Click an empty grid tile to build a Firewall for 50 Data. It automatically shoots nearby viruses. Defeated viruses earn 10 Data; defend the CPU through increasing waves. Press **R** to restart after a loss. This is an early prototype with placeholder shapes; the towers, enemies, art, and events described below are planned features.

The first scene is `scenes/main/main.tscn`, and its game logic is in `scripts/managers/game.gd`. The viewport is 1280×720. The updated 11-week plan runs from September 17 to November 29, 2026.


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
> > ## 🗓️ 11-Week Development Roadmap (Sep 17 – Nov 29, 2026)
> >
> > **Starting point (Sep 17):** A playable Godot prototype already has a fixed grid and path, virus waves, one Firewall, Data earned from kills, core health, and restart. The art and several planned systems are still placeholders. Dates below are targets; update each goal when the work is finished.
> >
> > | Week | Target dates | Goal | Done when |
> > |------|--------------|------|-----------|
> > | **1** | Sep 17 – Sep 23 | Organize the prototype into reusable enemy, tower, core, wave and resource scripts/scenes. Keep the current game playable. | The game still opens and plays; the main script no longer owns every system. |
> > | **2** | Sep 24 – Sep 30 | Turn virus placeholders into a Swarmer scene with movement, health and death. Keep a clear fixed route to the CPU. | Swarmers follow the route, show health, and damage the core if they arrive. |
> > | **3** | Oct 1 – Oct 7 | Make Firewall a reusable tower with target detection and visible projectiles. Finish placement rules. | Shots damage enemies; towers cannot be placed on the route or an occupied tile. |
> > | **4** | Oct 8 – Oct 14 | Add a Wave Manager, smoother wave pacing, and clear win/loss/restart feedback. | Five waves can be played from start to finish without a script error. |
> > | **5** | Oct 15 – Oct 21 | Build a simple shop and Data display; add the ByteMiner economy tower. | Players can earn and spend Data, and ByteMiner produces it at a balanced rate. |
> > | **6** | Oct 22 – Oct 28 | Add Corrupted tiles and the planned 25% fire-rate penalty. Show corruption on the grid. | Enemy travel marks tiles; a tower on a corrupted tile fires 25% slower. |
> > | **7** | Oct 29 – Nov 4 | Add Defragmenter and EMP Emitter towers. | Defragmenter picks high-health targets; EMP stuns enemies in an area. |
> > | **8** | Nov 5 – Nov 11 | Add Code Injection tower upgrades, timer, and failure debuff. | A successful challenge upgrades a tower; a failed one applies the planned temporary Bug penalty. |
> > | **9** | Nov 12 – Nov 18 | Add Tank and Skipper enemies, then rebalance waves. | Both enemies behave differently from Swarmers, and later waves remain winnable. |
> > | **10** | Nov 19 – Nov 25 | Add System Overload, key sound effects, and first-pass pixel art; fix playtest issues. | Ability, audio and visuals work in a full playthrough without blocking bugs. |
> > | **11** | Nov 26 – Nov 29 | Test the full game, update instructions, and prepare a release candidate. | A fresh Godot import runs cleanly, the README explains how to play, and a downloadable build is ready to review. |
> >
> > **First action:** Start Week 1 by separating the existing game logic while preserving the playable prototype. Nadeem's planned focus is structure, economy and UI; Jesse's planned focus is combat, mechanics and content. Revisit the schedule at the end of each week and move unfinished work forward before adding new features.
> >
> > ---
> >
## ✅ Week 1 Checklist — project setup (original target: May 29 – Jun 4)

Progress checked September 16, 2026.

- [x] Create the Godot 4 project and connect it to this GitHub repository.
- [x] Add the `scenes/`, `scripts/`, `assets/` and `docs/` folders.
- [x] Create `scenes/main/main.tscn` with a `Node2D` root and cyan `CPUCore` placeholder.
- [x] Set the viewport to 1280×720.
- [x] Commit and publish the playable prototype to the main branch.
- [ ] Replace the drawn grid with a TileMap if the design still needs one.
- [ ] Add pixel art assets in place of placeholder shapes.

---

## 🤝 Contributors

| Name | Planned role |
|------|--------------|
| Nadeem (Nouh-jpg) | Structure, economy, UI |
| Jesse | Combat, mechanics, content |

---

## 📋 Post-Launch Roadmap (Future Updates)

- Pop-up Crisis Challenge (boss ability)
- Debug Challenge mini-game
- Additional enemy types and boss variants
- More tower types and upgrade paths
- Level editor and multiple maps
- Leaderboard and high score system

*KERNEL KRASH — Early Access. Built with ❤️ in Godot.*
