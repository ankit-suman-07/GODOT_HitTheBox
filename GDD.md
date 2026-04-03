# HittheBox – Game Design Document (GDD)

## 1. Overview
**Hit the Box** is a simple reaction-based mini-game where players must quickly click on boxes that randomly appear in one of six holes. The game tests the player’s reflexes and hand-eye coordination, with fast-paced interactions and minimal UI.

---

## 2. Core Gameplay Loop
1. Game starts  
2. A box randomly appears in one of the six holes  
3. Player must click the box before it disappears (0.3 seconds)  
4. If hit → score increases  
5. If missed → no score  
6. Repeat until player restarts or exits  

---

## 3. Game Mechanics

### Hole System
- Total **6 holes** displayed on screen  
- Only **one box appears at a time**  
- Box appears in a **random hole**  

### Box Behavior
- Appears instantly  
- Disappears after **0.3 seconds**  
- Reappears in a new random hole  

### Player Interaction
- Mouse pointer acts as a **hammer**  
- Player clicks on the hole to “hit” the box  
- Click must occur **before box disappears**  

---

## 4. Controls
- **Mouse Click** → Hit box  
- **Restart Button** → Reset game  
- **Exit Button** → Return to main menu  

---

## 5. Scoring System
- +1 point for every successful hit  
- No penalty for missed hits  
- Score reflects player reaction performance  

---

## 6. Feedback & Response

### Visual Feedback
- Box appears/disappears quickly  
- Optional hit feedback (flash or slight animation)  
- Cursor visually represents a hammer  

### Audio Feedback
- **Hammer Sound**
  - Plays on every click (hit or miss)  

---

## 7. Game States
- **Idle** → Waiting to start  
- **Active** → Boxes appearing and player interacting  
- **Restarted** → Game reset  
- **Exit** → Return to main menu  

---

## 8. UI Elements
- 6 hole layout (grid or circular arrangement)  
- Score display  
- Restart button  
- Exit button  
- Custom hammer cursor  

---

## 9. Difficulty & Progression
- Fixed difficulty:
  - Box visible for **0.3 seconds**  
- Optional future scaling:
  - Reduce visibility time  
  - Increase spawn speed  

---

## 10. Technical Notes
- Built using Godot Engine (GDScript)  
- Random hole selection using `RandomNumberGenerator`  
- Timer-based box visibility (`0.3s`)  
- Mouse input used for hit detection  
- Simple state-based logic for game flow  

---

## 11. Future Improvements
- Increasing difficulty over time  
- Combo system for consecutive hits  
- Miss penalty or accuracy tracking  
- Visual animations for hammer impact  
- Sound variations for hits and misses  
- Leaderboard or high score tracking  

---