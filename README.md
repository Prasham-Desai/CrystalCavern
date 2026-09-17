# CrystalCavern

A challenging vehicle controller and navigation game built in Unreal Engine 5.

## 📝 Game Description
CrystalCavern is a physics-driven vehicle control and navigation experience where you must maneuver through intricate environments. Master your vehicle's handling to explore the cavernous terrain, overcome difficult obstacles, and reach your destination safely.

## 📸 Screenshots

<img src="ScreenShots/Screenshot%202026-06-25%20195707.png" width="800">
<img src="ScreenShots/Screenshot%202026-06-25%20195748.png" width="800">

## 🎮 Controls
- **W, A, S, D** / **Arrow Keys**: Accelerate, Brake, and Steer
- **Spacebar**: Handbrake
- **C**: Toggle Camera View
- **Escape / P**: Pause Game

*(Note: Adjust these controls based on your specific final input mappings in Unreal Engine)*

## 🛠️ How It Was Made (Development Details)
CrystalCavern is a **Blueprint** project developed in **Unreal Engine 5**, demonstrating the power and flexibility of UE5's visual scripting and physics systems. It focuses on robust vehicle mechanics and environmental navigation.

### Key Systems & Technologies Used:
- **Core Engine Features**:
  - Built entirely using **Unreal Engine 5's Blueprint Visual Scripting**, handling the vehicle setup, physics interactions, and navigation logic.
  - Utilizes the **Enhanced Input System** (standard in modern UE5) for responsive and configurable player controls, allowing for precise vehicle handling.
- **Player Mechanics**:
  - The player pawn is built around Unreal's vehicle simulation (such as the Chaos Vehicle system), leveraging realistic suspension, friction, and tire modeling.
  - Custom camera logic provides dynamic follow cams that adjust to the vehicle's speed and orientation to give a strong sense of scale and momentum.
- **Environment & Navigation**:
  - Complex cavern environments built with high-fidelity meshes and collision boundaries designed to test driving skill and spatial awareness.
  - Navigation elements guide the player through the labyrinthine paths, requiring careful maneuvering.
- **Assets & Rendering**:
  - Leverages UE5's advanced rendering pipeline, including **Lumen**, for stunning dynamic lighting and reflections that bring the crystalline environments to life.

## ⚙️ How It Works (Gameplay Loop)
- **Game Loop**: The game tasks the player with navigating from a starting point to specific objectives across various terrain challenges. As you progress, the terrain becomes more treacherous, demanding finer vehicle control.
- **Scoring/Progression**: Completing routes efficiently, avoiding major crashes, and mastering the vehicle's handling to overcome the cavern's natural obstacles.

---

<div align="center">
<sub>Built with &#x2764;&#xFE0F; using Unreal Engine 5</sub>
<br><br>
<img src="ScreenShots/github-readme-banner.svg" alt="Creator Signature Banner"/>
</div>
