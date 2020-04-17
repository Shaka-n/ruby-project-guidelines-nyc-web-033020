Escaping Quarantine

This is a short terminal-based adventure about getting outside during a quarantine. The player navigates the game world by inputting commands through the number keys and by typing responses to prompts (i.e. 'yes' or 'no'). The core gameplay loop is to walk into a room and to search the furniture until the player finds both a 'mask' item and a 'gloves' item. Once the player has found both items, they can navigate to the front door and walk outside. At that point, their score is determined by the number of moves they needed to complete the game. Their score is saved and added to a permanent highscore roster, and the game ends.

Installation

Download the game files, from the main game directory run rake db:migrate in the terminal. Run the game with "ruby bin/game.rb".

Contributors

If you'd like contribute to this project, we have a few suggestions on where to start. The Polymorphic branch currently suffers from a bug that instantiates objects that are not stored in the database, but also are not stored in variables. It's probably a simple fix, but we don't have time. Fixing that would allow for more flexible inventory functionality, which would significantly increase gameplay options.

License