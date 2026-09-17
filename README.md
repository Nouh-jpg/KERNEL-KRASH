# KERNEL KRASH 🖥️

## Play the first prototype

1. Download [Godot 4](https://godotengine.org/download/windows/) and extract it.
2. Open Godot, choose **Import**, and select this repository's `project.godot` file.
3. Press **F5** to run the project.

Click an empty grid tile to build a Firewall for 50 Data. It automatically shoots nearby viruses. Defeated viruses earn 10 Data; defend the CPU through increasing waves. Press **R** to restart after a loss. This is an early prototype with placeholder shapes; the towers, enemies, art, and events described below are planned features.

The first scene is `scenes/main/main.tscn`, and its game logic is in `scripts/managers/game.gd`. The viewport is 1280×720. The roadmap dates below are historical planning notes.


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
> > **Progress checked September 16, 2026.** These are the original 2026 planning dates, not current deadlines. The playable prototype uses drawn placeholder shapes and one script; items described as scenes or separate managers below still need that structure.
> >
> > | Week | Original dates | Nadeem (structure, economy, UI) | Jesse (combat, mechanics, content) | Progress |
> > |------|----------------|----------------------------------|-------------------------------------|----------|
> > | **1** | May 29 – Jun 4 | Godot project, Git repo, CPU core | Grid and placeholder visuals | **Partly done:** Project, repo, grid and core exist; TileMap and pixel art are pending. |
> > | **2** | Jun 5 – Jun 11 | Enemy path setup | Basic enemy movement | **Partly done:** One fixed path and moving virus placeholders exist; A* and enemy scenes are pending. |
> > | **3** | Jun 12 – Jun 18 | Tower placement and no overlap | Firewall targeting | **Partly done:** Click placement and automatic targeting work; a reusable tower scene is pending. |
> > | **4** | Jun 19 – Jun 25 | Projectile damage | Waves and enemy health | **Partly done:** Visual shots, damage, health and waves work in one script; separate systems are pending. |
> > | **5** | Jun 26 – Jul 2 | Data display and shop UI | ByteMiner economy tower | **Partly done:** Data rewards and Firewall cost display work; shop buttons and ByteMiner are pending. |
> > | **6** | Jul 3 – Jul 9 | Corrupted tile flags | 25% tower fire-rate penalty | **Not started.** |
> > | **7** | Jul 10 – Jul 16 | Defragmenter tower | EMP Emitter tower | **Not started.** |
> > | **8** | Jul 17 – Jul 23 | Code Injection UI and timer | Upgrade logic and consequences | **Not started.** |
> > | **9** | Jul 24 – Jul 30 | Tank enemy | Skipper enemy and wave balance | **Not started.** |
> > | **10** | Jul 31 – Aug 6 | System Overload and sound | Art polish and bug fixes | **Not started.** |
> > | **11** | Aug 7 – Aug 10 | Build testing and release package | Documentation and future challenges | **Not started:** Playable prototype only; no release build. |
> >
> > **Next three steps:** (1) Move the prototype's enemies, towers, waves and currency into reusable Godot scenes/scripts. (2) Add corrupted tiles and their 25% fire-rate penalty. (3) Add the remaining towers and enemies, then playtest and rebalance waves.
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
